/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_HPP_INCLUDED
# define YY_YY_Y_TAB_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ID = 258,                      /* ID  */
    NUM = 259,                     /* NUM  */
    INT = 260,                     /* INT  */
    ARROW = 261,                   /* ARROW  */
    LET = 262,                     /* LET  */
    STRUCT = 263,                  /* STRUCT  */
    FN = 264,                      /* FN  */
    RET = 265,                     /* RET  */
    CONTINUE = 266,                /* CONTINUE  */
    BREAK = 267,                   /* BREAK  */
    IF = 268,                      /* IF  */
    ELSE = 269,                    /* ELSE  */
    WHILE = 270,                   /* WHILE  */
    COMMENT = 271,                 /* COMMENT  */
    ADD = 272,                     /* ADD  */
    SUB = 273,                     /* SUB  */
    MUL = 274,                     /* MUL  */
    DIV = 275,                     /* DIV  */
    AND = 276,                     /* AND  */
    OR = 277,                      /* OR  */
    NOT = 278,                     /* NOT  */
    LT = 279,                      /* LT  */
    LE = 280,                      /* LE  */
    GT = 281,                      /* GT  */
    GE = 282,                      /* GE  */
    EQ = 283,                      /* EQ  */
    NE = 284,                      /* NE  */
    SEMICOLON = 285,               /* SEMICOLON  */
    LEFT_PAREN = 286,              /* LEFT_PAREN  */
    RIGHT_PAREN = 287,             /* RIGHT_PAREN  */
    LEFT_BRACKET = 288,            /* LEFT_BRACKET  */
    RIGHT_BRACKET = 289,           /* RIGHT_BRACKET  */
    DOT = 290,                     /* DOT  */
    EQUALS = 291,                  /* EQUALS  */
    COMMA = 292,                   /* COMMA  */
    COLON = 293,                   /* COLON  */
    LEFT_BRACE = 294,              /* LEFT_BRACE  */
    RIGHT_BRACE = 295              /* RIGHT_BRACE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ID 258
#define NUM 259
#define INT 260
#define ARROW 261
#define LET 262
#define STRUCT 263
#define FN 264
#define RET 265
#define CONTINUE 266
#define BREAK 267
#define IF 268
#define ELSE 269
#define WHILE 270
#define COMMENT 271
#define ADD 272
#define SUB 273
#define MUL 274
#define DIV 275
#define AND 276
#define OR 277
#define NOT 278
#define LT 279
#define LE 280
#define GT 281
#define GE 282
#define EQ 283
#define NE 284
#define SEMICOLON 285
#define LEFT_PAREN 286
#define RIGHT_PAREN 287
#define LEFT_BRACKET 288
#define RIGHT_BRACKET 289
#define DOT 290
#define EQUALS 291
#define COMMA 292
#define COLON 293
#define LEFT_BRACE 294
#define RIGHT_BRACE 295

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 17 "parser.yacc"

    //Terminal
    A_pos pos_;
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

#line 196 "y.tab.hpp"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_HPP_INCLUDED  */
