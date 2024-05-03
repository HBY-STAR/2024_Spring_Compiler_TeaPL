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

";" { col+=1; yylval.pos_ = A_Pos(line,col); return SEMICOLON; }
"(" { col+=1; yylval.pos_ = A_Pos(line,col); return LEFT_PAREN; }
")" { col+=1; yylval.pos_ = A_Pos(line,col); return RIGHT_PAREN; }
"[" { col+=1; yylval.pos_ = A_Pos(line,col); return LEFT_BRACKET; }
"]" { col+=1; yylval.pos_ = A_Pos(line,col); return RIGHT_BRACKET; }
"." { col+=1; yylval.pos_ = A_Pos(line,col); return DOT; }
"=" { col+=1; yylval.pos_ = A_Pos(line,col); return EQUALS; }
"," { col+=1; yylval.pos_ = A_Pos(line,col); return COMMA; }
":" { col+=1; yylval.pos_ = A_Pos(line,col); return COLON; }
"{" { col+=1; yylval.pos_ = A_Pos(line,col); return LEFT_BRACE; }
"}" { col+=1; yylval.pos_ = A_Pos(line,col); return RIGHT_BRACE; }


"->"        { col+=2; yylval.pos_ = A_Pos(line,col); return ARROW; }
"int"       { col+=3; yylval.nativeType_ = A_intTypeKind; return INT; }
"let"       { col+=3; yylval.pos_ = A_Pos(line,col); return LET; }
"struct"    { col+=6; yylval.pos_ = A_Pos(line,col); return STRUCT; }
"fn"        { col+=2; yylval.pos_ = A_Pos(line,col); return FN; }
"ret"       { col+=3; yylval.pos_ = A_Pos(line,col); return RET; }
"continue"  { col+=8; yylval.pos_ = A_Pos(line,col); return CONTINUE; }
"break"     { col+=5; yylval.pos_ = A_Pos(line,col); return BREAK; }
"if"        { col+=2; yylval.pos_ = A_Pos(line,col); return IF; }
"else"      { col+=4; yylval.pos_ = A_Pos(line,col); return ELSE; }
"while"     { col+=5; yylval.pos_ = A_Pos(line,col); return WHILE; }

"//"(.)*\n  { 
    for(int i = 0; yytext[i] != '\0'; i++) 
    { 
        if(yytext[i] == '\n') 
        { 
            line++; 
            col = 0; 
        } 
        else 
        { 
            col++; 
        } 
    } 
}

"/*"([^*]|\n|\*+([^*/]|\n))*\*+"/"   { 
    for(int i = 0; yytext[i] != '\0'; i++) 
    { 
        if(yytext[i] == '\n') 
        { 
            line++; 
            col = 0; 
        } else 
        { 
            col++;
        } 
    } 
}


[a-z_A-Z][a-z_A-Z0-9]* {
    col+=yyleng;
    char *temp = strdup(yytext);
    yylval.tokenId_ = A_TokenId(A_Pos(line,col), temp); 
    return ID;
}


[1-9][0-9]* {
    col+=yyleng;
    yylval.tokenNum_ = A_TokenNum(A_Pos(line, col), calc(yytext, yyleng));
    return NUM;
}
0 {
    ++col;
    yylval.tokenNum_ = A_TokenNum(A_Pos(line, col), 0);
    return NUM;
}

"+" {
    col+=1;
    yylval.pos_ = A_Pos(line,col);
    return ADD;
}

"-" {
    col+=1;
    yylval.pos_ = A_Pos(line,col);
    return SUB;
}

"*" {
    col+=1;
    yylval.pos_ = A_Pos(line,col);
    return MUL;
}

"/" {
    col+=1;
    yylval.pos_ = A_Pos(line,col);
    return DIV;
}

"&&" {
    col+=2;
    yylval.pos_ = A_Pos(line,col);
    return AND;
}

"||" {
    col+=2;
    yylval.pos_ = A_Pos(line,col);
    return OR;
}

"!" {
    col+=1;
    yylval.pos_ = A_Pos(line,col);
    return NOT;
}

"<" {
    col+=1;
    yylval.pos_ = A_Pos(line,col);
    return LT;
}

"<=" {
    col+=2;
    yylval.pos_ = A_Pos(line,col);
    return LE;
}

">" {
    col+=1;
    yylval.pos_ = A_Pos(line,col);
    return GT;
}

">=" {
    col+=2;
    yylval.pos_ = A_Pos(line,col);
    return GE;
}

"==" {
    col+=2;
    yylval.pos_ = A_Pos(line,col);
    return EQ;
}

"!=" {
    col+=2;
    yylval.pos_ = A_Pos(line,col);
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