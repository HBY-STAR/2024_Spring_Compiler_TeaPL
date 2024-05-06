#include "ssa.h"
#include <cassert>
#include <iostream>
#include <list>
#include <stack>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
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
        printL_func(debugStream, fun);
        mem2reg(fun);
        printL_func(debugStream, fun);
        debugStream.close();
        exit(0);

        auto RA_bg = Create_bg(fun->blocks);
        SingleSourceGraph(RA_bg.mynodes[0], RA_bg, fun);
        // Show_graph(stdout,RA_bg);
        Liveness(RA_bg.mynodes[0], RA_bg, fun->args);
        Dominators(RA_bg);
        // printf_domi();
        tree_Dominators(RA_bg);
        // printf_D_tree();
        // 默认0是入口block
        computeDF(RA_bg, RA_bg.mynodes[0]);
        // printf_DF();
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

// 保证相同的AS_operand,地址一样 。常量除外
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

//   Todo
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

                // 处理 ALLOCA 指令
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
                        if (stm2->type == L_StmKind::T_LOAD && stm2->u.LOAD->ptr->kind == OperandKind::TEMP && stm2->u.LOAD->ptr->u.TEMP == temp)
                        {
                            temp2ASoper[stm2->u.LOAD->dst->u.TEMP] = stm2->u.LOAD->ptr;
                            // 删除 LOAD 指令
                            stm2_it = block2->instrs.erase(stm2_it);
                        }
                        else if (stm2->type == L_StmKind::T_STORE && stm2->u.STORE->src->kind == OperandKind::TEMP && stm2->u.STORE->ptr->u.TEMP == temp)
                        {
                            temp2ASoper[stm2->u.STORE->src->u.TEMP] = stm2->u.STORE->ptr;
                            // 删除 STORE 指令
                            stm2_it = block2->instrs.erase(stm2_it);
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

void Dominators(GRAPH::Graph<LLVMIR::L_block *> &bg)
{
    //   Todo
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

void tree_Dominators(GRAPH::Graph<LLVMIR::L_block *> &bg)
{
    //   Todo
}

void computeDF(GRAPH::Graph<LLVMIR::L_block *> &bg, GRAPH::Node<LLVMIR::L_block *> *r)
{
    //   Todo
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