#include "TypeCheck.h"

// global tabels
// typeMap func2retType; // function name to return type

// global token ids to type
typeMap g_token2Type;

// local token ids to type, since func param can override global param
typeMap funcparam_token2Type;
vector<typeMap *> local_token2Type;

paramMemberMap func2Param;
IsFuncDefinedMap IsFuncDefined;
paramMemberMap struct2Members;

// private util functions
void error_print(std::ostream &out, A_pos p, string info)
{
    out << "Typecheck error in line " << p->line << ", col " << p->col << ": " << info << std::endl
        << std::endl;
    exit(0);
}

void print_token_map(typeMap *map)
{
    for (auto it = map->begin(); it != map->end(); it++)
    {
        std::cout << it->first << " : ";
        switch (it->second->type->type)
        {
        case A_dataType::A_nativeTypeKind:
            switch (it->second->type->u.nativeType)
            {
            case A_nativeType::A_intTypeKind:
                std::cout << "int";
                break;
            default:
                break;
            }
            break;
        case A_dataType::A_structTypeKind:
            std::cout << *(it->second->type->u.structType);
            break;
        default:
            break;
        }
        switch (it->second->isVarArrFunc)
        {
        case 0:
            std::cout << " scalar";
            break;
        case 1:
            std::cout << " array";
            break;
        case 2:
            std::cout << " function";
            break;
        }
        std::cout << std::endl;
    }
}

void print_token_maps()
{
    std::cout << "global token2Type:" << std::endl;
    print_token_map(&g_token2Type);
    std::cout << "funcparam token2Type:" << std::endl;
    print_token_map(&funcparam_token2Type);
    std::cout << "local token2Type" << std::endl;
    for (auto it = local_token2Type.begin(); it != local_token2Type.end(); it++)
    {
        print_token_map(*it);
    }
    std::cout << "func2Param" << std::endl;
    for (auto it = func2Param.begin(); it != func2Param.end(); it++)
    {
        std::cout << it->first << " : ";
        for (auto it2 = it->second->begin(); it2 != it->second->end(); it2++)
        {
            std::cout << *((*it2)->u.declScalar->id) << " ";
        }
        std::cout << std::endl;
    }
    std::cout << "struct2Members" << std::endl;
    for (auto it = struct2Members.begin(); it != struct2Members.end(); it++)
    {
        std::cout << it->first << " : ";
        for (auto it2 = it->second->begin(); it2 != it->second->end(); it2++)
        {
            std::cout << *((*it2)->u.declScalar->id) << " ";
        }
        std::cout << std::endl;
    }
    std::cout << "IsFuncDefined" << std::endl;
    for (auto it = IsFuncDefined.begin(); it != IsFuncDefined.end(); it++)
    {
        std::cout << it->first << " : " << it->second << std::endl;
    }
}

bool comp_aA_type(aA_type target, aA_type t)
{
    if (!target || !t)
        return false;
    if (target->type != t->type)
        return false;
    if (target->type == A_dataType::A_nativeTypeKind)
        if (target->u.nativeType != t->u.nativeType)
            return false;
    if (target->type == A_dataType::A_structTypeKind)
        if (target->u.structType != t->u.structType)
            return false;
    return true;
}

bool comp_tc_type(tc_type target, tc_type t)
{
    if (!target || !t)
        return false;

    // arr kind first
    if (target->isVarArrFunc && t->isVarArrFunc == 0)
        return false;

    // if target type is nullptr, alwayse ok
    return comp_aA_type(target->type, t->type);
}

tc_type tc_Type(aA_type t, uint isVarArrFunc)
{
    tc_type ret = new tc_type_;
    ret->type = t;
    ret->isVarArrFunc = isVarArrFunc;
    return ret;
}

tc_type tc_Type(aA_varDecl vd)
{
    if (vd->kind == A_varDeclType::A_varDeclScalarKind)
        return tc_Type(vd->u.declScalar->type, 0);
    else if (vd->kind == A_varDeclType::A_varDeclArrayKind)
        return tc_Type(vd->u.declArray->type, 1);
    return nullptr;
}

// public functions
void check_Prog(std::ostream &out, aA_program p)
{
    for (auto ele : p->programElements)
    {
        if (ele->kind == A_programVarDeclStmtKind)
        {
            check_VarDecl(out, ele->u.varDeclStmt);
        }
        else if (ele->kind == A_programStructDefKind)
        {
            check_StructDef(out, ele->u.structDef);
        }
    }

    for (auto ele : p->programElements)
    {
        if (ele->kind == A_programFnDeclStmtKind)
        {
            check_FnDeclStmt(out, ele->u.fnDeclStmt);
        }
    }

    for (auto ele : p->programElements)
    {
        if (ele->kind == A_programFnDefKind)
        {
            check_FnDef(out, ele->u.fnDef);
        }
        else if (ele->kind == A_programNullStmtKind)
        {
            // do nothing
        }
    }

    print_token_maps();
    out << "Typecheck passed!\n"
        << std::endl;
    return;
}

// 检查变量声明和定义
void check_VarDecl(std::ostream &out, aA_varDeclStmt vd)
{
    if (!vd)
        return;
    string name;
    if (vd->kind == A_varDeclStmtType::A_varDeclKind)
    {
        // decl only
        aA_varDecl vdecl = vd->u.varDecl;
        if (vdecl->kind == A_varDeclType::A_varDeclScalarKind)
        {
            name = *vdecl->u.declScalar->id;
            /* fill code here*/

            // 检查是否重复声明
            tc_type temp = FindId(&name);
            if (temp)
                error_print(out, vdecl->pos, "This id is already defined!");

            // 添加到全局或局部变量表
            if (local_token2Type.size() == 0)
                g_token2Type[name] = tc_Type(vdecl);
            else
                local_token2Type.back()->insert({name, tc_Type(vdecl)});
        }
        else if (vdecl->kind == A_varDeclType::A_varDeclArrayKind)
        {
            name = *vdecl->u.declArray->id;
            /* fill code here*/

            // 检查是否重复声明
            tc_type temp = FindId(&name);
            if (temp)
                error_print(out, vdecl->pos, "This id is already defined!");
            // 检查数组索引
            if (vdecl->u.declArray->len <= 0)
                error_print(out, vdecl->pos, "Array length should be positive!");

            // 添加到全局或局部变量表
            if (local_token2Type.size() == 0)
                g_token2Type[name] = tc_Type(vdecl);
            else
                local_token2Type.back()->insert({name, tc_Type(vdecl)});
        }
    }
    else if (vd->kind == A_varDeclStmtType::A_varDefKind)
    {
        // decl and def
        aA_varDef vdef = vd->u.varDef;
        if (vdef->kind == A_varDefType::A_varDefScalarKind)
        {
            name = *vdef->u.defScalar->id;
            /* fill code here, allow omited type */

            // 检查是否重复声明
            tc_type temp = FindId(&name);
            if (temp)
                error_print(out, vdef->pos, "This id is already defined!");

            // 检查类型是否匹配
            temp = check_ArithExpr(out, vdef->u.defScalar->val->u.arithExpr);
            // 赋值推断类型
            if (vdef->u.defScalar->type == nullptr)
            {
                vdef->u.defScalar->type = temp->type;
            }
            // struct类型
            if (temp->type && (temp->type->type == A_dataType::A_structTypeKind))
            {
                // 值类型不匹配
                if (*temp->type->u.structType != *vdef->u.defScalar->type->u.structType)
                    error_print(out, vdef->pos, "Struct type mismatch!");
            }
            // 原生类型
            else
            {
                // 值类型不匹配
                if (temp->type && (temp->type->u.nativeType != vdef->u.defScalar->type->u.nativeType))
                    error_print(out, vdef->pos, "Native type mismatch!");
            }

            // 添加到全局或局部变量表
            if (local_token2Type.size() == 0)
                g_token2Type[name] = tc_Type(vdef->u.defScalar->type, 0);
            else
                local_token2Type.back()->insert({name, tc_Type(vdef->u.defScalar->type, 0)});
        }
        else if (vdef->kind == A_varDefType::A_varDefArrayKind)
        {
            name = *vdef->u.defArray->id;
            /* fill code here, allow omited type */

            // 检查是否重复声明
            tc_type temp = FindId(&name);
            if (temp)
                error_print(out, vdef->pos, "This id is already defined!");
            // 检查数组索引
            if (vdef->u.defArray->len <= 0)
                error_print(out, vdef->pos, "Array length should be positive!");

            // 检查类型是否匹配
            // 首先检查数组长度是否匹配
            if (vdef->u.defArray->vals.size() != vdef->u.defArray->len)
                error_print(out, vdef->pos, "Array length mismatch!");
            // 然后检查数组元素类型是否匹配
            for (auto it = vdef->u.defArray->vals.begin(); it != vdef->u.defArray->vals.end(); it++)
            {
                tc_type temp = check_ArithExpr(out, (*it)->u.arithExpr);

                // 赋值推断类型
                if (vdef->u.defArray->type == nullptr)
                {
                    vdef->u.defArray->type = temp->type;
                }
                // struct类型
                if (temp->type && (temp->type->type == A_dataType::A_structTypeKind))
                {
                    // 值类型不匹配
                    if (*temp->type->u.structType != *vdef->u.defArray->type->u.structType)
                    {
                        error_print(out, vdef->pos, "Struct type mismatch!");
                    }
                }
                // 原生类型
                else
                {
                    // 值类型不匹配
                    if (temp->type && (temp->type->u.nativeType != vdef->u.defArray->type->u.nativeType))
                        error_print(out, vdef->pos, "Native type mismatch!");
                }
            }

            // 添加到全局或局部变量表
            if (local_token2Type.size() == 0)
                g_token2Type[name] = tc_Type(vdef->u.defArray->type, 1);
            else
                local_token2Type.back()->insert({name, tc_Type(vdef->u.defArray->type, 1)});
        }
    }
    return;
}

// 检查全局结构体定义
void check_StructDef(std::ostream &out, aA_structDef sd)
{
    if (!sd)
        return;
    string name = *sd->id;
    if (struct2Members.find(name) != struct2Members.end())
        error_print(out, sd->pos, "This id is already defined!");
    struct2Members[name] = &(sd->varDecls);
    return;
}

// 检查全局函数声明
void check_FnDecl(std::ostream &out, aA_fnDecl fd, bool isDef)
{
    if (!fd)
        return;
    string name = *fd->id;

    // if already declared, should match
    if (func2Param.find(name) != func2Param.end())
    {
        if (IsFuncDefined.find(name) != IsFuncDefined.end() && IsFuncDefined[name])
        {
            error_print(out, fd->pos, "This function is already defined!");
        }
        // is function ret val matches
        /* fill code here */
        if (!comp_aA_type(g_token2Type[name]->type, fd->type))
            error_print(out, fd->pos, "Return type mismatch!");

        // is function params matches decl
        /* fill code here */
        if (func2Param[name]->size() != fd->paramDecl->varDecls.size())
            error_print(out, fd->pos, "Param number mismatch!");
        for (int i = 0; i < fd->paramDecl->varDecls.size(); i++)
        {
            tc_type paramType = tc_Type(fd->paramDecl->varDecls[i]);
            tc_type valType = tc_Type((*func2Param[name])[i]);
            if (!comp_tc_type(paramType, valType))
                error_print(out, fd->pos, "Param type mismatch!");
        }
    }
    else
    {
        // if not defined
        /* fill code here */
        // 检查参数类型是否存在
        for (auto it = fd->paramDecl->varDecls.begin(); it != fd->paramDecl->varDecls.end(); it++)
        {
            if ((*it)->kind == A_varDeclType::A_varDeclScalarKind)
            {
                if ((*it)->u.declScalar->type->type == A_dataType::A_structTypeKind)
                {
                    if (struct2Members.find(*(*it)->u.declScalar->type->u.structType) == struct2Members.end())
                        error_print(out, fd->pos, "This struct type is not defined!");
                }
            }
            else if ((*it)->kind == A_varDeclType::A_varDeclArrayKind)
            {
                if ((*it)->u.declArray->type->type == A_dataType::A_structTypeKind)
                {
                    if (struct2Members.find(*(*it)->u.declArray->type->u.structType) == struct2Members.end())
                        error_print(out, fd->pos, "This struct type is not defined!");
                }
            }
        }
        func2Param[name] = &(fd->paramDecl->varDecls);
        g_token2Type[name] = tc_Type(fd->type, 2);
        if (isDef){
            IsFuncDefined[name] = true;
        }
        else
            IsFuncDefined[name] = false;
    }
    return;
}

void check_FnDeclStmt(std::ostream &out, aA_fnDeclStmt fd)
{
    if (!fd)
        return;
    check_FnDecl(out, fd->fnDecl, false);
    return;
}

// 检查全局函数定义
void check_FnDef(std::ostream &out, aA_fnDef fd)
{
    if (!fd)
        return;
    // should match if declared
    check_FnDecl(out, fd->fnDecl, true);
    // add params to local tokenmap, func params override global ones

    funcparam_token2Type.clear();

    for (aA_varDecl vd : fd->fnDecl->paramDecl->varDecls)
    {
        /* fill code here */
        funcparam_token2Type[*vd->u.declScalar->id] = tc_Type(vd);
    }

    /* fill code here */
    local_token2Type.push_back(new typeMap());

    for (aA_codeBlockStmt stmt : fd->stmts)
    {
        check_CodeblockStmt(out, stmt);
        // return value type should match
        /* fill code here */
    }

    local_token2Type.pop_back();
    funcparam_token2Type.clear();

    return;
}

// 检查局部代码块
void check_CodeblockStmt(std::ostream &out, aA_codeBlockStmt cs)
{
    if (!cs)
        return;
    // variables declared in a code block should not duplicate with outer ones.
    switch (cs->kind)
    {
    case A_codeBlockStmtType::A_varDeclStmtKind:
        check_VarDecl(out, cs->u.varDeclStmt);
        break;
    case A_codeBlockStmtType::A_assignStmtKind:
        check_AssignStmt(out, cs->u.assignStmt);
        break;
    case A_codeBlockStmtType::A_ifStmtKind:
        check_IfStmt(out, cs->u.ifStmt);
        break;
    case A_codeBlockStmtType::A_whileStmtKind:
        check_WhileStmt(out, cs->u.whileStmt);
        break;
    case A_codeBlockStmtType::A_callStmtKind:
        check_CallStmt(out, cs->u.callStmt);
        break;
    case A_codeBlockStmtType::A_returnStmtKind:
        check_ReturnStmt(out, cs->u.returnStmt);
        break;
    default:
        break;
    }
    return;
}

void check_AssignStmt(std::ostream &out, aA_assignStmt as)
{
    if (!as)
        return;
    string name;
    tc_type deduced_type; // deduced type if type is omitted at decl
    switch (as->leftVal->kind)
    {
    case A_leftValType::A_varValKind:
    {
        name = *as->leftVal->u.id;
        /* fill code here */
        // 检查左值是否定义
        tc_type leftType = FindId(&name);
        if (!leftType)
            error_print(out, as->pos, "This id is not defined!");

        // 检查右值是否定义
        tc_type rightType = check_ArithExpr(out, as->rightVal->u.arithExpr);

        // 若左值类型为空
        if (leftType->type == nullptr)
        {
            // 赋值推断类型
            leftType->type = rightType->type;
        }
        else
        {
            // 检查类型是否匹配
            tc_type rightType = check_ArithExpr(out, as->rightVal->u.arithExpr);
            if (!comp_tc_type(leftType, rightType))
                error_print(out, as->pos, "Type mismatch!");
        }
    }
    break;
    case A_leftValType::A_arrValKind:
    {
        name = *as->leftVal->u.arrExpr->arr->u.id;
        /* fill code here */
        // 检查左值是否定义
        check_ArrayExpr(out, as->leftVal->u.arrExpr);
        // 获取左值类型
        tc_type leftType = FindId(&name);

        // 检查右值是否定义
        tc_type rightType = check_ArithExpr(out, as->rightVal->u.arithExpr);

        // 若左值类型为空
        if (leftType->type == nullptr)
        {
            // 若右值不为数组
            if (rightType->isVarArrFunc != 1)
                error_print(out, as->pos, "This id is not an array!");

            // 赋值推断类型
            leftType->type = rightType->type;
        }
        else
        {
            // 检查类型是否匹配
            tc_type leftType = FindId(&name);
            tc_type rightType = check_ArithExpr(out, as->rightVal->u.arithExpr);
            if (!comp_tc_type(leftType, rightType))
                error_print(out, as->pos, "Type mismatch!");
        }
    }
    break;
    case A_leftValType::A_memberValKind:
    {
        name = *as->leftVal->u.memberExpr->structId->u.id;
        /* fill code here */
        // 检查左值是否定义
        tc_type leftType = check_MemberExpr(out, as->leftVal->u.memberExpr);

        // 检查右值是否定义
        tc_type rightType = check_ArithExpr(out, as->rightVal->u.arithExpr);

        // 检查类型是否匹配
        if (!comp_tc_type(leftType, rightType))
            error_print(out, as->pos, "Type mismatch!");
    }
    break;
    }
    return;
}

void check_ArrayExpr(std::ostream &out, aA_arrayExpr ae)
{
    if (!ae)
        return;
    string name = *ae->arr->u.id;
    // check array name
    /* fill code here */

    // 检查 id 是否定义
    tc_type found_type = FindId(&name);
    if (!found_type)
        error_print(out, ae->pos, "This id is not defined!");

    // 检查是否为数组
    if (found_type->isVarArrFunc != 1)
        error_print(out, ae->pos, "This id is not an array!");

    // check index
    /* fill code here */
    // 检测索引是否为正数
    if (ae->idx->kind == A_indexExprKind::A_numIndexKind)
    {
        if (ae->idx->u.num <= 0)
            error_print(out, ae->pos, "Array index should be positive!");
    }
    else
    {
        tc_type idx_type = FindId(ae->idx->u.id);
        if (idx_type->type->type != A_dataType::A_nativeTypeKind || idx_type->type->u.nativeType != A_nativeType::A_intTypeKind)
            error_print(out, ae->pos, "Array index should be int!");
    }
    return;
}

tc_type check_MemberExpr(std::ostream &out, aA_memberExpr me)
{
    // check if the member exists and return the tyep of the member
    if (!me)
        return nullptr;
    string name = *me->structId->u.id;
    // check struct name
    /* fill code here */
    // 检查 struct id 是否定义
    tc_type found_type = FindId(&name);
    if (!found_type)
        error_print(out, me->pos, "This id is not defined!");

    // 检查是否为Struct
    if (found_type->type->type != A_dataType::A_structTypeKind)
        error_print(out, me->pos, "This id is not a struct!");

    // check member name
    /* fill code here */
    // 检查 member id 是否定义
    bool found = false;

    string structName = *found_type->type->u.structType;

    for (auto it = struct2Members[structName]->begin(); it != struct2Members[structName]->end(); it++)
    {
        if ((*it)->kind == A_varDeclType::A_varDeclScalarKind)
        {
            if (*((*it)->u.declScalar->id) == *(me->memberId))
            {
                found = true;
                return tc_Type((*it)->u.declScalar->type, 0);
            }
        }
        else if ((*it)->kind == A_varDeclType::A_varDeclArrayKind)
        {
            if (*((*it)->u.declArray->id) == *(me->memberId))
            {
                found = true;
                return tc_Type((*it)->u.declArray->type, 1);
            }
        }
    }

    if (!found)
        error_print(out, me->pos, "This member id is not defined!");

    return nullptr;
}

void check_IfStmt(std::ostream &out, aA_ifStmt is)
{
    if (!is)
        return;
    check_BoolExpr(out, is->boolExpr);
    /* fill code here, take care of variable scope */

    local_token2Type.push_back(new typeMap());

    for (aA_codeBlockStmt s : is->ifStmts)
    {
        check_CodeblockStmt(out, s);
    }

    local_token2Type.pop_back();

    /* fill code here */

    local_token2Type.push_back(new typeMap());
    for (aA_codeBlockStmt s : is->elseStmts)
    {
        check_CodeblockStmt(out, s);
    }
    /* fill code here */
    local_token2Type.pop_back();
    return;
}

void check_BoolExpr(std::ostream &out, aA_boolExpr be)
{
    if (!be)
        return;
    switch (be->kind)
    {
    case A_boolExprType::A_boolBiOpExprKind:
        check_BoolExpr(out, be->u.boolBiOpExpr->left);
        check_BoolExpr(out, be->u.boolBiOpExpr->right);
        break;
    case A_boolExprType::A_boolUnitKind:
        check_BoolUnit(out, be->u.boolUnit);
        break;
    default:
        break;
    }
    return;
}

void check_BoolUnit(std::ostream &out, aA_boolUnit bu)
{
    if (!bu)
        return;
    switch (bu->kind)
    {
    case A_boolUnitType::A_comOpExprKind:
    {
        /* fill code here */
        tc_type leftType = check_ExprUnit(out, bu->u.comExpr->left);
        tc_type rightType = check_ExprUnit(out, bu->u.comExpr->right);
        if (!comp_tc_type(leftType, rightType))
            error_print(out, bu->pos, "Type mismatch!");
    }
    break;
    case A_boolUnitType::A_boolExprKind:
        check_BoolExpr(out, bu->u.boolExpr);
        break;
    case A_boolUnitType::A_boolUOpExprKind:
        check_BoolUnit(out, bu->u.boolUOpExpr->cond);
        break;
    default:
        break;
    }
    return;
}

tc_type check_ExprUnit(std::ostream &out, aA_exprUnit eu)
{
    // return the aA_type of expr eu
    if (!eu)
        return nullptr;
    tc_type ret;
    switch (eu->kind)
    {
    case A_exprUnitType::A_idExprKind:
    {
        /* fill code here */
        // 检查 id 是否定义
        ret = FindId(eu->u.id);
        if (!ret)
            error_print(out, eu->pos, "This id is not defined!");
    }
    break;
    case A_exprUnitType::A_numExprKind:
    {
        aA_type numt = new aA_type_;
        numt->pos = eu->pos;
        numt->type = A_dataType::A_nativeTypeKind;
        numt->u.nativeType = A_nativeType::A_intTypeKind;
        ret = tc_Type(numt, 0);
    }
    break;
    case A_exprUnitType::A_fnCallKind:
    {
        check_FuncCall(out, eu->u.callExpr);
        // check_FuncCall will check if the function is defined
        /* fill code here */
        // 检查返回值类型是否匹配
        if (g_token2Type[*eu->u.callExpr->fn]->type == nullptr)
            error_print(out, eu->pos, "Function return type is void!");
        ret = g_token2Type[*eu->u.callExpr->fn];
    }
    break;
    case A_exprUnitType::A_arrayExprKind:
    {
        check_ArrayExpr(out, eu->u.arrayExpr);
        /* fill code here */
        ret = FindId(eu->u.arrayExpr->arr->u.id);
        if (ret->isVarArrFunc != 1)
            error_print(out, eu->pos, "This id is not an array!");
    }
    break;
    case A_exprUnitType::A_memberExprKind:
    {
        ret = check_MemberExpr(out, eu->u.memberExpr);
    }
    break;
    case A_exprUnitType::A_arithExprKind:
    {
        ret = check_ArithExpr(out, eu->u.arithExpr);
    }
    break;
    case A_exprUnitType::A_arithUExprKind:
    {
        ret = check_ExprUnit(out, eu->u.arithUExpr->expr);
    }
    break;
    }
    return ret;
}

tc_type check_ArithExpr(std::ostream &out, aA_arithExpr ae)
{
    if (!ae)
        return nullptr;
    tc_type ret;
    switch (ae->kind)
    {
    case A_arithExprType::A_arithBiOpExprKind:
    {
        ret = check_ArithExpr(out, ae->u.arithBiOpExpr->left);
        tc_type rightTyep = check_ArithExpr(out, ae->u.arithBiOpExpr->right);
        if (ret->type->type > 0 || ret->type->type != A_dataType::A_nativeTypeKind || ret->type->u.nativeType != A_nativeType::A_intTypeKind ||
            rightTyep->type->type > 0 || rightTyep->type->type != A_dataType::A_nativeTypeKind || rightTyep->type->u.nativeType != A_nativeType::A_intTypeKind)
            error_print(out, ae->pos, "Only int can be arithmetic expression operation values!");
    }
    break;
    case A_arithExprType::A_exprUnitKind:
        ret = check_ExprUnit(out, ae->u.exprUnit);
        break;
    }
    return ret;
}

void check_FuncCall(std::ostream &out, aA_fnCall fc)
{
    if (!fc)
        return;
    string func_name = *fc->fn;

    // check if function defined
    /* fill code here */
    if (g_token2Type.find(func_name) == g_token2Type.end())
        error_print(out, fc->pos, "This function is not defined!");

    // check if parameter list matches
    if (func2Param[func_name]->size() != fc->vals.size())
        error_print(out, fc->pos, "Param number mismatch!");
    for (int i = 0; i < fc->vals.size(); i++)
    {
        /* fill code here */
        tc_type paramType = tc_Type((*func2Param[func_name])[i]);
        tc_type valType = check_ArithExpr(out, fc->vals[i]->u.arithExpr);

        if (!comp_tc_type(paramType, valType))
            error_print(out, fc->pos, "Param type mismatch!");
    }
    return;
}

void check_WhileStmt(std::ostream &out, aA_whileStmt ws)
{
    if (!ws)
        return;
    check_BoolExpr(out, ws->boolExpr);
    /* fill code here, take care of variable scope */

    local_token2Type.push_back(new typeMap());

    for (aA_codeBlockStmt s : ws->whileStmts)
    {
        check_CodeblockStmt(out, s);
    }
    /* fill code here */

    local_token2Type.pop_back();

    return;
}

void check_CallStmt(std::ostream &out, aA_callStmt cs)
{
    if (!cs)
        return;
    check_FuncCall(out, cs->fnCall);
    return;
}

void check_ReturnStmt(std::ostream &out, aA_returnStmt rs)
{
    if (!rs)
        return;
    return;
}

tc_type FindId(string *id)
{
    tc_type ret;
    bool found = false;
    for (auto it = g_token2Type.begin(); it != g_token2Type.end(); it++)
    {
        if (it->first == *id)
        {
            found = true;
            ret = it->second;
            break;
        }
    }
    for (auto it = local_token2Type.begin(); it != local_token2Type.end(); it++)
    {
        if ((*it)->find(*id) != (*it)->end())
        {
            found = true;
            ret = (*it)->find(*id)->second;
            break;
        }
    }
    for (auto it = funcparam_token2Type.begin(); it != funcparam_token2Type.end(); it++)
    {
        if (it->first == *id)
        {
            found = true;
            ret = it->second;
            break;
        }
    }
    if (!found)
        return nullptr;
    return ret;
}