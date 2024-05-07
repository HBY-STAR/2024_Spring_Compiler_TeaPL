#include "ssa.h"
#include <cassert>
#include <iostream>
#include <list>
#include <stack>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <algorithm>
#include "bg_llvm.h"
#include "graph.hpp"
#include "liveness.h"
#include "printLLVM.h"

#include <fstream>

using namespace std;
using namespace LLVMIR;
using namespace GRAPH;
struct imm_Dominator
{
    LLVMIR::L_block *pred;
    unordered_set<LLVMIR::L_block *> succs;
};

unordered_map<L_block *, unordered_set<L_block *>> dominators;
unordered_map<L_block *, imm_Dominator> tree_dominators;
unordered_map<L_block *, unordered_set<L_block *>> DF_array;
unordered_map<L_block *, Node<LLVMIR::L_block *> *> revers_graph;
unordered_map<Temp_temp *, AS_operand *> temp2ASoper;

static void init_table()
{
    dominators.clear();
    tree_dominators.clear();
    DF_array.clear();
    revers_graph.clear();
    temp2ASoper.clear();
}

LLVMIR::L_prog *SSA(LLVMIR::L_prog *prog)
{
    for (auto &fun : prog->funcs)
    {
        init_table();
        combine_addr(fun);

        std::ofstream debugStream;
        debugStream.open("debug.ll");
        // printL_func(debugStream, fun);
        mem2reg(fun);
        printL_func(debugStream, fun);
        debugStream.close();
        // exit(0);

        auto RA_bg = Create_bg(fun->blocks);

        // Show_graph(stdout,RA_bg);
        SingleSourceGraph(RA_bg.mynodes[0], RA_bg, fun);
        // cout << endl;
        Show_graph(stdout, RA_bg);

        Liveness(RA_bg.mynodes[0], RA_bg, fun->args);
        // Show_Liveness(stdout, RA_bg);
        // exit(0);

        Dominators(RA_bg);
        printf_domi();
        // exit(0);

        tree_Dominators(RA_bg);
        printf_D_tree();
        // exit(0);

        // 默认0是入口block
        computeDF(RA_bg, RA_bg.mynodes[0]);
        printf_DF();
        exit(0);

        Place_phi_fu(RA_bg, fun);
        Rename(RA_bg);
        combine_addr(fun);
    }
    return prog;
}

static bool is_mem_variable(L_stm *stm)
{
    return stm->type == L_StmKind::T_ALLOCA && stm->u.ALLOCA->dst->kind == OperandKind::TEMP && stm->u.ALLOCA->dst->u.TEMP->type == TempType::INT_PTR && stm->u.ALLOCA->dst->u.TEMP->len == 0;
}

// 保证相同的AS_operand地址一样 。常量除外
void combine_addr(LLVMIR::L_func *fun)
{
    unordered_map<Temp_temp *, unordered_set<AS_operand **>> temp_set;
    unordered_map<Name_name *, unordered_set<AS_operand **>> name_set;
    for (auto &block : fun->blocks)
    {
        for (auto &stm : block->instrs)
        {
            auto AS_operand_list = get_all_AS_operand(stm);
            for (auto AS_op : AS_operand_list)
            {
                if ((*AS_op)->kind == OperandKind::TEMP)
                {
                    temp_set[(*AS_op)->u.TEMP].insert(AS_op);
                }
                else if ((*AS_op)->kind == OperandKind::NAME)
                {
                    name_set[(*AS_op)->u.NAME].insert(AS_op);
                }
            }
        }
    }
    for (auto temp : temp_set)
    {
        AS_operand *fi_AS_op = **temp.second.begin();
        for (auto AS_op : temp.second)
        {
            *AS_op = fi_AS_op;
        }
    }
    for (auto name : name_set)
    {
        AS_operand *fi_AS_op = **name.second.begin();
        for (auto AS_op : name.second)
        {
            *AS_op = fi_AS_op;
        }
    }
}

// done
void mem2reg(LLVMIR::L_func *fun)
{
    for (auto block_it = fun->blocks.begin(); block_it != fun->blocks.end(); ++block_it)
    {
        auto block = *block_it;
        for (auto stm_it = block->instrs.begin(); stm_it != block->instrs.end();)
        {
            auto stm = *stm_it;
            if (is_mem_variable(stm))
            {
                temp2ASoper.clear();

                // 获取 ALLOCA 操作数
                Temp_temp *temp = stm->u.ALLOCA->dst->u.TEMP;
                // 删除 ALLOCA 指令
                stm_it = block->instrs.erase(stm_it);

                // 删除 LOAD 和 STORE 指令，并记录相关信息
                for (auto block2_it = fun->blocks.begin(); block2_it != fun->blocks.end(); ++block2_it)
                {
                    auto block2 = *block2_it;
                    for (auto stm2_it = block2->instrs.begin(); stm2_it != block2->instrs.end();)
                    {
                        auto stm2 = *stm2_it;
                        if (stm2->type == L_StmKind::T_LOAD && stm2->u.LOAD->dst->kind == OperandKind::TEMP && stm2->u.LOAD->ptr->u.TEMP == temp)
                        {
                            if (temp2ASoper.find(stm2->u.LOAD->ptr->u.TEMP) != temp2ASoper.end())
                            {
                                temp2ASoper[stm2->u.LOAD->dst->u.TEMP] = temp2ASoper[stm2->u.LOAD->ptr->u.TEMP];
                            }
                            else
                            {
                                temp2ASoper[stm2->u.LOAD->dst->u.TEMP] = stm2->u.LOAD->ptr;
                            }
                            // 删除 LOAD 指令
                            stm2_it = block2->instrs.erase(stm2_it);
                        }
                        else if (stm2->type == L_StmKind::T_STORE && stm2->u.STORE->src->kind == OperandKind::TEMP && stm2->u.STORE->ptr->u.TEMP == temp)
                        {
                            if (temp2ASoper.find(stm2->u.STORE->src->u.TEMP) != temp2ASoper.end())
                            {
                                temp2ASoper[stm2->u.STORE->ptr->u.TEMP] = temp2ASoper[stm2->u.STORE->src->u.TEMP];
                            }
                            else
                            {
                                temp2ASoper[stm2->u.STORE->ptr->u.TEMP] = stm2->u.STORE->src;
                            }
                            // 删除 STORE 指令
                            stm2_it = block2->instrs.erase(stm2_it);
                        }
                        else if (stm2->type == L_StmKind::T_STORE && stm2->u.STORE->src->kind == OperandKind::ICONST &&
                                 stm2->u.STORE->ptr->u.TEMP == temp)
                        {
                            if (temp2ASoper.find(stm2->u.STORE->src->u.TEMP) != temp2ASoper.end())
                            {
                                temp2ASoper[stm2->u.STORE->ptr->u.TEMP] = temp2ASoper[stm2->u.STORE->src->u.TEMP];
                            }
                            else
                            {
                                temp2ASoper[stm2->u.STORE->ptr->u.TEMP] = stm2->u.STORE->src;
                            }
                            // STORE 替换为 MOVE
                            auto move = L_Move(stm2->u.STORE->src, stm2->u.STORE->ptr);
                            stm2_it = block2->instrs.erase(stm2_it);
                            stm2_it = block2->instrs.insert(stm2_it, move);
                        }
                        else
                        {
                            ++stm2_it;
                        }
                    }
                }

                // 替换相关指令中的临时变量
                for (auto block2 : fun->blocks)
                {
                    for (auto stm2 : block2->instrs)
                    {
                        if (stm2->type == L_StmKind::T_MOVE)
                        {
                            continue;
                        }
                        auto AS_operand_list = get_all_AS_operand(stm2);
                        for (auto &AS_op : AS_operand_list)
                        {
                            if ((*AS_op)->kind == OperandKind::TEMP && temp2ASoper.find((*AS_op)->u.TEMP) != temp2ASoper.end())
                            {
                                *AS_op = temp2ASoper[(*AS_op)->u.TEMP];
                            }
                        }
                    }
                }
            }
            else
            {
                ++stm_it;
            }
        }
    }
}

// done
void Dominators(GRAPH::Graph<LLVMIR::L_block *> &bg)
{
    // D[s0] = {s0}
    // D[n] = {n}∪ ( ⋂(D[p]) ) p∈pred(n),  for n∈V-{s0}

    // 初始化，由于赋值使D[n]变小，所以初始化为全集
    std::unordered_set<LLVMIR::L_block *> all_blocks;
    for (auto x : bg.mynodes)
    {
        all_blocks.insert(x.second->nodeInfo());
    }
    for (auto x : bg.mynodes)
    {
        dominators[x.second->nodeInfo()] = all_blocks;
    }

    // D[s0] = {s0}
    dominators[bg.mynodes[0]->nodeInfo()].clear();
    dominators[bg.mynodes[0]->nodeInfo()].insert(bg.mynodes[0]->nodeInfo());

    printf_domi();

    // 迭代计算
    bool change = true;
    while (change)
    {
        change = false;
        for (auto x : bg.mynodes)
        {
            if (x.first == 0)
            {
                continue;
            }

            // D[n] = {n}∪ ( ⋂(D[p]) ) p∈pred(n),  for n∈V-{s0}

            // ⋂(D[p])
            std::unordered_set<LLVMIR::L_block *> new_dominators;
            bool first_flag = true;
            for (auto p : x.second->preds)
            {
                if (first_flag)
                {
                    first_flag = false;
                    new_dominators = dominators[bg.mynodes[p]->nodeInfo()];
                }
                else
                {
                    new_dominators = Intersect(new_dominators, dominators[bg.mynodes[p]->nodeInfo()]);
                }
            }

            // {n}∪ ( ⋂(D[p]) )
            new_dominators.insert(x.second->nodeInfo());

            if (!Set_eq(new_dominators, dominators[x.second->nodeInfo()]))
            {
                change = true;
                dominators[x.second->nodeInfo()] = new_dominators;
            }
        }
    }
}

// 对无序集合求交集
std::unordered_set<LLVMIR::L_block *> Intersect(std::unordered_set<LLVMIR::L_block *> &a, std::unordered_set<LLVMIR::L_block *> &b)
{
    unordered_set<LLVMIR::L_block *> ret;
    for (auto x : a)
    {
        if (b.find(x) != b.end())
        {
            ret.insert(x);
        }
    }
    return ret;
}

// 对无序集合求并集
std::unordered_set<LLVMIR::L_block *> Union(std::unordered_set<LLVMIR::L_block *> &a, std::unordered_set<LLVMIR::L_block *> &b)
{
    unordered_set<LLVMIR::L_block *> ret;
    for (auto x : a)
    {
        ret.insert(x);
    }
    for (auto x : b)
    {
        ret.insert(x);
    }
    return ret;
}

// 求无序集合是否相等
bool Set_eq(std::unordered_set<LLVMIR::L_block *> &a, std::unordered_set<LLVMIR::L_block *> &b)
{
    if (a.size() != b.size())
    {
        return false;
    }
    for (auto x : a)
    {
        if (b.find(x) == b.end())
        {
            return false;
        }
    }
    return true;
}

void printf_domi()
{
    printf("Dominator:\n");
    for (auto x : dominators)
    {
        printf("%s :\n", x.first->label->name.c_str());
        for (auto t : x.second)
        {
            printf("%s ", t->label->name.c_str());
        }
        printf("\n\n");
    }
}

void printf_D_tree()
{
    printf("dominator tree:\n");
    for (auto x : tree_dominators)
    {
        printf("%s :\n", x.first->label->name.c_str());
        for (auto t : x.second.succs)
        {
            printf("%s ", t->label->name.c_str());
        }
        printf("\n\n");
    }
}

void printf_DF()
{
    printf("DF:\n");
    for (auto x : DF_array)
    {
        printf("%s :\n", x.first->label->name.c_str());
        for (auto t : x.second)
        {
            printf("%s ", t->label->name.c_str());
        }
        printf("\n\n");
    }
}

//   Todo
void tree_Dominators(GRAPH::Graph<LLVMIR::L_block *> &bg)
{
    // 由支配节点集合构造支配树
    // idom(n) != n && idom(n) in dom(n) && idom(n) not in dom(dom(n))

    // 初始化
    tree_dominators.clear();

    // 计算支配树
    for (auto x : bg.mynodes)
    {
        LLVMIR::L_block *idom = nullptr;

        // 根节点
        if (x.first == 0)
        {
            continue;
        }

        for (auto y : dominators[x.second->nodeInfo()])
        {
            // idom(n) != n && idom(n) in dom(n)
            if (y == x.second->nodeInfo())
            {
                continue;
            }

            // idom(n) not in dom(dom(n))
            bool flag1 = false;
            for (auto z : dominators[x.second->nodeInfo()])
            {
                if (z == y)
                {
                    continue;
                }
                if (dominators[y].find(z) == dominators[y].end())
                {
                    flag1 = true;
                    break;
                }
            }

            if (flag1)
            {
                idom = y;
                break;
            }
        }

        if (idom != nullptr)
        {
            tree_dominators[x.second->nodeInfo()].pred = idom;
            tree_dominators[idom].succs.insert(x.second->nodeInfo());
        }
    }
}

//   Todo
void computeDF(GRAPH::Graph<LLVMIR::L_block *> &bg, GRAPH::Node<LLVMIR::L_block *> *r)
{
    // 计算支配边界
    // computeDF[n]=
    // S={}
    // for succ[n]中的每一个个结点y		这个循环计算DF_local[n]
    // 	if idom(y)≠n
    // 		S=SU{y}
    // for必经结点树中的n 的每个儿子c
    // 	computeDF[c]
    // 	for DF[c]中的每个元素
    // 		if n不是w的必经结点，或者if n==w
    // 			S=SU{w}
    // DF[n]=S

    // 初始化
    DF_array.clear();

    // 计算支配边界

    DF_array[r->nodeInfo()].clear();

    // S={}
    std::unordered_set<LLVMIR::L_block *> S;

    // for succ[n]中的每一个个结点y		这个循环计算DF_local[n]
    for (auto y : r->succs)
    {
        // if idom(y)≠n
        if (tree_dominators[bg.mynodes[y]->nodeInfo()].pred != r->nodeInfo())
        {
            // S=SU{y}
            S.insert(bg.mynodes[y]->nodeInfo());
        }
    }

    // for必经结点树中的n 的每个儿子c
    for (auto c : tree_dominators[r->nodeInfo()].succs)
    {
        // computeDF[c]
        Node<LLVMIR::L_block *> *nodePtr = nullptr;
        for (auto const &pair : bg.mynodes)
        {
            if (pair.second->nodeInfo() == c)
            {
                nodePtr = pair.second;
                break;
            }
        }

        if (nodePtr == nullptr)
        {
            printf("Error: computeDF\n");
            exit(1);
        }
        else
        {
            computeDF(bg, nodePtr);
        }

        // for DF[c]中的每个元素
        for (auto w : DF_array[c])
        {
            // if n不是w的必经结点，或者if n==w
            if (dominators[r->nodeInfo()].find(w) == dominators[r->nodeInfo()].end() || r->nodeInfo() == w)
            {
                // S=SU{w}
                S.insert(w);
            }
        }
    }

    // DF[n]=S
    DF_array[r->nodeInfo()] = S;
}

// 只对标量做
void Place_phi_fu(GRAPH::Graph<LLVMIR::L_block *> &bg, L_func *fun)
{
    //   Todo
}

static list<AS_operand **> get_def_int_operand(LLVMIR::L_stm *stm)
{
    list<AS_operand **> ret1 = get_def_operand(stm), ret2;
    for (auto AS_op : ret1)
    {
        if ((**AS_op).u.TEMP->type == TempType::INT_TEMP)
        {
            ret2.push_back(AS_op);
        }
    }
    return ret2;
}

static list<AS_operand **> get_use_int_operand(LLVMIR::L_stm *stm)
{
    list<AS_operand **> ret1 = get_use_operand(stm), ret2;
    for (auto AS_op : ret1)
    {
        if ((**AS_op).u.TEMP->type == TempType::INT_TEMP)
        {
            ret2.push_back(AS_op);
        }
    }
    return ret2;
}

static void Rename_temp(GRAPH::Graph<LLVMIR::L_block *> &bg, GRAPH::Node<LLVMIR::L_block *> *n, unordered_map<Temp_temp *, stack<Temp_temp *>> &Stack)
{
    //   Todo
}

void Rename(GRAPH::Graph<LLVMIR::L_block *> &bg)
{
    //   Todo
}