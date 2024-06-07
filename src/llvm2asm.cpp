#include "llvm_ir.h"
#include "asm_arm.h"
#include "temp.h"
#include "llvm2asm.h"
#include "allocReg.h"
#include <queue>
#include <cassert>
#include <iostream>
#include "printASM.h"
#include "printLLVM.h"
#include "register_rules.h"
#include <sstream>
#include <iostream>
using namespace std;
using namespace LLVMIR;
using namespace ASM;

// gdb compiler
// run tests/public/BFS.tea tests/public/BFS.ll < tests/public/BFS.in

#define INSERT1() printf("%s:%d\n", __FILE__, __LINE__);
static int stack_frame;
static bool alloc_frame = false;
struct StructDef
{
    std::vector<int> offset;
    int size;
    StructDef(std::vector<int> _offset, int _size) : offset(_offset), size(_size) {}
};

static AS_reg *sp = new AS_reg(AS_type::SP, -1);
static unordered_map<int, AS_address *> fpOffset;
static unordered_map<int, AS_relopkind> condMap;
static unordered_map<string, StructDef *> structLayout;
int getMemLength(TempDef &members)
{
    switch (members.kind)
    {
    case TempType::INT_PTR:
        return INT_LENGTH * members.len;
        break;
    case TempType::INT_TEMP:
        return INT_LENGTH;
        break;
    case TempType::STRUCT_PTR:
        return structLayout[members.structname]->size * members.len;
        break;
    case TempType::STRUCT_TEMP:
        return structLayout[members.structname]->size;
        break;
    default:
        assert(0);
    }
}

int getTempLength(Temp_temp *temp)
{
    switch (temp->type)
    {
    case TempType::INT_PTR:
        return INT_LENGTH * temp->len;
        break;
    case TempType::INT_TEMP:
        return INT_LENGTH;
        break;
    case TempType::STRUCT_PTR:
        return structLayout[temp->structname]->size * temp->len;
        break;
    case TempType::STRUCT_TEMP:
        return structLayout[temp->structname]->size;
        break;
    default:
        assert(0);
    }
}

void structLayoutInit(vector<L_def *> &defs)
{
    // ToDo:计算结构体各个位置的偏移
    for (auto def : defs)
    {
        if (def->kind == L_DefKind::SRT)
        {
            vector<int> offset;
            int size = 0;
            for (auto member : def->u.SRT->members)
            {
                offset.push_back(size);
                size += getMemLength(member);
            }
            structLayout[def->u.SRT->name] = new StructDef(offset, size);
        }
    }
}

void set_stack(L_func &func)
{
    stack_frame = 0;
    // ToDo:为函数局部变量分配内存，同时记录相对于fp的偏移

    int offset = 0;

    // 遍历函数的所有基本块
    for (const auto &block : func.blocks)
    {
        // 遍历基本块中的所有指令
        for (const auto &instr : block->instrs)
        {
            if (instr->type == L_StmKind::T_ALLOCA)
            {
                int varSize = getTempLength(instr->u.ALLOCA->dst->u.TEMP);
                offset -= varSize;
                fpOffset[instr->u.ALLOCA->dst->u.TEMP->num] = new AS_address(new AS_reg(AS_type::Xn, XnFP), offset);
                stack_frame += varSize;
            }
        }
    }

    stack_frame = ((stack_frame + 15) >> 4) << 4;
}

void new_frame(list<AS_stm *> &as_list, L_func &func)
{
    // ToDo:在刚刚进入函数的时候，需要调整sp，并将函数参数移入虚拟寄存器

    // 保存当前的帧指针（fp）
    // AS_reg *fp = new AS_reg(AS_type::Xn, XXn1);
    // as_list.emplace_back(AS_Mov(new AS_reg(AS_type::IMM, 0), fp));

    // // 调整栈指针 (sp)，为栈帧分配空间
    // as_list.emplace_back(AS_Binop(AS_binopkind::SUB_, sp, fp, sp));

    // 将函数参数移入虚拟寄存器
    for (size_t i = 0; i < func.args.size(); ++i)
    {
        Temp_temp *arg = func.args[i];
        AS_reg *dest_reg = new AS_reg(AS_type::Xn, arg->num);

        if (i < 8)
        {
            // 从寄存器 x0-x7 获取参数
            AS_reg *src_reg = new AS_reg(AS_type::Xn, paramRegs[i]);
            as_list.emplace_back(AS_Mov(src_reg, dest_reg));
        }
        else
        {
            // 从堆栈中获取参数
            int offset = (i - 8) * INT_LENGTH; // 每个参数占用一个整型的空间
            AS_address *src_addr = new AS_address(sp, offset);
            as_list.emplace_back(AS_Ldr(dest_reg, new AS_reg(AS_type::ADR, src_addr)));
        }

        // 记录参数在栈帧中的偏移
        fpOffset[arg->num] = new AS_address(sp, i * INT_LENGTH);
    }
}

void free_frame(list<AS_stm *> &as_list)
{
    as_list.emplace_back(AS_Mov(new AS_reg(AS_type::Xn, XnFP), sp));
}

AS_reg *ASoperand2ASreg(AS_operand *operand)
{
    if (operand->kind == OperandKind::TEMP)
    {
        return new AS_reg(AS_type::Xn, operand->u.TEMP->num);
    }
    else if (operand->kind == OperandKind::ICONST)
    {
        return new AS_reg(AS_type::IMM, operand->u.ICONST);
    }
    else
    {
        assert(0);
    }
}

void llvm2asmBinop(list<AS_stm *> &as_list, L_stm *binop_stm)
{
    bool isLeftImm = false;
    bool isRightImm = false;
    if (binop_stm->u.BINOP->left->kind == OperandKind::ICONST)
    {
        isLeftImm = true;
    }
    if (binop_stm->u.BINOP->right->kind == OperandKind::ICONST)
    {
        isRightImm = true;
    }

    AS_reg *left = ASoperand2ASreg(binop_stm->u.BINOP->left);
    AS_reg *right = ASoperand2ASreg(binop_stm->u.BINOP->right);
    AS_reg *dst = ASoperand2ASreg(binop_stm->u.BINOP->dst);
    switch (binop_stm->u.BINOP->op)
    {
    case L_binopKind::T_plus:
    {
        if (isLeftImm)
        {
            as_list.push_back(AS_Mov(left, dst));
            as_list.push_back(AS_Binop(AS_binopkind::ADD_, dst, right, dst));
        }
        else
        {
            as_list.push_back(AS_Binop(AS_binopkind::ADD_, left, right, dst));
        }
        break;
    }
    case L_binopKind::T_minus:
    {
        if (isLeftImm)
        {
            as_list.push_back(AS_Mov(left, dst));
            as_list.push_back(AS_Binop(AS_binopkind::SUB_, dst, right, dst));
        }
        else
        {
            as_list.push_back(AS_Binop(AS_binopkind::SUB_, left, right, dst));
        }
        break;
    }
    case L_binopKind::T_mul:
    {
        if (isLeftImm && isRightImm)
        {
            assert(0);
        }
        else if (isLeftImm)
        {
            AS_reg *tmp = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
            as_list.push_back(AS_Mov(left, tmp));
            as_list.push_back(AS_Binop(AS_binopkind::MUL_, tmp, right, dst));
        }
        else if (isRightImm)
        {
            AS_reg *tmp = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
            as_list.push_back(AS_Mov(right, tmp));
            as_list.push_back(AS_Binop(AS_binopkind::MUL_, left, tmp, dst));
        }
        else
        {
            as_list.push_back(AS_Binop(AS_binopkind::MUL_, left, right, dst));
        }
        break;
    }
    case L_binopKind::T_div:
    {
        if (isLeftImm && isRightImm)
        {
            assert(0);
        }
        else if (isLeftImm)
        {
            AS_reg *tmp = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
            as_list.push_back(AS_Mov(left, tmp));
            as_list.push_back(AS_Binop(AS_binopkind::SDIV_, tmp, right, dst));
        }
        else if (isRightImm)
        {
            AS_reg *tmp = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
            as_list.push_back(AS_Mov(right, tmp));
            as_list.push_back(AS_Binop(AS_binopkind::SDIV_, left, tmp, dst));
        }
        else
        {
            as_list.push_back(AS_Binop(AS_binopkind::SDIV_, left, right, dst));
        }
        break;
    }
    }
}


void llvm2asmLoad(list<AS_stm *> &as_list, L_stm *load_stm)
{
    if (load_stm->u.LOAD->ptr->kind == OperandKind::TEMP)
    {
        AS_reg *dst = new AS_reg(AS_type::Xn, load_stm->u.LOAD->dst->u.TEMP->num);
        // new AS_address(new AS_reg(AS_type::Xn, load_stm->u.LOAD->ptr->u.TEMP->num), 0)
        AS_reg *ptr = new AS_reg(AS_type::ADR, new AS_address(new AS_reg(AS_type::Xn, load_stm->u.LOAD->ptr->u.TEMP->num), 0));
        as_list.push_back(AS_Ldr(dst, ptr));
        
    }
    else if (load_stm->u.LOAD->ptr->kind == OperandKind::NAME)
    {
        // 获取目标寄存器和全局变量的名称
        AS_reg *dst = new AS_reg(AS_type::Xn, load_stm->u.LOAD->dst->u.TEMP->num);
        std::string global_name = load_stm->u.LOAD->ptr->u.NAME->name->name;

        // 创建临时寄存器来存储中间地址
        // new AS_address(new AS_reg(AS_type::Xn, Temp_newtemp_int()->num), 0)
        AS_reg *tmp_reg = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);

        // adrp指令
        as_list.push_back(AS_Adr(new AS_label(global_name), tmp_reg));

        // ldr指令
        AS_reg *ptr = new AS_reg(AS_type::ADR, new AS_address(tmp_reg, 0));
        as_list.push_back(AS_Ldr(dst, ptr));
    }
    else
    {
        assert(0);
    }
}

void llvm2asmStore(list<AS_stm *> &as_list, L_stm *store_stm)
{
    AS_reg *src;
    if (store_stm->u.STORE->src->kind == OperandKind::ICONST)
    {
        src = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
        as_list.push_back(AS_Mov(new AS_reg(AS_type::IMM, store_stm->u.STORE->src->u.ICONST), src));
    }
    else
    {
        src = new AS_reg(AS_type::Xn, store_stm->u.STORE->src->u.TEMP->num);
    }

    if (store_stm->u.STORE->ptr->kind == OperandKind::TEMP)
    {
        // new AS_address(new AS_reg(AS_type::Xn, store_stm->u.STORE->ptr->u.TEMP->num), 0)
        AS_reg *ptr = new AS_reg(AS_type::ADR,  new AS_address(new AS_reg(AS_type::Xn, store_stm->u.STORE->ptr->u.TEMP->num), 0));
        as_list.push_back(AS_Str(src, ptr));
    }
    else if (store_stm->u.STORE->ptr->kind == OperandKind::NAME)
    {
        // 获取目标寄存器和全局变量的名称
        std::string global_name = store_stm->u.STORE->ptr->u.NAME->name->name;

        // 创建临时寄存器来存储中间地址
        // new AS_address(new AS_reg(AS_type::Xn, Temp_newtemp_int()->num), 0)
        AS_reg *tmp_reg = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);

        // adrp指令
        as_list.push_back(AS_Adr(new AS_label(global_name), tmp_reg));

        // str指令
        AS_reg* ptr = new AS_reg(AS_type::ADR, new AS_address(tmp_reg, 0));
        as_list.push_back(AS_Str(src, ptr));
    }
    else
    {
        assert(0);
    }
}

ASM::AS_relopkind convertRelopKind(LLVMIR::L_relopKind lRelop)
{
    switch (lRelop)
    {
    case LLVMIR::L_relopKind::T_eq:
        return ASM::AS_relopkind::EQ_;
    case LLVMIR::L_relopKind::T_ne:
        return ASM::AS_relopkind::NE_;
    case LLVMIR::L_relopKind::T_lt:
        return ASM::AS_relopkind::LT_;
    case LLVMIR::L_relopKind::T_gt:
        return ASM::AS_relopkind::GT_;
    case LLVMIR::L_relopKind::T_le:
        return ASM::AS_relopkind::LE_;
    case LLVMIR::L_relopKind::T_ge:
        return ASM::AS_relopkind::GE_;
    default:
        throw std::invalid_argument("Unsupported L_relopKind value");
    }
}

void llvm2asmCmp(list<AS_stm *> &as_list, L_stm *cmp_stm)
{
    AS_reg *left = ASoperand2ASreg(cmp_stm->u.CMP->left);
    AS_reg *right = ASoperand2ASreg(cmp_stm->u.CMP->right);
    condMap[cmp_stm->u.CMP->dst->u.TEMP->num] = convertRelopKind(cmp_stm->u.CMP->op);
    as_list.push_back(AS_Cmp(left, right));
}
void llvm2asmMov(list<AS_stm *> &as_list, L_stm *mov_stm)
{
    AS_reg *src = ASoperand2ASreg(mov_stm->u.MOVE->src);
    AS_reg *dst = ASoperand2ASreg(mov_stm->u.MOVE->dst);
    as_list.push_back(AS_Mov(src, dst));
}
void llvm2asmCJmp(list<AS_stm *> &as_list, L_stm *cjmp_stm)
{
    as_list.push_back(AS_BCond(condMap[cjmp_stm->u.CJUMP->dst->u.TEMP->num], new AS_label(cjmp_stm->u.CJUMP->true_label->name)));
    as_list.push_back(AS_B(new AS_label(cjmp_stm->u.CJUMP->false_label->name)));
}

void llvm2asmRet(list<AS_stm *> &as_list, L_stm *ret_stm)
{
    if (ret_stm->u.RETURN->ret)
    {
        AS_reg *ret;
        if (ret_stm->u.RETURN->ret->kind == OperandKind::NAME)
        {
            assert(0);
        }
        else
        {
            ret = ASoperand2ASreg(ret_stm->u.RETURN->ret);
        }
        as_list.push_back(AS_Mov(ret, new AS_reg(AS_type::Xn, XXnret)));
    }
    as_list.push_back(AS_Mov(new AS_reg(AS_type::Xn, XnFP), sp));
    as_list.push_back(AS_Ret());
}

void llvm2asmGep(list<AS_stm *> &as_list, L_stm *gep_stm)
{
    // 获取base_ptr和new_ptr的寄存器
    AS_reg *base_ptr = nullptr;
    AS_reg *new_ptr = new AS_reg(AS_type::Xn, gep_stm->u.GEP->new_ptr->u.TEMP->num);
    AS_reg *index = new AS_reg(AS_type::Xn, gep_stm->u.GEP->index->u.TEMP->num);

    int element_size = 8;

    if (gep_stm->u.GEP->base_ptr->kind == OperandKind::TEMP)
    {
        if (fpOffset.find(gep_stm->u.GEP->base_ptr->u.TEMP->num) == fpOffset.end())
        {
            // 函数参数或中间变量，直接使用base_ptr
            base_ptr = new AS_reg(AS_type::Xn, gep_stm->u.GEP->base_ptr->u.TEMP->num);

            // 计算偏移并得到new_ptr
            AS_reg *element_size_reg = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
            AS_reg *offset = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);

            // mov element size to element_size_reg
            as_list.push_back(AS_Mov(new AS_reg(AS_type::IMM, element_size), element_size_reg));
            // multiply index by element size
            as_list.push_back(AS_Binop(AS_binopkind::MUL_, offset, index, element_size_reg));
            // add base_ptr and offset to get new_ptr
            as_list.push_back(AS_Binop(AS_binopkind::ADD_, base_ptr, offset, new_ptr));
        }
        else
        {
            // 局部变量，使用fpOffset计算base_ptr
            auto it = fpOffset.find(gep_stm->u.GEP->base_ptr->u.TEMP->num);

            base_ptr = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
            AS_reg *offset = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);

            // 计算局部变量的偏移量并加载到base_ptr
            as_list.push_back(AS_Binop(AS_binopkind::ADD_, new AS_reg(AS_type::Xn, XnFP), new AS_reg(AS_type::Xn, it->second), base_ptr));

            // mov element size to element_size_reg
            as_list.push_back(AS_Mov(new AS_reg(AS_type::IMM, element_size), offset));
            // multiply index by element size
            as_list.push_back(AS_Binop(AS_binopkind::MUL_, index, offset, index));
            // add base_ptr and offset to get new_ptr
            as_list.push_back(AS_Binop(AS_binopkind::ADD_, base_ptr, index, new_ptr));
        }
    }
    else if (gep_stm->u.GEP->base_ptr->kind == OperandKind::NAME)
    {
        // 全局变量，使用adr指令获得base_ptr
        base_ptr = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
        AS_reg *offset = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);

        // mov element size to element_size_reg
        as_list.push_back(AS_Mov(new AS_reg(AS_type::IMM, element_size), offset));
        // multiply index by element size
        as_list.push_back(AS_Binop(AS_binopkind::MUL_, index, offset, index));

        // adrp指令
        as_list.push_back(AS_Adr(new AS_label(gep_stm->u.GEP->base_ptr->u.NAME->name->name), base_ptr));

        // add base_ptr and offset to get new_ptr
        as_list.push_back(AS_Binop(AS_binopkind::ADD_, base_ptr, index, new_ptr));
    }
    else
    {
        assert(0);
    }
}

void llvm2asmStm(list<AS_stm *> &as_list, L_stm &stm, L_func &func)
{

    if (!alloc_frame && stm.type != L_StmKind::T_LABEL)
    {
        new_frame(as_list, func);
        alloc_frame = true;
    }

    switch (stm.type)
    {
    case L_StmKind::T_BINOP:
    {
        llvm2asmBinop(as_list, &stm);
        break;
    }
    case L_StmKind::T_LOAD:
    {
        llvm2asmLoad(as_list, &stm);
        break;
    }
    case L_StmKind::T_STORE:
    {
        llvm2asmStore(as_list, &stm);
        break;
    }
    case L_StmKind::T_LABEL:
    {
        auto label = new AS_label(stm.u.LABEL->label->name);
        as_list.push_back(AS_Label(label));
        break;
    }
    case L_StmKind::T_JUMP:
    {
        auto label = new AS_label(stm.u.JUMP->jump->name);
        as_list.push_back(AS_B(label));
        break;
    }
    case L_StmKind::T_CMP:
    {
        llvm2asmCmp(as_list, &stm);
        break;
    }
    case L_StmKind::T_CJUMP:
    {
        llvm2asmCJmp(as_list, &stm);
        break;
    }
    case L_StmKind::T_MOVE:
    {
        llvm2asmMov(as_list, &stm);
        break;
    }
    case L_StmKind::T_CALL:
    {
        llvm2asmCall(as_list, &stm);
        break;
    }
    case L_StmKind::T_VOID_CALL:
    {
        llvm2asmVoidCall(as_list, &stm);
        break;
    }
    case L_StmKind::T_RETURN:
    {
        llvm2asmRet(as_list, &stm);
        break;
    }
    case L_StmKind::T_ALLOCA:
    {
        // Do nothing
        break;
    }
    case L_StmKind::T_GEP:
    {

        llvm2asmGep(as_list, &stm);

        break;
    }
    case L_StmKind::T_PHI:
    {
        // ToDo: 特殊处理
        break;
    }
    case L_StmKind::T_NULL:
    {
        // Do nothing
        break;
    }
    }
    //
}
int save_register(list<AS_stm *> &as_list)
{
    int sub = 0;
    for (auto it = allocateRegs.begin(); it != allocateRegs.end(); ++it)
    {
        // 获取当前元素
        int first = *it;
        ++it; // 移动到下一个元素

        // 检查是否有下一个元素
        if (it != allocateRegs.end())
        {
            int second = *it;
            as_list.push_back(AS_Stp(new AS_reg(AS_type::Xn, first), new AS_reg(AS_type::Xn, second), sp, -2 * INT_LENGTH));
            sub += 2 * INT_LENGTH;
        }
        else
        {
            // 如果`set`中的元素个数是奇数，最后一个元素将单独处理
            as_list.push_back(AS_Str(new AS_reg(AS_type::Xn, first), sp, -INT_LENGTH));
            sub += INT_LENGTH;
            break;
        }
    }
    as_list.push_back(AS_Stp(new AS_reg(AS_type::Xn, XnFP), new AS_reg(AS_type::Xn, XXnl), sp, -2 * INT_LENGTH));
    sub += 2 * INT_LENGTH;
    return sub;
}
void load_register(list<AS_stm *> &as_list)
{
    // ToDo:从栈中按**顺序**加载保存的寄存器

    as_list.push_back(AS_Ldp(new AS_reg(AS_type::Xn, XnFP), new AS_reg(AS_type::Xn, XXnl), sp, 2 * INT_LENGTH));

    int add = 0;
    for (auto it = allocateRegs.rbegin(); it != allocateRegs.rend(); ++it)
    {
        // 获取当前元素
        int first = *it;
        ++it; // 移动到下一个元素

        // 检查是否有下一个元素
        if (it != allocateRegs.rend())
        {
            int second = *it;
            as_list.push_back(AS_Ldp(new AS_reg(AS_type::Xn, first), new AS_reg(AS_type::Xn, second), sp, 2 * INT_LENGTH));
            add += 2 * INT_LENGTH;
        }
        else
        {
            // 如果`set`中的元素个数是奇数，最后一个元素将单独处理
            as_list.push_back(AS_Ldr(new AS_reg(AS_type::Xn, first), sp, INT_LENGTH));
            add += INT_LENGTH;
            break;
        }
    }
}

void getCalls(AS_reg *&op_reg, AS_operand *as_operand, list<AS_stm *> &as_list)
{
    // ToDo:一个工具函数，应该实现将局部变量（这里应该只会出现数组、结构体地址）、全局变量、临时变量加载到目标op_reg等待使用
    if (as_operand->kind == OperandKind::TEMP)
    {
        if (fpOffset.find(as_operand->u.TEMP->num) == fpOffset.end())
        {
            op_reg = new AS_reg(AS_type::Xn, as_operand->u.TEMP->num);
        }
        else
        {
            auto it = fpOffset.find(as_operand->u.TEMP->num);
            op_reg = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
            as_list.push_back(AS_Ldr(op_reg, new AS_reg(AS_type::ADR, it->second)));
        }
    }
    else if (as_operand->kind == OperandKind::NAME)
    {
        op_reg = new AS_reg(AS_type::Xn, Temp_newtemp_int()->num);
        as_list.push_back(AS_Adr(new AS_label(as_operand->u.NAME->name->name), op_reg));
    }
    else if (as_operand->kind == OperandKind::ICONST)
    {
        op_reg = new AS_reg(AS_type::IMM, as_operand->u.ICONST);
    }
    else
    {
        assert(0);
    }
}

void llvm2asmVoidCall(list<AS_stm *> &as_list, L_stm *call)
{

    for (int i = 0; i < 8 && i < call->u.VOID_CALL->args.size(); i++)
    {
        AS_reg *param;
        getCalls(param, call->u.VOID_CALL->args[i], as_list);
        as_list.emplace_back(AS_Mov(param, new AS_reg(AS_type::Xn, paramRegs[i])));
    }
    vector<AS_reg *> abcd;
    for (int i = 8; i < call->u.VOID_CALL->args.size(); i++)
    {
        printf("没有这个测试用例，不用这种情况考虑。");
        assert(0);
    }
    save_register(as_list);
    as_list.push_back(AS_Mov(sp, new AS_reg(AS_type::Xn, XnFP)));
    as_list.emplace_back(AS_Bl(new AS_label(call->u.VOID_CALL->fun)));
    load_register(as_list);
}

void llvm2asmCall(list<AS_stm *> &as_list, L_stm *call)
{

    for (int i = 0; i < 8 && i < call->u.CALL->args.size(); i++)
    {
        AS_reg *param;
        getCalls(param, call->u.CALL->args[i], as_list);

        as_list.emplace_back(AS_Mov(param, new AS_reg(AS_type::Xn, paramRegs[i])));
    }
    if (call->u.CALL->args.size() > 8)
    {
        as_list.push_back(AS_Mov(sp, new AS_reg(AS_type::Xn, XXna)));
        int sub = save_register(as_list);
        as_list.push_back(AS_Mov(new AS_reg(AS_type::Xn, XXna), sp));

        int param_sub = 0;
        for (int i = call->u.CALL->args.size() - 1; i >= 8; i--)
        {
            AS_reg *param;
            getCalls(param, call->u.CALL->args[i], as_list);
            param_sub += INT_LENGTH;
            if (-sub - param_sub < -256)
            {
                auto temp = new AS_reg(AS_type::Xn, XXnb);
                as_list.emplace_back(AS_Mov(new AS_reg(AS_type::IMM, -sub - param_sub), temp));

                as_list.emplace_back(AS_Str(param, new AS_reg(AS_type::ADR, new AS_address(sp, temp))));
            }
            else
            {
                as_list.emplace_back(AS_Str(param, new AS_reg(AS_type::ADR, new AS_address(sp, -sub - param_sub))));
            }
        }
        as_list.emplace_back(AS_Binop(AS_binopkind::SUB_, sp, new AS_reg(AS_type::IMM, sub + param_sub), sp));
    }
    else
    {
        save_register(as_list);
    }
    as_list.push_back(AS_Mov(sp, new AS_reg(AS_type::Xn, XnFP)));

    as_list.emplace_back(AS_Bl(new AS_label(call->u.CALL->fun)));
    if (call->u.CALL->args.size() > 8)
    {
        as_list.emplace_back(AS_Binop(AS_binopkind::ADD_, sp, new AS_reg(AS_type::IMM, (call->u.CALL->args.size() - 8) * INT_LENGTH), sp));
    }
    load_register(as_list);
    as_list.emplace_back(AS_Mov(new AS_reg(AS_type::Xn, XXnret), new AS_reg(AS_type::Xn, call->u.CALL->res->u.TEMP->num)));
}

void allocReg(list<AS_stm *> &as_list, L_func &func)
{
    list<InstructionNode *> liveness;

    forwardLivenessAnalysis(liveness, as_list);

    livenessAnalysis(liveness, as_list);
}
struct BLOCKPHI
{
    string label;
    L_stm *phi;
    BLOCKPHI(string _label, L_stm *_phi) : label(_label), phi(_phi) {}
};

AS_func *llvm2asmFunc(L_func &func)
{
    list<AS_stm *> stms;
    list<BLOCKPHI *> phi;
    unordered_map<string, list<AS_stm *>::iterator> block_map;
    auto p = new AS_func(stms);
    auto func_label = new AS_label(func.name);
    p->stms.push_back(AS_Label(func_label));
    for (auto &x : fpOffset)
    {
        std::ostringstream oss;
        oss << x.first << ":" << printAS_add(x.second).c_str() << endl;
        p->stms.push_back(AS_Llvmir(oss.str()));
    }
    string temp_label = "";
    for (const auto &block : func.blocks)
    {
        for (const auto &instr : block->instrs)
        {
            std::ostringstream oss;
            printL_stm(oss, instr);
            p->stms.push_back(AS_Llvmir(oss.str()));
            llvm2asmStm(p->stms, *instr, func);
            if (instr->type == L_StmKind::T_PHI)
            {
                phi.push_back(new BLOCKPHI(temp_label, instr));
            }
            if (instr->type == L_StmKind::T_LABEL)
            {
                temp_label = instr->u.LABEL->label->name;
            }
            if (temp_label.length() > 0)
            {
                block_map[temp_label] = --p->stms.end();
            }
        }
    }
    // ToDo:处理PHI语句

    for (const auto &block_phi : phi)
    {
        L_stm *phi_stm = block_phi->phi;
        AS_operand *dest = phi_stm->u.PHI->dst; // PHI节点的目标变量

        for (const auto &pred : phi_stm->u.PHI->phis)
        {
            AS_operand *src = pred.first;          // 前驱块中的源变量
            string pred_label = pred.second->name; // 前驱块的标签

            // 创建移动指令：dest = src
            AS_reg *mov_src = ASoperand2ASreg(src);
            AS_reg *mov_dest = ASoperand2ASreg(dest);
            AS_stm *move_stm = AS_Mov(mov_src, mov_dest);

            // 找到前驱块的末尾并插入移动指令
            auto pred_block_iter = block_map.find(pred_label);
            if (pred_block_iter != block_map.end())
            {
                auto insert_pos = std::prev(pred_block_iter->second, 1);
                std::ostringstream oss;
                printL_stm(oss, phi_stm);
                p->stms.insert(insert_pos, AS_Llvmir(oss.str()));
                p->stms.insert(insert_pos, move_stm);
            }
        }
    }
    allocReg(p->stms, func);
    return p;
}

void llvm2asmDecl(vector<AS_decl *> &decls, L_def &def)
{
    switch (def.kind)
    {
    case L_DefKind::GLOBAL:
    {
        return;
    }
    case L_DefKind::FUNC:
    {
        AS_decl *decl = new AS_decl(def.u.FUNC->name);
        decls.push_back(decl);
        break;
    }
    case L_DefKind::SRT:
    {
        return;
    }
    }
}

void llvm2asmGlobal(vector<AS_global *> &globals, L_def &def)
{
    switch (def.kind)
    {
    case L_DefKind::GLOBAL:
    {
        // ToDo
        if (def.u.GLOBAL->def.kind == TempType::INT_TEMP)
        {
            int init = 0;
            if (def.u.GLOBAL->init.size() == 0)
            {
                init = 0;
            }
            else
            {
                init = def.u.GLOBAL->init[0];
            }
            AS_global *global = new AS_global(new AS_label(def.u.GLOBAL->name), init, 1);
            globals.push_back(global);
        }
        else if (def.u.GLOBAL->def.kind == TempType::INT_PTR)
        {
            AS_global *global = new AS_global(new AS_label(def.u.GLOBAL->name), 0, def.u.GLOBAL->def.len * INT_LENGTH);
            globals.push_back(global);
        }
        else if (def.u.GLOBAL->def.kind == TempType::STRUCT_TEMP)
        {
            AS_global *global = new AS_global(new AS_label(def.u.GLOBAL->name), 0, structLayout[def.u.GLOBAL->def.structname]->size);
            globals.push_back(global);
        }
        else if (def.u.GLOBAL->def.kind == TempType::STRUCT_PTR)
        {
            AS_global *global = new AS_global(new AS_label(def.u.GLOBAL->name), 0, def.u.GLOBAL->def.len * structLayout[def.u.GLOBAL->def.structname]->size);
            globals.push_back(global);
        }
        else
        {
            assert(0);
        }

        break;
    }
    case L_DefKind::FUNC:
    {
        return;
    }
    case L_DefKind::SRT:
    {
        return;
    }
    }
}

AS_prog *llvm2asm(L_prog &prog)
{
    std::vector<AS_global *> globals;
    std::vector<AS_decl *> decls;
    std::vector<AS_func *> func_list;

    auto as_prog = new AS_prog(globals, decls, func_list);

    structLayoutInit(prog.defs);

    // translate function decl
    for (const auto &def : prog.defs)
    {
        llvm2asmDecl(as_prog->decls, *def);
    }

    for (const auto &func : prog.funcs)
    {
        AS_decl *decl = new AS_decl(func->name);
        as_prog->decls.push_back(decl);
    }

    // translate global data
    for (const auto &def : prog.defs)
    {
        llvm2asmGlobal(as_prog->globals, *def);
    }

    // translate each llvm function

    for (const auto &func : prog.funcs)
    {
        alloc_frame = false;

        set_stack(*func);

        as_prog->funcs.push_back(llvm2asmFunc(*func));

        fpOffset.clear();
    }

    return as_prog;
}
