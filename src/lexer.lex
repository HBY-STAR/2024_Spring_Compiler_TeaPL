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

";" { yylval.pos_ = A_Pos(line,col); col+=1; return SEMICOLON; }
"(" { yylval.pos_ = A_Pos(line,col); col+=1; return LEFT_PAREN; }
")" { yylval.pos_ = A_Pos(line,col); col+=1; return RIGHT_PAREN; }
"[" { yylval.pos_ = A_Pos(line,col); col+=1; return LEFT_BRACKET; }
"]" { yylval.pos_ = A_Pos(line,col); col+=1; return RIGHT_BRACKET; }
"." { yylval.pos_ = A_Pos(line,col); col+=1; return DOT; }
"=" { yylval.pos_ = A_Pos(line,col); col+=1; return EQUALS; }
"," { yylval.pos_ = A_Pos(line,col); col+=1; return COMMA; }
":" { yylval.pos_ = A_Pos(line,col); col+=1; return COLON; }
"{" { yylval.pos_ = A_Pos(line,col); col+=1; return LEFT_BRACE; }
"}" { yylval.pos_ = A_Pos(line,col); col+=1; return RIGHT_BRACE; }


"->"        { yylval.pos_ = A_Pos(line,col); col+=2; return ARROW; }
"int"       { yylval.nativeType_ = A_intTypeKind; col+=3; return INT; }
"let"       { yylval.pos_ = A_Pos(line,col); col+=3; return LET; }
"struct"    { yylval.pos_ = A_Pos(line,col); col+=6; return STRUCT; }
"fn"        { yylval.pos_ = A_Pos(line,col); col+=2; return FN; }
"ret"       { yylval.pos_ = A_Pos(line,col); col+=3; return RET; }
"continue"  { yylval.pos_ = A_Pos(line,col); col+=8; return CONTINUE; }
"break"     { yylval.pos_ = A_Pos(line,col); col+=5; return BREAK; }
"if"        { yylval.pos_ = A_Pos(line,col); col+=2; return IF; }
"else"      { yylval.pos_ = A_Pos(line,col); col+=4; return ELSE; }
"while"     { yylval.pos_ = A_Pos(line,col); col+=5; return WHILE; }

"//"(.)*\n  { }
"/*"([^*]|\n|\*+([^*/]|\n))*\*+"/"   { }


[a-z_A-Z][a-z_A-Z0-9]* {
    char *temp = strdup(yytext);
    yylval.tokenId_ = A_TokenId(A_Pos(line,col), temp); 
    col+=yyleng;
    return ID;
}


[1-9][0-9]* {
    yylval.tokenNum_ = A_TokenNum(A_Pos(line, col), calc(yytext, yyleng));
    col+=yyleng;
    return NUM;
}
0 {
    yylval.tokenNum_ = A_TokenNum(A_Pos(line, col), 0);
    ++col;
    return NUM;
}

"+" {
    yylval.pos_ = A_Pos(line,col);
    col+=1;
    return ADD;
}

"-" {
    yylval.pos_ = A_Pos(line,col);
    col+=1;
    return SUB;
}

"*" {
    yylval.pos_ = A_Pos(line,col);
    col+=1;
    return MUL;
}

"/" {
    yylval.pos_ = A_Pos(line,col);
    col+=1;
    return DIV;
}

"&&" {
    yylval.pos_ = A_Pos(line,col);
    col+=2;
    return AND;
}

"||" {
    yylval.pos_ = A_Pos(line,col);
    col+=2;
    return OR;
}

"!" {
    yylval.pos_ = A_Pos(line,col);
    col+=1;
    return NOT;
}

"<" {
    yylval.pos_ = A_Pos(line,col);
    col+=1;
    return LT;
}

"<=" {
    yylval.pos_ = A_Pos(line,col);
    col+=2;
    return LE;
}

">" {
    yylval.pos_ = A_Pos(line,col);
    col+=1;
    return GT;
}

">=" {
    yylval.pos_ = A_Pos(line,col);
    col+=2;
    return GE;
}

"==" {
    yylval.pos_ = A_Pos(line,col);
    col+=2;
    return EQ;
}

"!=" {
    yylval.pos_ = A_Pos(line,col);
    col+=2;
    return NE;
}

" " {
    col+=1;
}

"\t" { 
    col+=4;
}


\n {
    col=0;
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