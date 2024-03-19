%{
#include <stdio.h>
#include "TeaplAst.h"

extern A_pos pos;
extern A_program root;

extern int yylex(void);
extern "C"{
extern void yyerror(char *s); 
extern int  yywrap();
}

%}

%union
{
    //Terminal
    A_tokenId tokenId_;
    A_tokenNum tokenNum_;

    //Nonterminal
    A_arithExpr arithExpr_;
    A_exprUnit exprUnit_;

    A_boolExpr boolExpr_;
    A_boolUnit boolUnit_;

    A_assignStmt assignStmt_;
    A_leftVal leftVal_;
    A_rightVal rightVal_;
    A_rightValList rightValList_;

    A_fnCall fnCall_;

    A_varDeclStmt varDeclStmt_;
    A_varDecl varDecl_;
    A_varDeclList varDeclList_;
    A_varDef varDef_;

    A_type type_;
    A_nativeType nativeType_;

    A_structDef structDef_;

    A_fnDeclStmt fnDeclStmt_;
    A_fnDecl fnDecl_;
    A_paramDecl paramDecl_;

    A_fnDef fnDef_;

    A_codeBlockStmt codeBlockStmt_;
    A_codeBlockStmtList codeBlockStmtList_;

    A_callStmt callStmt_;
    A_ifStmt ifStmt_;
    A_whileStmt whileStmt_;
    A_returnStmt returnStmt_;

    A_program program_;
    A_programElement programElement_;
    A_programElementList programElementList_;
}

// token的类
%token <tokenId_> ID 
%token <tokenNum_> NUM

%token ARROW
%token <nativeType_> INT
%token LET
%token STRUCT
%token FN
%token RET
%token CONTINUE
%token BREAK
%token IF
%token ELSE
%token WHILE 
%token COMMENT

%token ADD
%token SUB
%token MUL
%token DIV
%token AND
%token OR
%token NOT
%token LT
%token LE
%token GT
%token GE
%token EQ
%token NE

%token SEMICOLON
%token LEFT_PAREN
%token RIGHT_PAREN
%token LEFT_BRACKET
%token RIGHT_BRACKET
%token DOT
%token EQUALS
%token COMMA
%token COLON
%token LEFT_BRACE
%token RIGHT_BRACE

%left OR
%left AND

%left LT LE GT GE EQ NE

%left ADD SUB
%left MUL DIV

%left NOT



%type <arithExpr_> arithExpr
%type <exprUnit_> exprUnit

%type <boolExpr_> boolExpr
%type <boolUnit_> boolUnit

%type <assignStmt_> assignStmt
%type <leftVal_> leftVal
%type <rightVal_> rightVal
%type <rightValList_> rightValList

%type <fnCall_> fnCall

%type <varDeclStmt_> varDeclStmt
%type <varDecl_> varDecl
%type <varDef_> varDef
%type <varDeclList_> varDeclList

%type <type_> type

%type <structDef_> structDef

%type <fnDeclStmt_> fnDeclStmt
%type <fnDecl_> fnDecl
%type <paramDecl_> paramDecl

%type <fnDef_> fnDef

%type <codeBlockStmt_> codeBlockStmt
%type <codeBlockStmtList_> codeBlockStmtList

%type <callStmt_> callStmt
%type <ifStmt_> ifStmt
%type <whileStmt_> whileStmt
%type <returnStmt_> returnStmt


%type <program_> program
%type <programElement_> programElement
%type <programElementList_> programElementList

%%

// gdb ./compiler
// run tests/test01.tea tests/test01.ast

program : programElementList { 
        root = A_Program($1); 
        $$ = A_Program($1); 
        }

programElementList : programElement { $$ = A_ProgramElementList($1, NULL); }
       | programElement programElementList { $$ = A_ProgramElementList($1, $2); }
       ;

programElement: varDeclStmt { $$ = A_ProgramVarDeclStmt($1->pos, $1); }
              | structDef { $$ = A_ProgramStructDef($1->pos, $1); }
              | fnDeclStmt { $$ = A_ProgramFnDeclStmt($1->pos, $1); }
              | fnDef { $$ = A_ProgramFnDef($1->pos, $1); }
              | comment  { $$ = A_ProgramNullStmt(A_Pos(0,0)); }
              | SEMICOLON { $$ = A_ProgramNullStmt(A_Pos(0,0)); }
              ;


//checked
arithExpr: arithExpr ADD arithExpr { $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_add, $1, $3)); }
         | arithExpr SUB arithExpr { $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_sub, $1, $3)); }
         | arithExpr MUL arithExpr { $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_mul, $1, $3)); }
         | arithExpr DIV arithExpr { $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_div, $1, $3)); }
         | exprUnit { $$ = A_ExprUnit($1->pos, $1); }
         ;

//checked
exprUnit:  NUM { $$ = A_NumExprUnit($1->pos, $1->num); }
        | ID { $$ = A_IdExprUnit($1->pos, $1->id); }
        | LEFT_PAREN arithExpr RIGHT_PAREN { $$ = A_ArithExprUnit($2->pos, $2); }
        | fnCall { $$ = A_CallExprUnit($1->pos, $1); }
        | leftVal LEFT_BRACKET ID RIGHT_BRACKET { $$ = A_ArrayExprUnit($1->pos, A_ArrayExpr($1->pos, $1, A_IdIndexExpr($1->pos, $3->id))); }
        | leftVal LEFT_BRACKET NUM RIGHT_BRACKET  { $$ = A_ArrayExprUnit($1->pos, A_ArrayExpr($1->pos, $1, A_NumIndexExpr($1->pos, $3->num))); }
        | leftVal DOT ID { $$ = A_MemberExprUnit($1->pos, A_MemberExpr($1->pos, $1, $3->id)); }
        | SUB exprUnit { $$ = A_ArithUExprUnit($2->pos, A_ArithUExpr($2->pos, A_neg, $2)); }
        ;

//checked
boolExpr: boolExpr OR boolExpr { $$ = A_BoolBiOp_Expr($1->pos, A_BoolBiOpExpr($1->pos, A_or, $1, $3)); }
        | boolExpr AND boolExpr { $$ = A_BoolBiOp_Expr($1->pos, A_BoolBiOpExpr($1->pos, A_and, $1, $3)); }
        | boolUnit { $$ = A_BoolExpr($1->pos, $1); }
        ;

//checked
boolUnit: LEFT_PAREN boolExpr RIGHT_PAREN { $$ = A_BoolExprUnit($2->pos, $2); }
        | exprUnit LT exprUnit { $$ = A_ComExprUnit($1->pos, A_ComExpr($1->pos, A_lt, $1, $3)); }
        | exprUnit LE exprUnit { $$ = A_ComExprUnit($1->pos, A_ComExpr($1->pos, A_le, $1, $3)); }
        | exprUnit GT exprUnit { $$ = A_ComExprUnit($1->pos, A_ComExpr($1->pos, A_gt, $1, $3)); }
        | exprUnit GE exprUnit { $$ = A_ComExprUnit($1->pos, A_ComExpr($1->pos, A_ge, $1, $3)); }
        | exprUnit EQ exprUnit { $$ = A_ComExprUnit($1->pos, A_ComExpr($1->pos, A_eq, $1, $3)); }
        | exprUnit NE exprUnit { $$ = A_ComExprUnit($1->pos, A_ComExpr($1->pos, A_ne, $1, $3)); }
        | NOT boolUnit { $$ = A_BoolUOpExprUnit($2->pos, A_BoolUOpExpr($2->pos, A_not, $2)); }
        ;

//checked
assignStmt: leftVal EQUALS rightVal SEMICOLON { $$ = A_AssignStmt($1->pos, $1, $3); }
           ;

//checked
leftVal: ID { $$ = A_IdExprLVal($1->pos, $1->id); }
       | leftVal LEFT_BRACKET ID RIGHT_BRACKET { $$ = A_ArrExprLVal($1->pos, A_ArrayExpr($1->pos, $1, A_IdIndexExpr($1->pos, $3->id))); }
       | leftVal LEFT_BRACKET NUM RIGHT_BRACKET { $$ = A_ArrExprLVal($1->pos, A_ArrayExpr($1->pos, $1, A_NumIndexExpr($1->pos, $3->num))); }
       | leftVal DOT ID { $$ = A_MemberExprLVal($1->pos, A_MemberExpr($1->pos, $1, $3->id)); }
       ;


//checked
rightVal: arithExpr { $$ = A_ArithExprRVal($1->pos, $1); }
         | boolExpr { $$ = A_BoolExprRVal($1->pos, $1); }
         ;

//checked
fnCall : ID LEFT_PAREN rightValList RIGHT_PAREN { $$ = A_FnCall($1->pos, $1->id, $3); }

//checked
rightValList : { $$ = NULL; } 
             | rightVal { $$ = A_RightValList($1, NULL); }
             | rightVal COMMA rightValList { $$ = A_RightValList($1, $3); }

//checked
varDeclStmt: LET varDecl SEMICOLON { $$ = A_VarDeclStmt($2->pos, $2); }
           | LET varDef SEMICOLON { $$ = A_VarDefStmt($2->pos, $2); }
           ;

//checked
varDecl: ID COLON type { $$ = A_VarDecl_Scalar($1->pos, A_VarDeclScalar($1->pos, $1->id, $3)); }
        | ID { $$ = A_VarDecl_Scalar($1->pos, A_VarDeclScalar($1->pos, $1->id, NULL)); }
        | ID LEFT_BRACKET NUM RIGHT_BRACKET COLON type { $$ = A_VarDecl_Array($1->pos, A_VarDeclArray($1->pos, $1->id, $3->num, $6)); }
        | ID LEFT_BRACKET NUM RIGHT_BRACKET { $$ = A_VarDecl_Array($1->pos, A_VarDeclArray($1->pos, $1->id, $3->num, NULL)); }
        ;


//checked
varDef : ID COLON type EQUALS rightVal { $$ = A_VarDef_Scalar($1->pos, A_VarDefScalar($1->pos, $1->id, $3, $5)); }
       | ID EQUALS rightVal { $$ = A_VarDef_Scalar($1->pos, A_VarDefScalar($1->pos, $1->id, NULL, $3)); }
       | ID LEFT_BRACKET NUM RIGHT_BRACKET COLON type EQUALS LEFT_BRACE rightValList RIGHT_BRACE { $$ = A_VarDef_Array($1->pos, A_VarDefArray($1->pos, $1->id, $3->num, $6, $9)); }
       | ID LEFT_BRACKET NUM RIGHT_BRACKET EQUALS LEFT_BRACE rightValList RIGHT_BRACE { $$ = A_VarDef_Array($1->pos, A_VarDefArray($1->pos, $1->id, $3->num, NULL, $7)); }
       ;


//checked
type: INT { $$ = A_NativeType(A_Pos(0,0), $1); }
     | ID { $$ = A_StructType(A_Pos(0,0), $1->id); }
     ;

//checked
structDef : STRUCT ID LEFT_BRACE varDeclList RIGHT_BRACE { $$ = A_StructDef($2->pos, $2->id, $4); }
          ;

//checked
varDeclList : { $$ = NULL; }
            | varDecl { $$ = A_VarDeclList($1, NULL); }
            | varDecl COMMA varDeclList { $$ = A_VarDeclList($1, $3); }
            ;

//checked
fnDeclStmt: fnDecl SEMICOLON { $$ = A_FnDeclStmt($1->pos, $1); }
          ;


//checked
fnDecl: FN ID LEFT_PAREN paramDecl RIGHT_PAREN { $$ = A_FnDecl($2->pos, $2->id, $4, NULL); }
       | FN ID LEFT_PAREN paramDecl RIGHT_PAREN ARROW type { $$ = A_FnDecl($2->pos, $2->id, $4, $7); }
       ;

//checked
paramDecl : varDeclList { $$ = A_ParamDecl($1); }
        ;

//checked
fnDef: fnDecl LEFT_BRACE codeBlockStmtList RIGHT_BRACE { $$ = A_FnDef($1->pos, $1, $3); }
     ;

//checked
codeBlockStmtList : codeBlockStmt { $$ = A_CodeBlockStmtList($1, NULL); }
                  | codeBlockStmt codeBlockStmtList { $$ = A_CodeBlockStmtList($1, $2); }
                  ;

//checked
codeBlockStmt : varDeclStmt { $$ = A_BlockVarDeclStmt($1->pos, $1); }
              | assignStmt { $$ = A_BlockAssignStmt($1->pos, $1); }
              | callStmt { $$ = A_BlockCallStmt($1->pos, $1); }
              | ifStmt { $$ = A_BlockIfStmt($1->pos, $1); }
              | whileStmt { $$ = A_BlockWhileStmt($1->pos, $1); }
              | returnStmt { $$ = A_BlockReturnStmt($1->pos, $1); }
              | CONTINUE SEMICOLON { $$ = A_BlockContinueStmt(A_Pos(0,0)); }
              | BREAK SEMICOLON { $$ = A_BlockBreakStmt(A_Pos(0,0)); }
              | SEMICOLON { $$ = A_BlockNullStmt(A_Pos(0,0)); }
              ;

//checked
returnStmt : RET rightVal SEMICOLON { $$ = A_ReturnStmt($2->pos, $2); }
           | RET SEMICOLON { $$ = A_ReturnStmt(A_Pos(0,0), NULL); }
           ;




//checked
callStmt : fnCall SEMICOLON { $$ = A_CallStmt($1->pos, $1); }
        ;

//checked
ifStmt : IF LEFT_PAREN boolExpr RIGHT_PAREN codeBlockStmtList { $$ = A_IfStmt($3->pos, $3, $5, NULL); }
       | IF LEFT_PAREN boolExpr RIGHT_PAREN LEFT_BRACE codeBlockStmtList RIGHT_BRACE { $$ = A_IfStmt($3->pos, $3, $6, NULL); }
       | IF LEFT_PAREN boolExpr RIGHT_PAREN codeBlockStmtList ELSE codeBlockStmtList { $$ = A_IfStmt($3->pos, $3, $5, $7); }
       | IF LEFT_PAREN boolExpr RIGHT_PAREN LEFT_BRACE codeBlockStmtList RIGHT_BRACE ELSE LEFT_BRACE codeBlockStmtList RIGHT_BRACE { $$ = A_IfStmt($3->pos, $3, $6, $10); }
       ;

//checked
whileStmt : WHILE LEFT_PAREN boolExpr RIGHT_PAREN codeBlockStmtList { $$ = A_WhileStmt($3->pos, $3, $5); }
        | WHILE LEFT_PAREN boolExpr RIGHT_PAREN LEFT_BRACE codeBlockStmtList RIGHT_BRACE { $$ = A_WhileStmt($3->pos, $3, $6); }
          ;


comment : COMMENT
          ;

%%

extern "C"{
void yyerror(char * s)
{
  fprintf(stderr, "%s\n",s);
}
int yywrap()
{
  return(1);
}
}


