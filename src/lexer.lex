%{
#include <stdio.h>
#include <string.h>
#include "TeaplAst.h"
#include "y.tab.hpp"
extern int line, col;
int c;
int calc(char *s, int len);
%}

%%

";" { return SEMICOLON; }
"(" { return LEFT_PAREN; }
")" { return RIGHT_PAREN; }
"[" { return LEFT_BRACKET; }
"]" { return RIGHT_BRACKET; }
"." { return DOT; }
"=" { return EQUALS; }
"," { return COMMA; }
":" { return COLON; }
"{" { return LEFT_BRACE; }
"}" { return RIGHT_BRACE; }


"->"        { return ARROW; }
"int"       { yylval.nativeType_ = A_intTypeKind; return INT; }
"let"       { return LET; }
"struct"    { return STRUCT; }
"fn"        { return FN; }
"ret"       { return RET; }
"continue"  { return CONTINUE; }
"break"     { return BREAK; }
"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }

"//"(.)*\n  {  }
"/*"([^*]|\n|\*+([^*/]|\n))*\*+"/"   {  }


[a-z_A-Z][a-z_A-Z0-9]* {
    char *temp = strdup(yytext);
    yylval.tokenId_ = A_TokenId(A_Pos(line,col), temp); 
    return ID;
}


<INITIAL>"\t" { col+=4; }
<INITIAL>[1-9][0-9]* {
    yylval.tokenNum_ = A_TokenNum(A_Pos(line, col), calc(yytext, yyleng));
    col+=yyleng;
    return NUM;
}
<INITIAL>0 {
    yylval.tokenNum_ = A_TokenNum(A_Pos(line, col), 0);
    ++col;
    return NUM;
}

"+" {
    return ADD;
}

"-" {
    return SUB;
}

"*" {
    return MUL;
}

"/" {
    return DIV;
}

"&&" {
    return AND;
}

"||" {
    return OR;
}

"!" {
    return NOT;
}

"<" {
    return LT;
}

"<=" {
    return LE;
}

">" {
    return GT;
}

">=" {
    return GE;
}

"==" {
    return EQ;
}

"!=" {
    return NE;
}

" " {

}

\n {
    line++;
}

. {    
    printf("Illegal input \"%c\"\n", yytext[0]);
}

%%

// This function takes a string of digits and its length as input, and returns the integer value of the string.
int calc(char *s, int len) {
    int ret = 0;
    for(int i = 0; i < len; i++)
        ret = ret * 10 + (s[i] - '0');
    return ret;
}