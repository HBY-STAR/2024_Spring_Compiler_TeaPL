#include "ast2llvm.h"
#include <vector>
#include <unordered_map>
#include <string>
#include <cassert>
#include <list>
#include <iostream>

using namespace std;
using namespace LLVMIR;

static unordered_map<string, FuncType> funcReturnMap;
static unordered_map<string, StructInfo> structInfoMap;
static unordered_map<string, Name_name *> globalVarMap;
static unordered_map<string, Temp_temp *> localVarMap;
static list<L_stm *> emit_irs;

LLVMIR::L_prog *ast2llvm(aA_program p)
{
    auto defs = ast2llvmProg_first(p);
    auto funcs = ast2llvmProg_second(p);
    vector<L_func *> funcs_block;
    for (const auto &f : funcs)
    {
        funcs_block.push_back(ast2llvmFuncBlock(f));
    }
    for (auto &f : funcs_block)
    {
        ast2llvm_moveAlloca(f);
    }
    return new L_prog(defs, funcs_block);
}

int ast2llvmRightVal_first(aA_rightVal r)
{
    if (r == nullptr)
    {
        return 0;
    }
    switch (r->kind)
    {
    case A_arithExprValKind:
    {
        return ast2llvmArithExpr_first(r->u.arithExpr);
        break;
    }
    case A_boolExprValKind:
    {
        return ast2llvmBoolExpr_first(r->u.boolExpr);
        break;
    }
    default:
        break;
    }
    return 0;
}

int ast2llvmBoolExpr_first(aA_boolExpr b)
{
    switch (b->kind)
    {
    case A_boolBiOpExprKind:
    {
        return ast2llvmBoolBiOpExpr_first(b->u.boolBiOpExpr);
        break;
    }
    case A_boolUnitKind:
    {
        return ast2llvmBoolUnit_first(b->u.boolUnit);
        break;
    }
    default:
        break;
    }
    return 0;
}

int ast2llvmBoolBiOpExpr_first(aA_boolBiOpExpr b)
{
    int l = ast2llvmBoolExpr_first(b->left);
    int r = ast2llvmBoolExpr_first(b->right);
    if (b->op == A_and)
    {
        return l && r;
    }
    else
    {
        return l || r;
    }
}

int ast2llvmBoolUOpExpr_first(aA_boolUOpExpr b)
{
    if (b->op == A_not)
    {
        return !ast2llvmBoolUnit_first(b->cond);
    }
    return 0;
}

int ast2llvmBoolUnit_first(aA_boolUnit b)
{
    switch (b->kind)
    {
    case A_comOpExprKind:
    {
        return ast2llvmComOpExpr_first(b->u.comExpr);
        break;
    }
    case A_boolExprKind:
    {
        return ast2llvmBoolExpr_first(b->u.boolExpr);
        break;
    }
    case A_boolUOpExprKind:
    {
        return ast2llvmBoolUOpExpr_first(b->u.boolUOpExpr);
        break;
    }
    default:
        break;
    }
    return 0;
}

int ast2llvmComOpExpr_first(aA_comExpr c)
{
    auto l = ast2llvmExprUnit_first(c->left);
    auto r = ast2llvmExprUnit_first(c->right);
    switch (c->op)
    {
    case A_lt:
    {
        return l < r;
        break;
    }
    case A_le:
    {
        return l <= r;
        break;
    }
    case A_gt:
    {
        return l > r;
        break;
    }
    case A_ge:
    {
        return l >= r;
        break;
    }
    case A_eq:
    {
        return l == r;
        break;
    }
    case A_ne:
    {
        return l != r;
        break;
    }
    default:
        break;
    }
    return 0;
}

int ast2llvmArithBiOpExpr_first(aA_arithBiOpExpr a)
{
    auto l = ast2llvmArithExpr_first(a->left);
    auto r = ast2llvmArithExpr_first(a->right);
    switch (a->op)
    {
    case A_add:
    {
        return l + r;
        break;
    }
    case A_sub:
    {
        return l - r;
        break;
    }
    case A_mul:
    {
        return l * r;
        break;
    }
    case A_div:
    {
        return l / r;
        break;
    }
    default:
        break;
    }
    return 0;
}

int ast2llvmArithUExpr_first(aA_arithUExpr a)
{
    if (a->op == A_neg)
    {
        return -ast2llvmExprUnit_first(a->expr);
    }
    return 0;
}

int ast2llvmArithExpr_first(aA_arithExpr a)
{
    switch (a->kind)
    {
    case A_arithBiOpExprKind:
    {
        return ast2llvmArithBiOpExpr_first(a->u.arithBiOpExpr);
        break;
    }
    case A_exprUnitKind:
    {
        return ast2llvmExprUnit_first(a->u.exprUnit);
        break;
    }
    default:
        assert(0);
        break;
    }
    return 0;
}

int ast2llvmExprUnit_first(aA_exprUnit e)
{
    if (e->kind == A_numExprKind)
    {
        return e->u.num;
    }
    else if (e->kind == A_arithExprKind)
    {
        return ast2llvmArithExpr_first(e->u.arithExpr);
    }
    else if (e->kind == A_arithUExprKind)
    {
        return ast2llvmArithUExpr_first(e->u.arithUExpr);
    }
    else
    {
        assert(0);
    }
    return 0;
}

std::vector<LLVMIR::L_def *> ast2llvmProg_first(aA_program p)
{
    vector<L_def *> defs;
    defs.push_back(L_Funcdecl("getch", vector<TempDef>(), FuncType(ReturnType::INT_TYPE)));
    defs.push_back(L_Funcdecl("getint", vector<TempDef>(), FuncType(ReturnType::INT_TYPE)));
    defs.push_back(L_Funcdecl("putch", vector<TempDef>{TempDef(TempType::INT_TEMP)}, FuncType(ReturnType::VOID_TYPE)));
    defs.push_back(L_Funcdecl("putint", vector<TempDef>{TempDef(TempType::INT_TEMP)}, FuncType(ReturnType::VOID_TYPE)));
    defs.push_back(L_Funcdecl("putarray", vector<TempDef>{TempDef(TempType::INT_TEMP), TempDef(TempType::INT_PTR, -1)}, FuncType(ReturnType::VOID_TYPE)));
    defs.push_back(L_Funcdecl("_sysy_starttime", vector<TempDef>{TempDef(TempType::INT_TEMP)}, FuncType(ReturnType::VOID_TYPE)));
    defs.push_back(L_Funcdecl("_sysy_stoptime", vector<TempDef>{TempDef(TempType::INT_TEMP)}, FuncType(ReturnType::VOID_TYPE)));
    for (const auto &v : p->programElements)
    {
        switch (v->kind)
        {
        case A_programNullStmtKind:
        {
            break;
        }
        case A_programVarDeclStmtKind:
        {
            if (v->u.varDeclStmt->kind == A_varDeclKind)
            {
                if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclScalarKind)
                {
                    if (v->u.varDeclStmt->u.varDecl->u.declScalar->type->type == A_structTypeKind)
                    {
                        globalVarMap.emplace(*v->u.varDeclStmt->u.varDecl->u.declScalar->id,
                                             Name_newname_struct_ptr(Temp_newlabel_named(*v->u.varDeclStmt->u.varDecl->u.declScalar->id), 0, *v->u.varDeclStmt->u.varDecl->u.declScalar->type->u.structType));
                        TempDef def(TempType::STRUCT_TEMP, 0, *v->u.varDeclStmt->u.varDecl->u.declScalar->type->u.structType);
                        defs.push_back(L_Globaldef(*v->u.varDeclStmt->u.varDecl->u.declScalar->id, def, vector<int>()));
                    }
                    else
                    {
                        globalVarMap.emplace(*v->u.varDeclStmt->u.varDecl->u.declScalar->id,
                                             Name_newname_int_ptr(Temp_newlabel_named(*v->u.varDeclStmt->u.varDecl->u.declScalar->id), 0));
                        TempDef def(TempType::INT_TEMP, 0);
                        defs.push_back(L_Globaldef(*v->u.varDeclStmt->u.varDecl->u.declScalar->id, def, vector<int>()));
                    }
                }
                else if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclArrayKind)
                {
                    if (v->u.varDeclStmt->u.varDecl->u.declArray->type->type == A_structTypeKind)
                    {
                        globalVarMap.emplace(*v->u.varDeclStmt->u.varDecl->u.declArray->id,
                                             Name_newname_struct_ptr(Temp_newlabel_named(*v->u.varDeclStmt->u.varDecl->u.declArray->id), v->u.varDeclStmt->u.varDecl->u.declArray->len, *v->u.varDeclStmt->u.varDecl->u.declArray->type->u.structType));
                        TempDef def(TempType::STRUCT_PTR, v->u.varDeclStmt->u.varDecl->u.declArray->len, *v->u.varDeclStmt->u.varDecl->u.declArray->type->u.structType);
                        defs.push_back(L_Globaldef(*v->u.varDeclStmt->u.varDecl->u.declArray->id, def, vector<int>()));
                    }
                    else
                    {
                        globalVarMap.emplace(*v->u.varDeclStmt->u.varDecl->u.declArray->id,
                                             Name_newname_int_ptr(Temp_newlabel_named(*v->u.varDeclStmt->u.varDecl->u.declArray->id), v->u.varDeclStmt->u.varDecl->u.declArray->len));
                        TempDef def(TempType::INT_PTR, v->u.varDeclStmt->u.varDecl->u.declArray->len);
                        defs.push_back(L_Globaldef(*v->u.varDeclStmt->u.varDecl->u.declArray->id, def, vector<int>()));
                    }
                }
                else
                {
                    assert(0);
                }
            }
            else if (v->u.varDeclStmt->kind == A_varDefKind)
            {
                if (v->u.varDeclStmt->u.varDef->kind == A_varDefScalarKind)
                {
                    if (v->u.varDeclStmt->u.varDef->u.defScalar->type->type == A_structTypeKind)
                    {
                        globalVarMap.emplace(*v->u.varDeclStmt->u.varDef->u.defScalar->id,
                                             Name_newname_struct_ptr(Temp_newlabel_named(*v->u.varDeclStmt->u.varDef->u.defScalar->id), 0, *v->u.varDeclStmt->u.varDef->u.defScalar->type->u.structType));
                        TempDef def(TempType::STRUCT_TEMP, 0, *v->u.varDeclStmt->u.varDef->u.defScalar->type->u.structType);
                        defs.push_back(L_Globaldef(*v->u.varDeclStmt->u.varDef->u.defScalar->id, def, vector<int>()));
                    }
                    else
                    {
                        globalVarMap.emplace(*v->u.varDeclStmt->u.varDef->u.defScalar->id,
                                             Name_newname_int_ptr(Temp_newlabel_named(*v->u.varDeclStmt->u.varDef->u.defScalar->id), 0));
                        TempDef def(TempType::INT_TEMP, 0);
                        vector<int> init;
                        init.push_back(ast2llvmRightVal_first(v->u.varDeclStmt->u.varDef->u.defScalar->val));
                        defs.push_back(L_Globaldef(*v->u.varDeclStmt->u.varDef->u.defScalar->id, def, init));
                    }
                }
                else if (v->u.varDeclStmt->u.varDef->kind == A_varDefArrayKind)
                {
                    if (v->u.varDeclStmt->u.varDef->u.defArray->type->type == A_structTypeKind)
                    {
                        globalVarMap.emplace(*v->u.varDeclStmt->u.varDef->u.defArray->id,
                                             Name_newname_struct_ptr(Temp_newlabel_named(*v->u.varDeclStmt->u.varDef->u.defArray->id), v->u.varDeclStmt->u.varDef->u.defArray->len, *v->u.varDeclStmt->u.varDef->u.defArray->type->u.structType));
                        TempDef def(TempType::STRUCT_PTR, v->u.varDeclStmt->u.varDef->u.defArray->len, *v->u.varDeclStmt->u.varDef->u.defArray->type->u.structType);
                        defs.push_back(L_Globaldef(*v->u.varDeclStmt->u.varDef->u.defArray->id, def, vector<int>()));
                    }
                    else
                    {
                        globalVarMap.emplace(*v->u.varDeclStmt->u.varDef->u.defArray->id,
                                             Name_newname_int_ptr(Temp_newlabel_named(*v->u.varDeclStmt->u.varDef->u.defArray->id), v->u.varDeclStmt->u.varDef->u.defArray->len));
                        TempDef def(TempType::INT_PTR, v->u.varDeclStmt->u.varDef->u.defArray->len);
                        vector<int> init;
                        for (auto &el : v->u.varDeclStmt->u.varDef->u.defArray->vals)
                        {
                            init.push_back(ast2llvmRightVal_first(el));
                        }
                        defs.push_back(L_Globaldef(*v->u.varDeclStmt->u.varDef->u.defArray->id, def, init));
                    }
                }
                else
                {
                    assert(0);
                }
            }
            else
            {
                assert(0);
            }
            break;
        }
        case A_programStructDefKind:
        {
            StructInfo si;
            int off = 0;
            vector<TempDef> members;
            for (const auto &decl : v->u.structDef->varDecls)
            {
                if (decl->kind == A_varDeclScalarKind)
                {
                    if (decl->u.declScalar->type->type == A_structTypeKind)
                    {
                        TempDef def(TempType::STRUCT_TEMP, 0, *decl->u.declScalar->type->u.structType);
                        MemberInfo info(off++, def);
                        si.memberinfos.emplace(*decl->u.declScalar->id, info);
                        members.push_back(def);
                    }
                    else
                    {
                        TempDef def(TempType::INT_TEMP, 0);
                        MemberInfo info(off++, def);
                        si.memberinfos.emplace(*decl->u.declScalar->id, info);
                        members.push_back(def);
                    }
                }
                else if (decl->kind == A_varDeclArrayKind)
                {
                    if (decl->u.declArray->type->type == A_structTypeKind)
                    {
                        TempDef def(TempType::STRUCT_PTR, decl->u.declArray->len, *decl->u.declArray->type->u.structType);
                        MemberInfo info(off++, def);
                        si.memberinfos.emplace(*decl->u.declArray->id, info);
                        members.push_back(def);
                    }
                    else
                    {
                        TempDef def(TempType::INT_PTR, decl->u.declArray->len);
                        MemberInfo info(off++, def);
                        si.memberinfos.emplace(*decl->u.declArray->id, info);
                        members.push_back(def);
                    }
                }
                else
                {
                    assert(0);
                }
            }
            structInfoMap.emplace(*v->u.structDef->id, std::move(si));
            defs.push_back(L_Structdef(*v->u.structDef->id, members));
            break;
        }
        case A_programFnDeclStmtKind:
        {
            FuncType type;
            if (v->u.fnDeclStmt->fnDecl->type == nullptr)
            {
                type.type = ReturnType::VOID_TYPE;
            }
            else if (v->u.fnDeclStmt->fnDecl->type->type == A_nativeTypeKind)
            {
                type.type = ReturnType::INT_TYPE;
            }
            else if (v->u.fnDeclStmt->fnDecl->type->type == A_structTypeKind)
            {
                type.type = ReturnType::STRUCT_TYPE;
                type.structname = *v->u.fnDeclStmt->fnDecl->type->u.structType;
            }
            else
            {
                assert(0);
            }
            if (funcReturnMap.find(*v->u.fnDeclStmt->fnDecl->id) == funcReturnMap.end())
                funcReturnMap.emplace(*v->u.fnDeclStmt->fnDecl->id, std::move(type));
            vector<TempDef> args;
            for (const auto &decl : v->u.fnDeclStmt->fnDecl->paramDecl->varDecls)
            {
                if (decl->kind == A_varDeclScalarKind)
                {
                    if (decl->u.declScalar->type->type == A_structTypeKind)
                    {
                        TempDef def(TempType::STRUCT_PTR, 0, *decl->u.declScalar->type->u.structType);
                        args.push_back(def);
                    }
                    else
                    {
                        TempDef def(TempType::INT_TEMP, 0);
                        args.push_back(def);
                    }
                }
                else if (decl->kind == A_varDeclArrayKind)
                {
                    if (decl->u.declArray->type->type == A_structTypeKind)
                    {
                        TempDef def(TempType::STRUCT_PTR, -1, *decl->u.declArray->type->u.structType);
                        args.push_back(def);
                    }
                    else
                    {
                        TempDef def(TempType::INT_PTR, -1);
                        args.push_back(def);
                    }
                }
                else
                {
                    assert(0);
                }
            }
            defs.push_back(L_Funcdecl(*v->u.fnDeclStmt->fnDecl->id, args, type));
            break;
        }
        case A_programFnDefKind:
        {
            if (funcReturnMap.find(*v->u.fnDef->fnDecl->id) == funcReturnMap.end())
            {
                FuncType type;
                if (v->u.fnDef->fnDecl->type == nullptr)
                {
                    type.type = ReturnType::VOID_TYPE;
                }
                else if (v->u.fnDef->fnDecl->type->type == A_nativeTypeKind)
                {
                    type.type = ReturnType::INT_TYPE;
                }
                else if (v->u.fnDef->fnDecl->type->type == A_structTypeKind)
                {
                    type.type = ReturnType::STRUCT_TYPE;
                    type.structname = *v->u.fnDef->fnDecl->type->u.structType;
                }
                else
                {
                    assert(0);
                }
                funcReturnMap.emplace(*v->u.fnDef->fnDecl->id, std::move(type));
            }
            break;
        }
        default:
            assert(0);
            break;
        }
    }
    return defs;
}

std::vector<Func_local *> ast2llvmProg_second(aA_program p)
{
    vector<Func_local *> funcs;
    for (const auto &v : p->programElements)
    {
        switch (v->kind)
        {
        case A_programNullStmtKind:
        {
            break;
        }
        case A_programVarDeclStmtKind:
        {
            break;
        }
        case A_programStructDefKind:
        {
            break;
        }
        case A_programFnDeclStmtKind:
        {
            break;
        }
        case A_programFnDefKind:
        {
            funcs.push_back(ast2llvmFunc(v->u.fnDef));
            break;
        }
        default:
            assert(0);
            break;
        }
    }
    return funcs;
}

// done
Func_local *ast2llvmFunc(aA_fnDef f)
{
    emit_irs.clear();
    localVarMap.clear();

    Temp_label *func_first_label = Temp_newlabel_named(*f->fnDecl->id);
    emit_irs.push_back(L_Label(func_first_label));

    // 处理函数参数
    vector<Temp_temp *> args;
    // 保存参数
    for (const auto &decl : f->fnDecl->paramDecl->varDecls)
    {
        if (decl->kind == A_varDeclScalarKind)
        {
            Temp_temp *temp;
            Temp_temp *new_temp;
            if (decl->u.declScalar->type->type == A_structTypeKind)
            {
                temp = Temp_newtemp_struct_ptr(0, *decl->u.declScalar->type->u.structType);
                // new_temp = Temp_newtemp_struct_ptr(0, *decl->u.declScalar->type->u.structType);

                args.push_back(temp);

                // emit_irs.push_back(L_Alloca(AS_Operand_Temp(new_temp)));
                // emit_irs.push_back(L_Store(AS_Operand_Temp(temp), AS_Operand_Temp(new_temp)));

                localVarMap.emplace(*decl->u.declArray->id, temp);
            }
            else
            {
                temp = Temp_newtemp_int();
                new_temp = Temp_newtemp_int_ptr(0);

                args.push_back(temp);

                emit_irs.push_back(L_Alloca(AS_Operand_Temp(new_temp)));
                emit_irs.push_back(L_Store(AS_Operand_Temp(temp), AS_Operand_Temp(new_temp)));
                localVarMap.emplace(*decl->u.declScalar->id, new_temp);
            }
        }
        else if (decl->kind == A_varDeclArrayKind)
        {
            Temp_temp *temp;
            // Temp_temp *new_temp;
            if (decl->u.declArray->type->type == A_structTypeKind)
            {
                temp = Temp_newtemp_struct_ptr(decl->u.declArray->len, *decl->u.declArray->type->u.structType);
                // new_temp = Temp_newtemp_struct_ptr(decl->u.declArray->len, *decl->u.declArray->type->u.structType);
            }
            else
            {
                temp = Temp_newtemp_int_ptr(decl->u.declArray->len);
                // new_temp = Temp_newtemp_int_ptr(decl->u.declArray->len);
            }
            args.push_back(temp);

            // emit_irs.push_back(L_Alloca(AS_Operand_Temp(new_temp)));
            // emit_irs.push_back(L_Store(AS_Operand_Temp(temp), AS_Operand_Temp(new_temp)));

            localVarMap.emplace(*decl->u.declArray->id, temp);
        }
        else
        {
            assert(0);
        }
    }
    // IR
    // for (const auto &arg : args)
    // {
    //     Temp_temp *temp;
    //     if (arg->type == TempType::INT_TEMP)
    //     {
    //         temp = Temp_newtemp_int_ptr(0);
    //     }
    //     else if (arg->type == TempType::INT_PTR)
    //     {
    //         temp = Temp_newtemp_int_ptr(arg->len);
    //     }
    //     else if (arg->type == TempType::STRUCT_TEMP)
    //     {
    //         temp = Temp_newtemp_struct_ptr(0, arg->structname);
    //     }
    //     else if (arg->type == TempType::STRUCT_PTR)
    //     {
    //         temp = Temp_newtemp_struct_ptr(arg->len, arg->structname);
    //     }
    //     else
    //     {
    //         assert(0);
    //     }
    //     localVarMap.emplace(arg->varname, temp);
    //     emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
    //     emit_irs.push_back(L_Store(AS_Operand_Temp(arg), AS_Operand_Temp(temp)));
    // }

    // 处理函数体
    for (const auto &v : f->stmts)
    {
        // 跳过空语句
        if (v->kind == A_nullStmtKind)
        {
            continue;
        }
        // 变量声明语句
        else if (v->kind == A_varDeclStmtKind)
        {
            // 仅声明
            if (v->u.varDeclStmt->kind == A_varDeclKind)
            {
                // 标量声明
                if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclScalarKind)
                {
                    // STRUCT 声明
                    if (v->u.varDeclStmt->u.varDecl->u.declScalar->type->type == A_structTypeKind)
                    {
                        Temp_temp *temp = Temp_newtemp_struct_ptr(0, *v->u.varDeclStmt->u.varDecl->u.declScalar->type->u.structType);
                        localVarMap.emplace(*v->u.varDeclStmt->u.varDecl->u.declScalar->id, temp);

                        // IR
                        emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                    }
                    // INT 声明
                    else
                    {
                        Temp_temp *temp = Temp_newtemp_int_ptr(0);
                        localVarMap.emplace(*v->u.varDeclStmt->u.varDecl->u.declScalar->id, temp);

                        // IR
                        emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                    }
                }
                // 数组声明
                else if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclArrayKind)
                {
                    // STRUCT 数组声明
                    if (v->u.varDeclStmt->u.varDecl->u.declArray->type->type == A_structTypeKind)
                    {
                        Temp_temp *temp = Temp_newtemp_struct_ptr(v->u.varDeclStmt->u.varDecl->u.declArray->len, *v->u.varDeclStmt->u.varDecl->u.declArray->type->u.structType);
                        localVarMap.emplace(*v->u.varDeclStmt->u.varDecl->u.declArray->id, temp);

                        // IR
                        emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                    }
                    // INT 数组声明
                    else
                    {
                        Temp_temp *temp = Temp_newtemp_int_ptr(v->u.varDeclStmt->u.varDecl->u.declArray->len);
                        localVarMap.emplace(*v->u.varDeclStmt->u.varDecl->u.declArray->id, temp);

                        // IR
                        emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                    }
                }
                else
                {
                    assert(0);
                }
            }
            // 定义
            else if (v->u.varDeclStmt->kind == A_varDefKind)
            {
                // 标量定义
                if (v->u.varDeclStmt->u.varDef->kind == A_varDefScalarKind)
                {
                    // STRUCT 定义
                    // 暂不支持
                    if (v->u.varDeclStmt->u.varDef->u.defScalar->type->type == A_structTypeKind)
                    {
                        Temp_temp *temp = Temp_newtemp_struct_ptr(0, *v->u.varDeclStmt->u.varDef->u.defScalar->type->u.structType);
                        localVarMap.emplace(*v->u.varDeclStmt->u.varDef->u.defScalar->id, temp);

                        // IR
                        emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                        emit_irs.push_back(L_Store(ast2llvmRightVal(v->u.varDeclStmt->u.varDef->u.defScalar->val), AS_Operand_Temp(temp)));
                    }
                    // INT 定义
                    else
                    {
                        Temp_temp *temp = Temp_newtemp_int_ptr(0);
                        localVarMap.emplace(*v->u.varDeclStmt->u.varDef->u.defScalar->id, temp);

                        // IR
                        emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                        emit_irs.push_back(L_Store(ast2llvmRightVal(v->u.varDeclStmt->u.varDef->u.defScalar->val), AS_Operand_Temp(temp)));
                    }
                }
                // 数组定义
                else if (v->u.varDeclStmt->u.varDef->kind == A_varDefArrayKind)
                {
                    // STRUCT 数组定义
                    if (v->u.varDeclStmt->u.varDef->u.defArray->type->type == A_structTypeKind)
                    {
                        Temp_temp *temp = Temp_newtemp_struct_ptr(v->u.varDeclStmt->u.varDef->u.defArray->len, *v->u.varDeclStmt->u.varDef->u.defArray->type->u.structType);
                        localVarMap.emplace(*v->u.varDeclStmt->u.varDef->u.defArray->id, temp);

                        // IR
                        emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                        for (int i = 0; i < v->u.varDeclStmt->u.varDef->u.defArray->vals.size(); i++)
                        {
                            Temp_temp *new_temp = Temp_newtemp_struct_ptr(0, *v->u.varDeclStmt->u.varDef->u.defArray->type->u.structType);
                            emit_irs.push_back(L_Gep(AS_Operand_Temp(new_temp), AS_Operand_Temp(temp), AS_Operand_Const(i)));
                            emit_irs.push_back(L_Store(ast2llvmRightVal(v->u.varDeclStmt->u.varDef->u.defArray->vals[i]), AS_Operand_Temp(new_temp)));
                        }
                    }
                    // INT 数组定义
                    else
                    {
                        Temp_temp *temp = Temp_newtemp_int_ptr(v->u.varDeclStmt->u.varDef->u.defArray->len);
                        localVarMap.emplace(*v->u.varDeclStmt->u.varDef->u.defArray->id, temp);

                        // IR
                        emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                        for (int i = 0; i < v->u.varDeclStmt->u.varDef->u.defArray->vals.size(); i++)
                        {
                            Temp_temp *new_temp = Temp_newtemp_int_ptr(0);
                            emit_irs.push_back(L_Gep(AS_Operand_Temp(new_temp), AS_Operand_Temp(temp), AS_Operand_Const(i)));
                            emit_irs.push_back(L_Store(ast2llvmRightVal(v->u.varDeclStmt->u.varDef->u.defArray->vals[i]), AS_Operand_Temp(new_temp)));
                        }
                    }
                }
                else
                {
                    assert(0);
                }
            }
            else
            {
                assert(0);
            }
        }
        // 赋值语句
        else if (v->kind == A_assignStmtKind)
        {
            emit_irs.push_back(L_Store(ast2llvmRightVal(v->u.assignStmt->rightVal), ast2llvmLeftVal(v->u.assignStmt->leftVal)));
        }
        // 函数调用语句
        else if (v->kind == A_callStmtKind)
        {
            vector<AS_operand *> args;
            for (const auto &arg : v->u.callStmt->fnCall->vals)
            {
                // if (arg->u.arithExpr->u.exprUnit->kind == A_idExprKind)
                //     cout << "arg: " << *arg->u.arithExpr->u.exprUnit->u.id << endl;
                args.push_back(ast2llvmRightVal(arg));
            }
            emit_irs.push_back(L_Voidcall(*v->u.callStmt->fnCall->fn, args));
        }
        // if 语句
        else if (v->kind == A_ifStmtKind)
        {
            Temp_label *true_label = Temp_newlabel();
            Temp_label *false_label = Temp_newlabel();
            Temp_label *end_label = Temp_newlabel();
            AS_operand *cond = ast2llvmBoolExpr(v->u.ifStmt->boolExpr, true_label, false_label);
            emit_irs.push_back(L_Cjump(cond, true_label, false_label));
            emit_irs.push_back(L_Label(true_label));

            // 保存当前栈
            unordered_map<string, Temp_temp *> old_localVarMap(localVarMap);
            for (const auto &stmt : v->u.ifStmt->ifStmts)
            {
                ast2llvmBlock(stmt, nullptr, nullptr);
            }
            // 恢复栈
            localVarMap = old_localVarMap;

            emit_irs.push_back(L_Jump(end_label));
            emit_irs.push_back(L_Label(false_label));

            // 保存当前栈
            old_localVarMap = localVarMap;
            for (const auto &stmt : v->u.ifStmt->elseStmts)
            {
                ast2llvmBlock(stmt, nullptr, nullptr);
            }
            // 恢复栈
            localVarMap = old_localVarMap;

            emit_irs.push_back(L_Jump(end_label));
            emit_irs.push_back(L_Label(end_label));
        }
        // while 语句
        else if (v->kind == A_whileStmtKind)
        {
            Temp_label *while_test = Temp_newlabel();
            Temp_label *while_true = Temp_newlabel();
            Temp_label *while_false = Temp_newlabel();
            emit_irs.push_back(L_Jump(while_test));
            emit_irs.push_back(L_Label(while_test));
            AS_operand *cond = ast2llvmBoolExpr(v->u.whileStmt->boolExpr, while_true, while_false);
            emit_irs.push_back(L_Cjump(cond, while_true, while_false));
            emit_irs.push_back(L_Label(while_true));

            // 保存当前栈
            unordered_map<string, Temp_temp *> old_localVarMap(localVarMap);
            for (const auto &stmt : v->u.whileStmt->whileStmts)
            {
                ast2llvmBlock(stmt, while_test, while_false);
            }
            // 恢复栈
            localVarMap = old_localVarMap;

            emit_irs.push_back(L_Jump(while_test));
            emit_irs.push_back(L_Label(while_false));
        }
        // return 语句
        else if (v->kind == A_returnStmtKind)
        {
            if (v->u.returnStmt->retVal == nullptr)
            {
                emit_irs.push_back(L_Ret(nullptr));
            }
            else
            {
                emit_irs.push_back(L_Ret(ast2llvmRightVal(v->u.returnStmt->retVal)));
            }
        }
        // continue 语句
        else if (v->kind == A_continueStmtKind)
        {
            continue;
        }
        // break 语句
        else if (v->kind == A_breakStmtKind)
        {
            continue;
        }
        else
        {
            assert(0);
        }
    }
    return new Func_local(*f->fnDecl->id, funcReturnMap[*f->fnDecl->id], args, emit_irs);
}

// done
void ast2llvmBlock(aA_codeBlockStmt b, Temp_label *con_label, Temp_label *bre_label)
{
    if (b->kind == A_nullStmtKind)
    {
        return;
    }
    else if (b->kind == A_varDeclStmtKind)
    {
        // 仅声明
        if (b->u.varDeclStmt->kind == A_varDeclKind)
        {
            // 标量声明
            if (b->u.varDeclStmt->u.varDecl->kind == A_varDeclScalarKind)
            {
                // STRUCT 声明
                if (b->u.varDeclStmt->u.varDecl->u.declScalar->type->type == A_structTypeKind)
                {
                    Temp_temp *temp = Temp_newtemp_struct_ptr(0, *b->u.varDeclStmt->u.varDecl->u.declScalar->type->u.structType);
                    localVarMap.emplace(*b->u.varDeclStmt->u.varDecl->u.declScalar->id, temp);

                    // IR
                    emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                }
                // INT 声明
                else
                {
                    Temp_temp *temp = Temp_newtemp_int_ptr(0);
                    localVarMap.emplace(*b->u.varDeclStmt->u.varDecl->u.declScalar->id, temp);

                    // IR
                    emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                }
            }
            // 数组声明
            else if (b->u.varDeclStmt->u.varDecl->kind == A_varDeclArrayKind)
            {
                // STRUCT 数组声明
                if (b->u.varDeclStmt->u.varDecl->u.declArray->type->type == A_structTypeKind)
                {
                    Temp_temp *temp = Temp_newtemp_struct_ptr(b->u.varDeclStmt->u.varDecl->u.declArray->len, *b->u.varDeclStmt->u.varDecl->u.declArray->type->u.structType);
                    localVarMap.emplace(*b->u.varDeclStmt->u.varDecl->u.declArray->id, temp);

                    // IR
                    emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                }
                // INT 数组声明
                else
                {
                    Temp_temp *temp = Temp_newtemp_int_ptr(b->u.varDeclStmt->u.varDecl->u.declArray->len);
                    localVarMap.emplace(*b->u.varDeclStmt->u.varDecl->u.declArray->id, temp);
                }
            }
        }
        // 定义
        else if (b->u.varDeclStmt->kind == A_varDefKind)
        {
            // 标量定义
            if (b->u.varDeclStmt->u.varDef->kind == A_varDefScalarKind)
            {
                // STRUCT 定义
                // 暂不支持
                if (b->u.varDeclStmt->u.varDef->u.defScalar->type->type == A_structTypeKind)
                {
                    Temp_temp *temp = Temp_newtemp_struct_ptr(0, *b->u.varDeclStmt->u.varDef->u.defScalar->type->u.structType);
                    localVarMap.emplace(*b->u.varDeclStmt->u.varDef->u.defScalar->id, temp);

                    // IR
                    emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                    emit_irs.push_back(L_Store(ast2llvmRightVal(b->u.varDeclStmt->u.varDef->u.defScalar->val), AS_Operand_Temp(temp)));
                }
                // INT 定义
                else
                {
                    Temp_temp *temp = Temp_newtemp_int_ptr(0);
                    localVarMap.emplace(*b->u.varDeclStmt->u.varDef->u.defScalar->id, temp);

                    // IR
                    emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                    emit_irs.push_back(L_Store(ast2llvmRightVal(b->u.varDeclStmt->u.varDef->u.defScalar->val), AS_Operand_Temp(temp)));
                }
            }
            // 数组定义
            else if (b->u.varDeclStmt->u.varDef->kind == A_varDefArrayKind)
            {
                // STRUCT 数组定义
                if (b->u.varDeclStmt->u.varDef->u.defArray->type->type == A_structTypeKind)
                {
                    Temp_temp *temp = Temp_newtemp_struct_ptr(b->u.varDeclStmt->u.varDef->u.defArray->len, *b->u.varDeclStmt->u.varDef->u.defArray->type->u.structType);
                    localVarMap.emplace(*b->u.varDeclStmt->u.varDef->u.defArray->id, temp);

                    // IR
                    emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                    for (int i = 0; i < b->u.varDeclStmt->u.varDef->u.defArray->vals.size(); i++)
                    {
                        Temp_temp *new_temp = Temp_newtemp_struct_ptr(0, *b->u.varDeclStmt->u.varDef->u.defArray->type->u.structType);
                        emit_irs.push_back(L_Gep(AS_Operand_Temp(new_temp), AS_Operand_Temp(temp), AS_Operand_Const(i)));
                        emit_irs.push_back(L_Store(ast2llvmRightVal(b->u.varDeclStmt->u.varDef->u.defArray->vals[i]), AS_Operand_Temp(new_temp)));
                    }
                }
                // INT 数组定义
                else
                {
                    Temp_temp *temp = Temp_newtemp_int_ptr(b->u.varDeclStmt->u.varDef->u.defArray->len);
                    localVarMap.emplace(*b->u.varDeclStmt->u.varDef->u.defArray->id, temp);

                    // IR
                    emit_irs.push_back(L_Alloca(AS_Operand_Temp(temp)));
                    for (int i = 0; i < b->u.varDeclStmt->u.varDef->u.defArray->vals.size(); i++)
                    {
                        Temp_temp *new_temp = Temp_newtemp_int_ptr(0);
                        emit_irs.push_back(L_Gep(AS_Operand_Temp(new_temp), AS_Operand_Temp(temp), AS_Operand_Const(i)));
                        emit_irs.push_back(L_Store(ast2llvmRightVal(b->u.varDeclStmt->u.varDef->u.defArray->vals[i]), AS_Operand_Temp(new_temp)));
                    }
                }
            }
            else
            {
                assert(0);
            }
        }
    }
    else if (b->kind == A_assignStmtKind)
    {
        emit_irs.push_back(L_Store(ast2llvmRightVal(b->u.assignStmt->rightVal), ast2llvmLeftVal(b->u.assignStmt->leftVal)));
    }
    else if (b->kind == A_callStmtKind)
    {
        vector<AS_operand *> args;
        for (const auto &arg : b->u.callStmt->fnCall->vals)
        {
            args.push_back(ast2llvmRightVal(arg));
        }
        emit_irs.push_back(L_Voidcall(*b->u.callStmt->fnCall->fn, args));
    }
    else if (b->kind == A_ifStmtKind)
    {
        Temp_label *true_label = Temp_newlabel();
        Temp_label *false_label = Temp_newlabel();
        Temp_label *end_label = Temp_newlabel();
        AS_operand *cond = ast2llvmBoolExpr(b->u.ifStmt->boolExpr, true_label, false_label);
        emit_irs.push_back(L_Cjump(cond, true_label, false_label));
        emit_irs.push_back(L_Label(true_label));

        // 保存当前栈
        unordered_map<string, Temp_temp *> old_localVarMap(localVarMap);
        for (const auto &stmt : b->u.ifStmt->ifStmts)
        {
            ast2llvmBlock(stmt, con_label, bre_label);
        }
        // 恢复栈
        localVarMap = old_localVarMap;

        emit_irs.push_back(L_Jump(end_label));
        emit_irs.push_back(L_Label(false_label));

        // 保存当前栈
        old_localVarMap = localVarMap;
        for (const auto &stmt : b->u.ifStmt->elseStmts)
        {
            ast2llvmBlock(stmt, con_label, bre_label);
        }
        // 恢复栈
        localVarMap = old_localVarMap;

        emit_irs.push_back(L_Jump(end_label));
        emit_irs.push_back(L_Label(end_label));
    }
    else if (b->kind == A_whileStmtKind)
    {
        Temp_label *while_test = Temp_newlabel();
        Temp_label *while_true = Temp_newlabel();
        Temp_label *while_false = Temp_newlabel();
        emit_irs.push_back(L_Jump(while_test));
        emit_irs.push_back(L_Label(while_test));
        AS_operand *cond = ast2llvmBoolExpr(b->u.whileStmt->boolExpr, while_true, while_false);
        emit_irs.push_back(L_Cjump(cond, while_true, while_false));
        emit_irs.push_back(L_Label(while_true));

        // 保存当前栈
        unordered_map<string, Temp_temp *> old_localVarMap(localVarMap);
        for (const auto &stmt : b->u.whileStmt->whileStmts)
        {
            ast2llvmBlock(stmt, while_test, while_false);
        }
        // 恢复栈
        localVarMap = old_localVarMap;

        emit_irs.push_back(L_Jump(while_test));
        emit_irs.push_back(L_Label(while_false));
    }
    else if (b->kind == A_returnStmtKind)
    {
        if (b->u.returnStmt->retVal == nullptr)
        {
            emit_irs.push_back(L_Ret(nullptr));
        }
        else
        {
            emit_irs.push_back(L_Ret(ast2llvmRightVal(b->u.returnStmt->retVal)));
        }
    }
    else if (b->kind == A_continueStmtKind)
    {
        if (con_label)
        {
            emit_irs.push_back(L_Jump(con_label));
        }
    }
    else if (b->kind == A_breakStmtKind)
    {
        if (bre_label)
        {
            emit_irs.push_back(L_Jump(bre_label));
        }
    }
    else
    {
        assert(0);
    }
}

// done
AS_operand *ast2llvmRightVal(aA_rightVal r)
{
    if (r == nullptr)
    {
        return nullptr;
    }
    switch (r->kind)
    {
    case A_arithExprValKind:
    {
        return ast2llvmArithExpr(r->u.arithExpr);
        break;
    }
    case A_boolExprValKind:
    {
        AS_operand* res = ast2llvmBoolExpr(r->u.boolExpr, nullptr, nullptr);
        Temp_temp *temp = Temp_newtemp_int();
        emit_irs.push_back(L_Zext(res, AS_Operand_Temp(temp)));
        return AS_Operand_Temp(temp);
        break;
    }
    default:
        printf("ast2llvmRightVal error\n");
        exit(0);
        break;
    }
}

AS_operand *ast2llvmLeftVal(aA_leftVal l)
{
    if (l->kind == A_varValKind)
    {
        return findVal(*l->u.id);
    }
    else if (l->kind == A_arrValKind)
    {
        return ast2llvmArrayExpr(l->u.arrExpr);
    }
    else if (l->kind == A_memberValKind)
    {
        return ast2llvmMemberExpr(l->u.memberExpr);
    }
    else
    {
        assert(0);
    }
}

AS_operand *ast2llvmIndexExpr(aA_indexExpr index)
{
    if (index->kind == A_numIndexKind)
    {
        return AS_Operand_Const(index->u.num);
    }
    else if (index->kind == A_idIndexKind)
    {
        Temp_temp *temp = Temp_newtemp_int_ptr(0);
        emit_irs.push_back(L_Load(AS_Operand_Temp(temp), findVal(*index->u.id)));
        return AS_Operand_Temp(temp);
    }
    else
    {
        assert(0);
    }
}

// done
AS_operand *ast2llvmBoolExpr(aA_boolExpr b, Temp_label *true_label, Temp_label *false_label)
{
    switch (b->kind)
    {
    case A_boolBiOpExprKind:
    {
        return ast2llvmBoolBiOpExpr(b->u.boolBiOpExpr, true_label, false_label);
        break;
    }
    case A_boolUnitKind:
    {
        return ast2llvmBoolUnit(b->u.boolUnit, true_label, false_label);
        break;
    }
    default:
        assert(0);
        break;
    }
}

// done
AS_operand *ast2llvmBoolBiOpExpr(aA_boolBiOpExpr b, Temp_label *true_label, Temp_label *false_label)
{
    if (b->op == A_and)
    {
        Temp_temp *res_temp = Temp_newtemp_int();
        AS_operand *res = AS_Operand_Temp(res_temp);

        Temp_label *l_true = Temp_newlabel();
        AS_operand *l_res = ast2llvmBoolExpr(b->left, l_true, false_label);
        res = l_res;

        emit_irs.push_back(L_Jump(l_true));
        emit_irs.push_back(L_Label(l_true));
        AS_operand *r_res = ast2llvmBoolExpr(b->right, true_label, false_label);
        res = r_res;

        if (true_label && false_label)
            emit_irs.push_back(L_Cjump(r_res, true_label, false_label));

        return res;
    }
    else
    {
        Temp_temp *res_temp = Temp_newtemp_int();
        AS_operand *res = AS_Operand_Temp(res_temp);

        Temp_label *l_false = Temp_newlabel();
        AS_operand *l_res = ast2llvmBoolExpr(b->left, true_label, l_false);
        res = l_res;

        emit_irs.push_back(L_Jump(l_false));
        emit_irs.push_back(L_Label(l_false));
        AS_operand *r_res = ast2llvmBoolExpr(b->right, true_label, false_label);
        res = r_res;

        if (true_label && false_label)
            emit_irs.push_back(L_Cjump(r_res, true_label, false_label));

        return res;
    }
}

// done
AS_operand *ast2llvmBoolUnit(aA_boolUnit b, Temp_label *true_label, Temp_label *false_label)
{
    switch (b->kind)
    {
    case A_comOpExprKind:
    {
        return ast2llvmComOpExpr(b->u.comExpr, true_label, false_label);
        break;
    }
    case A_boolExprKind:
    {
        return ast2llvmBoolExpr(b->u.boolExpr, true_label, false_label);
        break;
    }
    case A_boolUOpExprKind:
    {
        return ast2llvmBoolExpr(b->u.boolExpr, false_label, true_label);
        break;
    }
    default:
        assert(0);
        break;
    }
}

// done
AS_operand *ast2llvmComOpExpr(aA_comExpr c, Temp_label *true_label, Temp_label *false_label)
{
    auto l = ast2llvmExprUnit(c->left);
    auto r = ast2llvmExprUnit(c->right);

    Temp_temp *result = Temp_newtemp_int_ptr(0);

    switch (c->op)
    {
    case A_lt:
    {
        emit_irs.push_back(L_Cmp(L_relopKind::T_lt, l, r, AS_Operand_Temp(result)));
        break;
    }
    case A_le:
    {
        emit_irs.push_back(L_Cmp(L_relopKind::T_le, l, r, AS_Operand_Temp(result)));
        break;
    }
    case A_gt:
    {
        emit_irs.push_back(L_Cmp(L_relopKind::T_gt, l, r, AS_Operand_Temp(result)));
        break;
    }
    case A_ge:
    {
        emit_irs.push_back(L_Cmp(L_relopKind::T_ge, l, r, AS_Operand_Temp(result)));
        break;
    }
    case A_eq:
    {
        emit_irs.push_back(L_Cmp(L_relopKind::T_eq, l, r, AS_Operand_Temp(result)));
        break;
    }
    case A_ne:
    {
        emit_irs.push_back(L_Cmp(L_relopKind::T_ne, l, r, AS_Operand_Temp(result)));
        break;
    }
    default:
    {
        assert(0);
        break;
    }
    }

    if (true_label && false_label)
        emit_irs.push_back(L_Cjump(AS_Operand_Temp(result), true_label, false_label));

    return AS_Operand_Temp(result);
}

// done
AS_operand *ast2llvmArithBiOpExpr(aA_arithBiOpExpr a)
{
    auto l = ast2llvmArithExpr(a->left);
    auto r = ast2llvmArithExpr(a->right);

    Temp_temp *result = Temp_newtemp_int();

    switch (a->op)
    {
    case A_add:
    {
        emit_irs.push_back(L_Binop(L_binopKind::T_plus, l, r, AS_Operand_Temp(result)));
        break;
    }
    case A_sub:
    {
        emit_irs.push_back(L_Binop(L_binopKind::T_minus, l, r, AS_Operand_Temp(result)));
        break;
    }
    case A_mul:
    {
        emit_irs.push_back(L_Binop(L_binopKind::T_mul, l, r, AS_Operand_Temp(result)));
        break;
    }
    case A_div:
    {
        emit_irs.push_back(L_Binop(L_binopKind::T_div, l, r, AS_Operand_Temp(result)));
        break;
    }
    default:
        assert(0);
        break;
    }
    return AS_Operand_Temp(result);
}

// done
AS_operand *ast2llvmArithUExpr(aA_arithUExpr a)
{
    if (a->op == A_neg)
    {
        Temp_temp *temp = Temp_newtemp_int();
        if (a->expr->kind == A_exprUnitType::A_numExprKind)
        {
            return AS_Operand_Const(-a->expr->u.num);
        }
        else
        {
            emit_irs.push_back(L_Binop(L_binopKind::T_minus, AS_Operand_Const(0), ast2llvmExprUnit(a->expr), AS_Operand_Temp(temp)));
            return AS_Operand_Temp(temp);
        }
    }
    else
    {
        assert(0);
    }
}

// done
AS_operand *ast2llvmArithExpr(aA_arithExpr a)
{
    switch (a->kind)
    {
    case A_arithBiOpExprKind:
    {
        return ast2llvmArithBiOpExpr(a->u.arithBiOpExpr);
        break;
    }
    case A_exprUnitKind:
    {
        return ast2llvmExprUnit(a->u.exprUnit);
        break;
    }
    default:
        assert(0);
        break;
    }
}

// done
AS_operand *ast2llvmExprUnit(aA_exprUnit e)
{
    if (e->kind == A_numExprKind)
    {
        return AS_Operand_Const(e->u.num);
    }
    else if (e->kind == A_idExprKind)
    {
        Temp_temp *temp;
        AS_operand *val = findVal(*e->u.id);
        if (val->kind == OperandKind::TEMP)
        {
            switch (val->u.TEMP->type)
            {
            case TempType::INT_TEMP:
            {
                temp = Temp_newtemp_int();
                emit_irs.push_back(L_Load(AS_Operand_Temp(temp), val));
                return AS_Operand_Temp(temp);
                break;
            }
            case TempType::INT_PTR:
            {
                if (val->u.TEMP->len == 0)
                {
                    temp = Temp_newtemp_int();
                    emit_irs.push_back(L_Load(AS_Operand_Temp(temp), val));
                    return AS_Operand_Temp(temp);
                }
                else if (val->u.TEMP->len > 0)
                {
                    // temp = Temp_newtemp_int_ptr(val->u.NAME->len);
                    return val;
                }
                else
                {
                    assert(0);
                }
                break;
            }
            case TempType::STRUCT_TEMP:
            {
                // temp = Temp_newtemp_struct_ptr(0, val->u.TEMP->structname);
                return val;
                break;
            }
            case TempType::STRUCT_PTR:
            {
                // temp = Temp_newtemp_struct_ptr(val->u.TEMP->len, val->u.TEMP->structname);
                return val;
                break;
            }
            default:
                assert(0);
            }
        }
        else if (val->kind == OperandKind::NAME)
        {
            switch (val->u.NAME->type)
            {
            case TempType::INT_TEMP:
            {
                temp = Temp_newtemp_int();
                emit_irs.push_back(L_Load(AS_Operand_Temp(temp), val));
                return AS_Operand_Temp(temp);
                break;
            }
            case TempType::INT_PTR:
            {
                if (val->u.NAME->len == 0)
                {
                    temp = Temp_newtemp_int();
                    emit_irs.push_back(L_Load(AS_Operand_Temp(temp), val));
                    return AS_Operand_Temp(temp);
                }
                else if (val->u.NAME->len > 0)
                {
                    // temp = Temp_newtemp_int_ptr(val->u.NAME->len);
                    return val;
                }
                else
                {
                    assert(0);
                }
                break;
            }
            case TempType::STRUCT_TEMP:
            {
                // temp = Temp_newtemp_struct_ptr(0, val->u.NAME->structname);
                return val;
                break;
            }
            case TempType::STRUCT_PTR:
            {
                // temp = Temp_newtemp_struct_ptr(val->u.NAME->len, val->u.NAME->structname);
                return val;
                break;
            }

            default:
                break;
            }
        }
        else
        {
            assert(0);
        }
    }
    else if (e->kind == A_arithExprKind)
    {
        return ast2llvmArithExpr(e->u.arithExpr);
    }
    else if (e->kind == A_arithUExprKind)
    {
        return ast2llvmArithUExpr(e->u.arithUExpr);
    }
    else if (e->kind == A_fnCallKind)
    {
        vector<AS_operand *> args;
        for (const auto &arg : e->u.callExpr->vals)
        {
            args.push_back(ast2llvmRightVal(arg));
        }

        Temp_temp *temp = Temp_newtemp_int();
        emit_irs.push_back(L_Call(*e->u.callExpr->fn, AS_Operand_Temp(temp), args));
        return AS_Operand_Temp(temp);
    }
    else if (e->kind == A_arrayExprKind)
    {
        AS_operand *val = ast2llvmArrayExpr(e->u.arrayExpr);
        Temp_temp *ret = Temp_newtemp_int();
        emit_irs.push_back(L_Load(AS_Operand_Temp(ret), val));
        return AS_Operand_Temp(ret);
    }
    else if (e->kind == A_memberExprKind)
    {
        AS_operand *val = ast2llvmMemberExpr(e->u.memberExpr);
        Temp_temp *ret = Temp_newtemp_int();
        emit_irs.push_back(L_Load(AS_Operand_Temp(ret), val));
        return AS_Operand_Temp(ret);
    }
    else
    {
        assert(0);
    }
}

AS_operand *ast2llvmArrayExpr(aA_arrayExpr a)
{
    AS_operand *base_ptr = ast2llvmLeftVal(a->arr);
    Temp_temp *temp = Temp_newtemp_int_ptr(0);
    AS_operand *new_ptr = AS_Operand_Temp(temp);
    emit_irs.push_back(L_Gep(new_ptr, base_ptr, ast2llvmIndexExpr(a->idx)));

    return new_ptr;
}

AS_operand *ast2llvmMemberExpr(aA_memberExpr m)
{
    AS_operand *base_ptr = ast2llvmLeftVal(m->structId);
    Temp_temp *temp = Temp_newtemp_int_ptr(0);
    AS_operand *new_ptr = AS_Operand_Temp(temp);

    switch (m->structId->kind)
    {
    case A_varValKind:
    {
        // cout << "structId: " << *m->structId->u.id << endl;
        emit_irs.push_back(L_Gep(new_ptr, base_ptr, ast2llvmMemberIndex(*m->structId->u.id, *m->memberId)));
        break;
    }
    case A_arrValKind:
    {
        // cout << "structId: " << *m->structId->u.arrExpr->arr->u.id << endl;
        emit_irs.push_back(L_Gep(new_ptr, base_ptr, ast2llvmMemberIndex(*m->structId->u.arrExpr->arr->u.id, *m->memberId)));
        break;
    }
    case A_memberValKind:
    {
        // cout << "structId: " << *m->structId->u.memberExpr->structId->u.id << endl;
        emit_irs.push_back(L_Gep(new_ptr, base_ptr, ast2llvmMemberIndex(*m->structId->u.memberExpr->structId->u.id, *m->memberId)));
        break;
    }
    default:
        break;
    }

    return new_ptr;
}

AS_operand *ast2llvmMemberIndex(string &structId, string &membername)
{
    cout << "structId: " << structId << " membername: " << membername << endl;
    Temp_temp *local = findLocalVal(structId);
    Name_name *global = findGlobalVal(structId);
    string structname;
    if (local)
    {
        structname = local->structname;
    }
    else if (global)
    {
        structname = global->structname;
    }
    else
    {
        assert(0);
    }

    auto it = structInfoMap.find(structname);
    if (it != structInfoMap.end())
    {
        auto it2 = it->second.memberinfos.find(membername);
        if (it2 != it->second.memberinfos.end())
        {
            return AS_Operand_Const(it2->second.offset);
        }
        else
        {
            assert(0);
        }
    }
    else
    {
        assert(0);
    }
}

AS_operand *findVal(string &name)
{
    Temp_temp *local = findLocalVal(name);
    Name_name *global = findGlobalVal(name);

    if (local)
    {
        return AS_Operand_Temp(local);
    }
    else if (global)
    {
        return AS_Operand_Name(global);
    }
    else
    {
        assert(0);
    }
}

Name_name *findGlobalVal(string &name)
{
    auto it = globalVarMap.find(name);
    if (it != globalVarMap.end())
    {
        return it->second;
    }
    else
    {
        return nullptr;
    }
}

Temp_temp *findLocalVal(string &name)
{
    auto it = localVarMap.find(name);
    if (it != localVarMap.end())
    {
        return it->second;
    }
    else
    {
        return nullptr;
    }
}

LLVMIR::L_func *ast2llvmFuncBlock(Func_local *f)
{
    list<L_block *> blocks;
    for (auto i = f->irs.begin(); i != f->irs.end();)
    {
        if ((*i)->type == L_StmKind::T_LABEL)
        {
            std::unordered_set<Temp_label *> succs;
            std::list<L_stm *> instrs;
            Temp_label *label = (*i)->u.LABEL->label;
            i++;
            while (i != f->irs.end() && (*i)->type != L_StmKind::T_LABEL)
            {
                if ((*i)->type == L_StmKind::T_JUMP)
                {
                    succs.insert((*i)->u.JUMP->jump);
                    instrs.push_back(*i);
                    break;
                }
                else if ((*i)->type == L_StmKind::T_CJUMP)
                {
                    succs.insert((*i)->u.CJUMP->true_label);
                    succs.insert((*i)->u.CJUMP->false_label);
                    instrs.push_back(*i);
                    break;
                }
                else if ((*i)->type == L_StmKind::T_RETURN)
                {
                    instrs.push_back(*i);
                    break;
                }
                else
                {
                    instrs.push_back(*i);
                }
                i++;
            }
            blocks.push_back(new L_block(label, succs, instrs));
        }
        else
        {
            i++;
        }
    }
    if (blocks.back()->instrs.empty() || (blocks.back()->instrs.back()->type != L_StmKind::T_RETURN))
    {
        blocks.back()->instrs.push_back(L_Ret(nullptr));
    }
    return new L_func(f->name, f->ret, f->args, blocks);
}

void ast2llvm_moveAlloca(LLVMIR::L_func *f)
{
    auto first_block = f->blocks.front();
    for (auto i = ++f->blocks.begin(); i != f->blocks.end(); ++i)
    {
        for (auto it = (*i)->instrs.begin(); it != (*i)->instrs.end();)
        {
            if ((*it)->type == L_StmKind::T_ALLOCA)
            {
                first_block->instrs.insert(++first_block->instrs.begin(), *it);
                it = (*i)->instrs.erase(it);
            }
            else
            {
                ++it;
            }
        }
    }
}