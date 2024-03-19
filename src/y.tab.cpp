/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "parser.yacc"

#include <stdio.h>
#include "TeaplAst.h"

extern A_pos pos;
extern A_program root;

extern int yylex(void);
extern "C"{
extern void yyerror(char *s); 
extern int  yywrap();
}


#line 86 "y.tab.cpp"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "y.tab.hpp"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ID = 3,                         /* ID  */
  YYSYMBOL_NUM = 4,                        /* NUM  */
  YYSYMBOL_ARROW = 5,                      /* ARROW  */
  YYSYMBOL_INT = 6,                        /* INT  */
  YYSYMBOL_LET = 7,                        /* LET  */
  YYSYMBOL_STRUCT = 8,                     /* STRUCT  */
  YYSYMBOL_FN = 9,                         /* FN  */
  YYSYMBOL_RET = 10,                       /* RET  */
  YYSYMBOL_CONTINUE = 11,                  /* CONTINUE  */
  YYSYMBOL_BREAK = 12,                     /* BREAK  */
  YYSYMBOL_IF = 13,                        /* IF  */
  YYSYMBOL_ELSE = 14,                      /* ELSE  */
  YYSYMBOL_WHILE = 15,                     /* WHILE  */
  YYSYMBOL_COMMENT = 16,                   /* COMMENT  */
  YYSYMBOL_ADD = 17,                       /* ADD  */
  YYSYMBOL_SUB = 18,                       /* SUB  */
  YYSYMBOL_MUL = 19,                       /* MUL  */
  YYSYMBOL_DIV = 20,                       /* DIV  */
  YYSYMBOL_AND = 21,                       /* AND  */
  YYSYMBOL_OR = 22,                        /* OR  */
  YYSYMBOL_NOT = 23,                       /* NOT  */
  YYSYMBOL_LT = 24,                        /* LT  */
  YYSYMBOL_LE = 25,                        /* LE  */
  YYSYMBOL_GT = 26,                        /* GT  */
  YYSYMBOL_GE = 27,                        /* GE  */
  YYSYMBOL_EQ = 28,                        /* EQ  */
  YYSYMBOL_NE = 29,                        /* NE  */
  YYSYMBOL_SEMICOLON = 30,                 /* SEMICOLON  */
  YYSYMBOL_LEFT_PAREN = 31,                /* LEFT_PAREN  */
  YYSYMBOL_RIGHT_PAREN = 32,               /* RIGHT_PAREN  */
  YYSYMBOL_LEFT_BRACKET = 33,              /* LEFT_BRACKET  */
  YYSYMBOL_RIGHT_BRACKET = 34,             /* RIGHT_BRACKET  */
  YYSYMBOL_DOT = 35,                       /* DOT  */
  YYSYMBOL_EQUALS = 36,                    /* EQUALS  */
  YYSYMBOL_COMMA = 37,                     /* COMMA  */
  YYSYMBOL_COLON = 38,                     /* COLON  */
  YYSYMBOL_LEFT_BRACE = 39,                /* LEFT_BRACE  */
  YYSYMBOL_RIGHT_BRACE = 40,               /* RIGHT_BRACE  */
  YYSYMBOL_YYACCEPT = 41,                  /* $accept  */
  YYSYMBOL_program = 42,                   /* program  */
  YYSYMBOL_programElementList = 43,        /* programElementList  */
  YYSYMBOL_programElement = 44,            /* programElement  */
  YYSYMBOL_arithExpr = 45,                 /* arithExpr  */
  YYSYMBOL_exprUnit = 46,                  /* exprUnit  */
  YYSYMBOL_boolExpr = 47,                  /* boolExpr  */
  YYSYMBOL_boolUnit = 48,                  /* boolUnit  */
  YYSYMBOL_assignStmt = 49,                /* assignStmt  */
  YYSYMBOL_leftVal = 50,                   /* leftVal  */
  YYSYMBOL_rightVal = 51,                  /* rightVal  */
  YYSYMBOL_fnCall = 52,                    /* fnCall  */
  YYSYMBOL_rightValList = 53,              /* rightValList  */
  YYSYMBOL_varDeclStmt = 54,               /* varDeclStmt  */
  YYSYMBOL_varDecl = 55,                   /* varDecl  */
  YYSYMBOL_varDef = 56,                    /* varDef  */
  YYSYMBOL_type = 57,                      /* type  */
  YYSYMBOL_structDef = 58,                 /* structDef  */
  YYSYMBOL_varDeclList = 59,               /* varDeclList  */
  YYSYMBOL_fnDeclStmt = 60,                /* fnDeclStmt  */
  YYSYMBOL_fnDecl = 61,                    /* fnDecl  */
  YYSYMBOL_paramDecl = 62,                 /* paramDecl  */
  YYSYMBOL_fnDef = 63,                     /* fnDef  */
  YYSYMBOL_codeBlockStmtList = 64,         /* codeBlockStmtList  */
  YYSYMBOL_codeBlockStmt = 65,             /* codeBlockStmt  */
  YYSYMBOL_returnStmt = 66,                /* returnStmt  */
  YYSYMBOL_callStmt = 67,                  /* callStmt  */
  YYSYMBOL_ifStmt = 68,                    /* ifStmt  */
  YYSYMBOL_whileStmt = 69,                 /* whileStmt  */
  YYSYMBOL_comment = 70                    /* comment  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  20
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   230

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  41
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  30
/* YYNRULES -- Number of rules.  */
#define YYNRULES  87
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  179

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   295


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   166,   166,   171,   172,   175,   176,   177,   178,   179,
     180,   185,   186,   187,   188,   189,   193,   194,   195,   196,
     197,   198,   199,   200,   204,   205,   206,   210,   211,   212,
     213,   214,   215,   216,   217,   221,   225,   226,   227,   228,
     233,   234,   238,   241,   242,   243,   246,   247,   251,   252,
     253,   254,   259,   260,   261,   262,   267,   268,   272,   276,
     277,   278,   282,   287,   288,   292,   296,   300,   301,   305,
     306,   307,   308,   309,   310,   311,   312,   313,   317,   318,
     325,   329,   330,   331,   332,   336,   337,   341
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ID", "NUM", "ARROW",
  "INT", "LET", "STRUCT", "FN", "RET", "CONTINUE", "BREAK", "IF", "ELSE",
  "WHILE", "COMMENT", "ADD", "SUB", "MUL", "DIV", "AND", "OR", "NOT", "LT",
  "LE", "GT", "GE", "EQ", "NE", "SEMICOLON", "LEFT_PAREN", "RIGHT_PAREN",
  "LEFT_BRACKET", "RIGHT_BRACKET", "DOT", "EQUALS", "COMMA", "COLON",
  "LEFT_BRACE", "RIGHT_BRACE", "$accept", "program", "programElementList",
  "programElement", "arithExpr", "exprUnit", "boolExpr", "boolUnit",
  "assignStmt", "leftVal", "rightVal", "fnCall", "rightValList",
  "varDeclStmt", "varDecl", "varDef", "type", "structDef", "varDeclList",
  "fnDeclStmt", "fnDecl", "paramDecl", "fnDef", "codeBlockStmtList",
  "codeBlockStmt", "returnStmt", "callStmt", "ifStmt", "whileStmt",
  "comment", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-122)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-40)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     150,     3,    29,    45,  -122,  -122,    17,  -122,   150,  -122,
    -122,  -122,   -18,  -122,  -122,    59,    23,    48,    21,    51,
    -122,  -122,  -122,   137,    82,    97,    12,  -122,  -122,   100,
     100,    76,    10,    83,   116,    96,   120,  -122,  -122,    63,
     153,  -122,   145,   137,  -122,  -122,  -122,  -122,   152,    26,
    -122,     7,    97,    97,   113,   144,    14,  -122,    86,  -122,
    -122,  -122,  -122,   154,     1,   155,   147,  -122,   156,    97,
    -122,   159,  -122,  -122,    97,    97,   151,   188,    97,  -122,
    -122,  -122,   105,     7,  -122,   144,  -122,   143,    30,     7,
       7,     7,     7,     7,     7,     7,     7,     7,     7,    97,
      97,   161,   190,    97,   191,    12,   100,  -122,   189,   160,
     164,  -122,    55,    62,   165,   166,  -122,   168,   162,    12,
    -122,  -122,  -122,   158,   158,  -122,  -122,  -122,  -122,  -122,
    -122,  -122,  -122,  -122,   181,   169,   170,   141,  -122,   171,
    -122,  -122,    12,    97,  -122,    78,    99,  -122,  -122,  -122,
      97,   172,   146,   149,   173,  -122,  -122,   137,   192,   137,
    -122,   167,   174,    12,   175,   137,   176,  -122,    97,  -122,
     195,  -122,  -122,   177,   179,  -122,   137,   180,  -122
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,    87,    10,     0,     2,     3,     5,
       6,     7,     0,     8,     9,    49,     0,     0,     0,     0,
       1,     4,    62,     0,     0,     0,     0,    46,    47,    59,
      59,    36,     0,     0,     0,     0,     0,    77,    70,     0,
       0,    69,     0,    67,    74,    71,    72,    73,     0,    17,
      16,     0,     0,     0,    40,    15,    41,    26,     0,    53,
      19,    57,    56,    48,    49,    60,     0,    65,     0,    43,
      79,     0,    75,    76,     0,     0,     0,     0,     0,    80,
      66,    68,    51,     0,    23,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    59,    58,    63,    44,
       0,    78,     0,     0,     0,     0,    39,     0,     0,     0,
      15,    18,    27,    11,    12,    13,    14,    28,    29,    30,
      31,    32,    33,    25,    24,     0,     0,    22,    52,     0,
      48,    61,     0,    43,    42,     0,     0,    37,    38,    35,
      43,    50,    20,    21,    51,    64,    45,     0,    81,     0,
      85,     0,     0,     0,     0,     0,     0,    55,    43,    50,
      82,    83,    86,     0,     0,    54,     0,     0,    84
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -122,  -122,   202,  -122,   -46,   -25,   -44,   178,  -122,   -23,
     -24,   -20,  -121,    16,   211,  -122,  -100,  -122,   -26,  -122,
    -122,  -122,  -122,   -41,  -122,  -122,  -122,  -122,  -122,  -122
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     6,     7,     8,    54,    55,    56,    57,    38,    58,
     109,    60,   110,    41,    65,    17,    63,    10,    66,    11,
      12,    68,    13,    42,    43,    44,    45,    46,    47,    14
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      39,    59,    81,    40,    67,   140,    15,    87,    71,    88,
      49,    50,    22,    49,    50,    61,     9,    20,    62,   151,
      39,    23,   156,    40,     9,    51,    84,    85,    51,   161,
     112,   113,    18,    52,   104,    99,   100,    87,    83,   105,
      70,    53,   155,   123,   124,   125,   126,   173,    19,    85,
      85,    99,   100,    27,   117,   133,   134,    69,   120,   -36,
      29,   -36,   122,   169,   120,   120,   120,   120,   127,   128,
     129,   130,   131,   132,    85,    85,    99,   100,    28,   138,
     141,    31,    30,    99,   100,     1,    48,   145,    32,    33,
      34,    35,    24,    36,   146,    25,    76,    26,    77,    78,
      49,    50,    31,    64,   158,   160,     1,    69,    37,    32,
      33,    34,    35,    72,    36,    51,   164,   157,   166,   101,
      52,   102,    39,    39,   171,    40,    40,    74,    53,    37,
      89,    90,    91,    92,    39,   177,    39,    40,   159,    40,
      31,   118,    39,   119,     1,    40,    73,    32,    33,    34,
      35,    75,    36,    39,   114,   115,    40,     1,     2,     3,
      89,    90,    91,    92,   135,   136,     4,    37,    93,    94,
      95,    96,    97,    98,   -39,   121,   -39,    91,    92,   -37,
       5,   -37,   -38,    79,   -38,    80,    82,   107,   108,   111,
     103,   116,   106,   137,   142,   139,   144,   143,   149,   147,
     148,   150,    99,   152,   153,   154,   165,   167,   162,   174,
      21,   163,    16,   168,     0,   170,   172,   175,   176,     0,
     178,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      86
};

static const yytype_int16 yycheck[] =
{
      23,    25,    43,    23,    30,   105,     3,    53,    32,    53,
       3,     4,    30,     3,     4,     3,     0,     0,     6,   119,
      43,    39,   143,    43,     8,    18,    51,    52,    18,   150,
      74,    75,     3,    23,    33,    21,    22,    83,    31,    38,
      30,    31,   142,    89,    90,    91,    92,   168,     3,    74,
      75,    21,    22,    30,    78,    99,   100,    31,    83,    33,
      39,    35,    32,   163,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,    21,    22,    30,   103,
     106,     3,    31,    21,    22,     7,     4,    32,    10,    11,
      12,    13,    33,    15,    32,    36,    33,    38,    35,    36,
       3,     4,     3,     3,   145,   146,     7,    31,    30,    10,
      11,    12,    13,    30,    15,    18,   157,    39,   159,    33,
      23,    35,   145,   146,   165,   145,   146,    31,    31,    30,
      17,    18,    19,    20,   157,   176,   159,   157,    39,   159,
       3,    36,   165,    38,     7,   165,    30,    10,    11,    12,
      13,    31,    15,   176,     3,     4,   176,     7,     8,     9,
      17,    18,    19,    20,     3,     4,    16,    30,    24,    25,
      26,    27,    28,    29,    33,    32,    35,    19,    20,    33,
      30,    35,    33,    30,    35,    40,    34,    40,    32,    30,
      36,     3,    37,     3,     5,     4,    32,    37,    30,    34,
      34,    39,    21,    34,    34,    34,    14,    40,    36,    14,
       8,    38,     1,    39,    -1,    40,    40,    40,    39,    -1,
      40,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      52
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     7,     8,     9,    16,    30,    42,    43,    44,    54,
      58,    60,    61,    63,    70,     3,    55,    56,     3,     3,
       0,    43,    30,    39,    33,    36,    38,    30,    30,    39,
      31,     3,    10,    11,    12,    13,    15,    30,    49,    50,
      52,    54,    64,    65,    66,    67,    68,    69,     4,     3,
       4,    18,    23,    31,    45,    46,    47,    48,    50,    51,
      52,     3,     6,    57,     3,    55,    59,    59,    62,    31,
      30,    51,    30,    30,    31,    31,    33,    35,    36,    30,
      40,    64,    34,    31,    46,    46,    48,    45,    47,    17,
      18,    19,    20,    24,    25,    26,    27,    28,    29,    21,
      22,    33,    35,    36,    33,    38,    37,    40,    32,    51,
      53,    30,    47,    47,     3,     4,     3,    51,    36,    38,
      46,    32,    32,    45,    45,    45,    45,    46,    46,    46,
      46,    46,    46,    47,    47,     3,     4,     3,    51,     4,
      57,    59,     5,    37,    32,    32,    32,    34,    34,    30,
      39,    57,    34,    34,    34,    57,    53,    39,    64,    39,
      64,    53,    36,    38,    64,    14,    64,    40,    39,    57,
      40,    64,    40,    53,    14,    40,    39,    64,    40
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    41,    42,    43,    43,    44,    44,    44,    44,    44,
      44,    45,    45,    45,    45,    45,    46,    46,    46,    46,
      46,    46,    46,    46,    47,    47,    47,    48,    48,    48,
      48,    48,    48,    48,    48,    49,    50,    50,    50,    50,
      51,    51,    52,    53,    53,    53,    54,    54,    55,    55,
      55,    55,    56,    56,    56,    56,    57,    57,    58,    59,
      59,    59,    60,    61,    61,    62,    63,    64,    64,    65,
      65,    65,    65,    65,    65,    65,    65,    65,    66,    66,
      67,    68,    68,    68,    68,    69,    69,    70
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     3,     3,     3,     3,     1,     1,     1,     3,     1,
       4,     4,     3,     2,     3,     3,     1,     3,     3,     3,
       3,     3,     3,     3,     2,     4,     1,     4,     4,     3,
       1,     1,     4,     0,     1,     3,     3,     3,     3,     1,
       6,     4,     5,     3,    10,     8,     1,     1,     5,     0,
       1,     3,     2,     5,     7,     1,     4,     1,     2,     1,
       1,     1,     1,     1,     1,     2,     2,     1,     3,     2,
       2,     5,     7,     7,    11,     5,     7,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* program: programElementList  */
#line 166 "parser.yacc"
                             { 
        root = A_Program((yyvsp[0].programElementList_)); 
        (yyval.program_) = A_Program((yyvsp[0].programElementList_)); 
        }
#line 1271 "y.tab.cpp"
    break;

  case 3: /* programElementList: programElement  */
#line 171 "parser.yacc"
                                    { (yyval.programElementList_) = A_ProgramElementList((yyvsp[0].programElement_), NULL); }
#line 1277 "y.tab.cpp"
    break;

  case 4: /* programElementList: programElement programElementList  */
#line 172 "parser.yacc"
                                           { (yyval.programElementList_) = A_ProgramElementList((yyvsp[-1].programElement_), (yyvsp[0].programElementList_)); }
#line 1283 "y.tab.cpp"
    break;

  case 5: /* programElement: varDeclStmt  */
#line 175 "parser.yacc"
                            { (yyval.programElement_) = A_ProgramVarDeclStmt((yyvsp[0].varDeclStmt_)->pos, (yyvsp[0].varDeclStmt_)); }
#line 1289 "y.tab.cpp"
    break;

  case 6: /* programElement: structDef  */
#line 176 "parser.yacc"
                          { (yyval.programElement_) = A_ProgramStructDef((yyvsp[0].structDef_)->pos, (yyvsp[0].structDef_)); }
#line 1295 "y.tab.cpp"
    break;

  case 7: /* programElement: fnDeclStmt  */
#line 177 "parser.yacc"
                           { (yyval.programElement_) = A_ProgramFnDeclStmt((yyvsp[0].fnDeclStmt_)->pos, (yyvsp[0].fnDeclStmt_)); }
#line 1301 "y.tab.cpp"
    break;

  case 8: /* programElement: fnDef  */
#line 178 "parser.yacc"
                      { (yyval.programElement_) = A_ProgramFnDef((yyvsp[0].fnDef_)->pos, (yyvsp[0].fnDef_)); }
#line 1307 "y.tab.cpp"
    break;

  case 9: /* programElement: comment  */
#line 179 "parser.yacc"
                         { (yyval.programElement_) = A_ProgramNullStmt(A_Pos(0,0)); }
#line 1313 "y.tab.cpp"
    break;

  case 10: /* programElement: SEMICOLON  */
#line 180 "parser.yacc"
                          { (yyval.programElement_) = A_ProgramNullStmt(A_Pos(0,0)); }
#line 1319 "y.tab.cpp"
    break;

  case 11: /* arithExpr: arithExpr ADD arithExpr  */
#line 185 "parser.yacc"
                                   { (yyval.arithExpr_) = A_ArithBiOp_Expr((yyvsp[-2].arithExpr_)->pos, A_ArithBiOpExpr((yyvsp[-2].arithExpr_)->pos, A_add, (yyvsp[-2].arithExpr_), (yyvsp[0].arithExpr_))); }
#line 1325 "y.tab.cpp"
    break;

  case 12: /* arithExpr: arithExpr SUB arithExpr  */
#line 186 "parser.yacc"
                                   { (yyval.arithExpr_) = A_ArithBiOp_Expr((yyvsp[-2].arithExpr_)->pos, A_ArithBiOpExpr((yyvsp[-2].arithExpr_)->pos, A_sub, (yyvsp[-2].arithExpr_), (yyvsp[0].arithExpr_))); }
#line 1331 "y.tab.cpp"
    break;

  case 13: /* arithExpr: arithExpr MUL arithExpr  */
#line 187 "parser.yacc"
                                   { (yyval.arithExpr_) = A_ArithBiOp_Expr((yyvsp[-2].arithExpr_)->pos, A_ArithBiOpExpr((yyvsp[-2].arithExpr_)->pos, A_mul, (yyvsp[-2].arithExpr_), (yyvsp[0].arithExpr_))); }
#line 1337 "y.tab.cpp"
    break;

  case 14: /* arithExpr: arithExpr DIV arithExpr  */
#line 188 "parser.yacc"
                                   { (yyval.arithExpr_) = A_ArithBiOp_Expr((yyvsp[-2].arithExpr_)->pos, A_ArithBiOpExpr((yyvsp[-2].arithExpr_)->pos, A_div, (yyvsp[-2].arithExpr_), (yyvsp[0].arithExpr_))); }
#line 1343 "y.tab.cpp"
    break;

  case 15: /* arithExpr: exprUnit  */
#line 189 "parser.yacc"
                    { (yyval.arithExpr_) = A_ExprUnit((yyvsp[0].exprUnit_)->pos, (yyvsp[0].exprUnit_)); }
#line 1349 "y.tab.cpp"
    break;

  case 16: /* exprUnit: NUM  */
#line 193 "parser.yacc"
               { (yyval.exprUnit_) = A_NumExprUnit((yyvsp[0].tokenNum_)->pos, (yyvsp[0].tokenNum_)->num); }
#line 1355 "y.tab.cpp"
    break;

  case 17: /* exprUnit: ID  */
#line 194 "parser.yacc"
             { (yyval.exprUnit_) = A_IdExprUnit((yyvsp[0].tokenId_)->pos, (yyvsp[0].tokenId_)->id); }
#line 1361 "y.tab.cpp"
    break;

  case 18: /* exprUnit: LEFT_PAREN arithExpr RIGHT_PAREN  */
#line 195 "parser.yacc"
                                           { (yyval.exprUnit_) = A_ArithExprUnit((yyvsp[-1].arithExpr_)->pos, (yyvsp[-1].arithExpr_)); }
#line 1367 "y.tab.cpp"
    break;

  case 19: /* exprUnit: fnCall  */
#line 196 "parser.yacc"
                 { (yyval.exprUnit_) = A_CallExprUnit((yyvsp[0].fnCall_)->pos, (yyvsp[0].fnCall_)); }
#line 1373 "y.tab.cpp"
    break;

  case 20: /* exprUnit: leftVal LEFT_BRACKET ID RIGHT_BRACKET  */
#line 197 "parser.yacc"
                                                { (yyval.exprUnit_) = A_ArrayExprUnit((yyvsp[-3].leftVal_)->pos, A_ArrayExpr((yyvsp[-3].leftVal_)->pos, (yyvsp[-3].leftVal_), A_IdIndexExpr((yyvsp[-3].leftVal_)->pos, (yyvsp[-1].tokenId_)->id))); }
#line 1379 "y.tab.cpp"
    break;

  case 21: /* exprUnit: leftVal LEFT_BRACKET NUM RIGHT_BRACKET  */
#line 198 "parser.yacc"
                                                  { (yyval.exprUnit_) = A_ArrayExprUnit((yyvsp[-3].leftVal_)->pos, A_ArrayExpr((yyvsp[-3].leftVal_)->pos, (yyvsp[-3].leftVal_), A_NumIndexExpr((yyvsp[-3].leftVal_)->pos, (yyvsp[-1].tokenNum_)->num))); }
#line 1385 "y.tab.cpp"
    break;

  case 22: /* exprUnit: leftVal DOT ID  */
#line 199 "parser.yacc"
                         { (yyval.exprUnit_) = A_MemberExprUnit((yyvsp[-2].leftVal_)->pos, A_MemberExpr((yyvsp[-2].leftVal_)->pos, (yyvsp[-2].leftVal_), (yyvsp[0].tokenId_)->id)); }
#line 1391 "y.tab.cpp"
    break;

  case 23: /* exprUnit: SUB exprUnit  */
#line 200 "parser.yacc"
                       { (yyval.exprUnit_) = A_ArithUExprUnit((yyvsp[0].exprUnit_)->pos, A_ArithUExpr((yyvsp[0].exprUnit_)->pos, A_neg, (yyvsp[0].exprUnit_))); }
#line 1397 "y.tab.cpp"
    break;

  case 24: /* boolExpr: boolExpr OR boolExpr  */
#line 204 "parser.yacc"
                               { (yyval.boolExpr_) = A_BoolBiOp_Expr((yyvsp[-2].boolExpr_)->pos, A_BoolBiOpExpr((yyvsp[-2].boolExpr_)->pos, A_or, (yyvsp[-2].boolExpr_), (yyvsp[0].boolExpr_))); }
#line 1403 "y.tab.cpp"
    break;

  case 25: /* boolExpr: boolExpr AND boolExpr  */
#line 205 "parser.yacc"
                                { (yyval.boolExpr_) = A_BoolBiOp_Expr((yyvsp[-2].boolExpr_)->pos, A_BoolBiOpExpr((yyvsp[-2].boolExpr_)->pos, A_and, (yyvsp[-2].boolExpr_), (yyvsp[0].boolExpr_))); }
#line 1409 "y.tab.cpp"
    break;

  case 26: /* boolExpr: boolUnit  */
#line 206 "parser.yacc"
                   { (yyval.boolExpr_) = A_BoolExpr((yyvsp[0].boolUnit_)->pos, (yyvsp[0].boolUnit_)); }
#line 1415 "y.tab.cpp"
    break;

  case 27: /* boolUnit: LEFT_PAREN boolExpr RIGHT_PAREN  */
#line 210 "parser.yacc"
                                          { (yyval.boolUnit_) = A_BoolExprUnit((yyvsp[-1].boolExpr_)->pos, (yyvsp[-1].boolExpr_)); }
#line 1421 "y.tab.cpp"
    break;

  case 28: /* boolUnit: exprUnit LT exprUnit  */
#line 211 "parser.yacc"
                               { (yyval.boolUnit_) = A_ComExprUnit((yyvsp[-2].exprUnit_)->pos, A_ComExpr((yyvsp[-2].exprUnit_)->pos, A_lt, (yyvsp[-2].exprUnit_), (yyvsp[0].exprUnit_))); }
#line 1427 "y.tab.cpp"
    break;

  case 29: /* boolUnit: exprUnit LE exprUnit  */
#line 212 "parser.yacc"
                               { (yyval.boolUnit_) = A_ComExprUnit((yyvsp[-2].exprUnit_)->pos, A_ComExpr((yyvsp[-2].exprUnit_)->pos, A_le, (yyvsp[-2].exprUnit_), (yyvsp[0].exprUnit_))); }
#line 1433 "y.tab.cpp"
    break;

  case 30: /* boolUnit: exprUnit GT exprUnit  */
#line 213 "parser.yacc"
                               { (yyval.boolUnit_) = A_ComExprUnit((yyvsp[-2].exprUnit_)->pos, A_ComExpr((yyvsp[-2].exprUnit_)->pos, A_gt, (yyvsp[-2].exprUnit_), (yyvsp[0].exprUnit_))); }
#line 1439 "y.tab.cpp"
    break;

  case 31: /* boolUnit: exprUnit GE exprUnit  */
#line 214 "parser.yacc"
                               { (yyval.boolUnit_) = A_ComExprUnit((yyvsp[-2].exprUnit_)->pos, A_ComExpr((yyvsp[-2].exprUnit_)->pos, A_ge, (yyvsp[-2].exprUnit_), (yyvsp[0].exprUnit_))); }
#line 1445 "y.tab.cpp"
    break;

  case 32: /* boolUnit: exprUnit EQ exprUnit  */
#line 215 "parser.yacc"
                               { (yyval.boolUnit_) = A_ComExprUnit((yyvsp[-2].exprUnit_)->pos, A_ComExpr((yyvsp[-2].exprUnit_)->pos, A_eq, (yyvsp[-2].exprUnit_), (yyvsp[0].exprUnit_))); }
#line 1451 "y.tab.cpp"
    break;

  case 33: /* boolUnit: exprUnit NE exprUnit  */
#line 216 "parser.yacc"
                               { (yyval.boolUnit_) = A_ComExprUnit((yyvsp[-2].exprUnit_)->pos, A_ComExpr((yyvsp[-2].exprUnit_)->pos, A_ne, (yyvsp[-2].exprUnit_), (yyvsp[0].exprUnit_))); }
#line 1457 "y.tab.cpp"
    break;

  case 34: /* boolUnit: NOT boolUnit  */
#line 217 "parser.yacc"
                       { (yyval.boolUnit_) = A_BoolUOpExprUnit((yyvsp[0].boolUnit_)->pos, A_BoolUOpExpr((yyvsp[0].boolUnit_)->pos, A_not, (yyvsp[0].boolUnit_))); }
#line 1463 "y.tab.cpp"
    break;

  case 35: /* assignStmt: leftVal EQUALS rightVal SEMICOLON  */
#line 221 "parser.yacc"
                                              { (yyval.assignStmt_) = A_AssignStmt((yyvsp[-3].leftVal_)->pos, (yyvsp[-3].leftVal_), (yyvsp[-1].rightVal_)); }
#line 1469 "y.tab.cpp"
    break;

  case 36: /* leftVal: ID  */
#line 225 "parser.yacc"
            { (yyval.leftVal_) = A_IdExprLVal((yyvsp[0].tokenId_)->pos, (yyvsp[0].tokenId_)->id); }
#line 1475 "y.tab.cpp"
    break;

  case 37: /* leftVal: leftVal LEFT_BRACKET ID RIGHT_BRACKET  */
#line 226 "parser.yacc"
                                               { (yyval.leftVal_) = A_ArrExprLVal((yyvsp[-3].leftVal_)->pos, A_ArrayExpr((yyvsp[-3].leftVal_)->pos, (yyvsp[-3].leftVal_), A_IdIndexExpr((yyvsp[-3].leftVal_)->pos, (yyvsp[-1].tokenId_)->id))); }
#line 1481 "y.tab.cpp"
    break;

  case 38: /* leftVal: leftVal LEFT_BRACKET NUM RIGHT_BRACKET  */
#line 227 "parser.yacc"
                                                { (yyval.leftVal_) = A_ArrExprLVal((yyvsp[-3].leftVal_)->pos, A_ArrayExpr((yyvsp[-3].leftVal_)->pos, (yyvsp[-3].leftVal_), A_NumIndexExpr((yyvsp[-3].leftVal_)->pos, (yyvsp[-1].tokenNum_)->num))); }
#line 1487 "y.tab.cpp"
    break;

  case 39: /* leftVal: leftVal DOT ID  */
#line 228 "parser.yacc"
                        { (yyval.leftVal_) = A_MemberExprLVal((yyvsp[-2].leftVal_)->pos, A_MemberExpr((yyvsp[-2].leftVal_)->pos, (yyvsp[-2].leftVal_), (yyvsp[0].tokenId_)->id)); }
#line 1493 "y.tab.cpp"
    break;

  case 40: /* rightVal: arithExpr  */
#line 233 "parser.yacc"
                    { (yyval.rightVal_) = A_ArithExprRVal((yyvsp[0].arithExpr_)->pos, (yyvsp[0].arithExpr_)); }
#line 1499 "y.tab.cpp"
    break;

  case 41: /* rightVal: boolExpr  */
#line 234 "parser.yacc"
                    { (yyval.rightVal_) = A_BoolExprRVal((yyvsp[0].boolExpr_)->pos, (yyvsp[0].boolExpr_)); }
#line 1505 "y.tab.cpp"
    break;

  case 42: /* fnCall: ID LEFT_PAREN rightValList RIGHT_PAREN  */
#line 238 "parser.yacc"
                                                { (yyval.fnCall_) = A_FnCall((yyvsp[-3].tokenId_)->pos, (yyvsp[-3].tokenId_)->id, (yyvsp[-1].rightValList_)); }
#line 1511 "y.tab.cpp"
    break;

  case 43: /* rightValList: %empty  */
#line 241 "parser.yacc"
               { (yyval.rightValList_) = NULL; }
#line 1517 "y.tab.cpp"
    break;

  case 44: /* rightValList: rightVal  */
#line 242 "parser.yacc"
                        { (yyval.rightValList_) = A_RightValList((yyvsp[0].rightVal_), NULL); }
#line 1523 "y.tab.cpp"
    break;

  case 45: /* rightValList: rightVal COMMA rightValList  */
#line 243 "parser.yacc"
                                           { (yyval.rightValList_) = A_RightValList((yyvsp[-2].rightVal_), (yyvsp[0].rightValList_)); }
#line 1529 "y.tab.cpp"
    break;

  case 46: /* varDeclStmt: LET varDecl SEMICOLON  */
#line 246 "parser.yacc"
                                   { (yyval.varDeclStmt_) = A_VarDeclStmt((yyvsp[-1].varDecl_)->pos, (yyvsp[-1].varDecl_)); }
#line 1535 "y.tab.cpp"
    break;

  case 47: /* varDeclStmt: LET varDef SEMICOLON  */
#line 247 "parser.yacc"
                                  { (yyval.varDeclStmt_) = A_VarDefStmt((yyvsp[-1].varDef_)->pos, (yyvsp[-1].varDef_)); }
#line 1541 "y.tab.cpp"
    break;

  case 48: /* varDecl: ID COLON type  */
#line 251 "parser.yacc"
                       { (yyval.varDecl_) = A_VarDecl_Scalar((yyvsp[-2].tokenId_)->pos, A_VarDeclScalar((yyvsp[-2].tokenId_)->pos, (yyvsp[-2].tokenId_)->id, (yyvsp[0].type_))); }
#line 1547 "y.tab.cpp"
    break;

  case 49: /* varDecl: ID  */
#line 252 "parser.yacc"
             { (yyval.varDecl_) = A_VarDecl_Scalar((yyvsp[0].tokenId_)->pos, A_VarDeclScalar((yyvsp[0].tokenId_)->pos, (yyvsp[0].tokenId_)->id, NULL)); }
#line 1553 "y.tab.cpp"
    break;

  case 50: /* varDecl: ID LEFT_BRACKET NUM RIGHT_BRACKET COLON type  */
#line 253 "parser.yacc"
                                                       { (yyval.varDecl_) = A_VarDecl_Array((yyvsp[-5].tokenId_)->pos, A_VarDeclArray((yyvsp[-5].tokenId_)->pos, (yyvsp[-5].tokenId_)->id, (yyvsp[-3].tokenNum_)->num, (yyvsp[0].type_))); }
#line 1559 "y.tab.cpp"
    break;

  case 51: /* varDecl: ID LEFT_BRACKET NUM RIGHT_BRACKET  */
#line 254 "parser.yacc"
                                            { (yyval.varDecl_) = A_VarDecl_Array((yyvsp[-3].tokenId_)->pos, A_VarDeclArray((yyvsp[-3].tokenId_)->pos, (yyvsp[-3].tokenId_)->id, (yyvsp[-1].tokenNum_)->num, NULL)); }
#line 1565 "y.tab.cpp"
    break;

  case 52: /* varDef: ID COLON type EQUALS rightVal  */
#line 259 "parser.yacc"
                                       { (yyval.varDef_) = A_VarDef_Scalar((yyvsp[-4].tokenId_)->pos, A_VarDefScalar((yyvsp[-4].tokenId_)->pos, (yyvsp[-4].tokenId_)->id, (yyvsp[-2].type_), (yyvsp[0].rightVal_))); }
#line 1571 "y.tab.cpp"
    break;

  case 53: /* varDef: ID EQUALS rightVal  */
#line 260 "parser.yacc"
                            { (yyval.varDef_) = A_VarDef_Scalar((yyvsp[-2].tokenId_)->pos, A_VarDefScalar((yyvsp[-2].tokenId_)->pos, (yyvsp[-2].tokenId_)->id, NULL, (yyvsp[0].rightVal_))); }
#line 1577 "y.tab.cpp"
    break;

  case 54: /* varDef: ID LEFT_BRACKET NUM RIGHT_BRACKET COLON type EQUALS LEFT_BRACE rightValList RIGHT_BRACE  */
#line 261 "parser.yacc"
                                                                                                 { (yyval.varDef_) = A_VarDef_Array((yyvsp[-9].tokenId_)->pos, A_VarDefArray((yyvsp[-9].tokenId_)->pos, (yyvsp[-9].tokenId_)->id, (yyvsp[-7].tokenNum_)->num, (yyvsp[-4].type_), (yyvsp[-1].rightValList_))); }
#line 1583 "y.tab.cpp"
    break;

  case 55: /* varDef: ID LEFT_BRACKET NUM RIGHT_BRACKET EQUALS LEFT_BRACE rightValList RIGHT_BRACE  */
#line 262 "parser.yacc"
                                                                                      { (yyval.varDef_) = A_VarDef_Array((yyvsp[-7].tokenId_)->pos, A_VarDefArray((yyvsp[-7].tokenId_)->pos, (yyvsp[-7].tokenId_)->id, (yyvsp[-5].tokenNum_)->num, NULL, (yyvsp[-1].rightValList_))); }
#line 1589 "y.tab.cpp"
    break;

  case 56: /* type: INT  */
#line 267 "parser.yacc"
          { (yyval.type_) = A_NativeType(A_Pos(0,0), (yyvsp[0].nativeType_)); }
#line 1595 "y.tab.cpp"
    break;

  case 57: /* type: ID  */
#line 268 "parser.yacc"
          { (yyval.type_) = A_StructType(A_Pos(0,0), (yyvsp[0].tokenId_)->id); }
#line 1601 "y.tab.cpp"
    break;

  case 58: /* structDef: STRUCT ID LEFT_BRACE varDeclList RIGHT_BRACE  */
#line 272 "parser.yacc"
                                                         { (yyval.structDef_) = A_StructDef((yyvsp[-3].tokenId_)->pos, (yyvsp[-3].tokenId_)->id, (yyvsp[-1].varDeclList_)); }
#line 1607 "y.tab.cpp"
    break;

  case 59: /* varDeclList: %empty  */
#line 276 "parser.yacc"
              { (yyval.varDeclList_) = NULL; }
#line 1613 "y.tab.cpp"
    break;

  case 60: /* varDeclList: varDecl  */
#line 277 "parser.yacc"
                      { (yyval.varDeclList_) = A_VarDeclList((yyvsp[0].varDecl_), NULL); }
#line 1619 "y.tab.cpp"
    break;

  case 61: /* varDeclList: varDecl COMMA varDeclList  */
#line 278 "parser.yacc"
                                        { (yyval.varDeclList_) = A_VarDeclList((yyvsp[-2].varDecl_), (yyvsp[0].varDeclList_)); }
#line 1625 "y.tab.cpp"
    break;

  case 62: /* fnDeclStmt: fnDecl SEMICOLON  */
#line 282 "parser.yacc"
                             { (yyval.fnDeclStmt_) = A_FnDeclStmt((yyvsp[-1].fnDecl_)->pos, (yyvsp[-1].fnDecl_)); }
#line 1631 "y.tab.cpp"
    break;

  case 63: /* fnDecl: FN ID LEFT_PAREN paramDecl RIGHT_PAREN  */
#line 287 "parser.yacc"
                                               { (yyval.fnDecl_) = A_FnDecl((yyvsp[-3].tokenId_)->pos, (yyvsp[-3].tokenId_)->id, (yyvsp[-1].paramDecl_), NULL); }
#line 1637 "y.tab.cpp"
    break;

  case 64: /* fnDecl: FN ID LEFT_PAREN paramDecl RIGHT_PAREN ARROW type  */
#line 288 "parser.yacc"
                                                           { (yyval.fnDecl_) = A_FnDecl((yyvsp[-5].tokenId_)->pos, (yyvsp[-5].tokenId_)->id, (yyvsp[-3].paramDecl_), (yyvsp[0].type_)); }
#line 1643 "y.tab.cpp"
    break;

  case 65: /* paramDecl: varDeclList  */
#line 292 "parser.yacc"
                        { (yyval.paramDecl_) = A_ParamDecl((yyvsp[0].varDeclList_)); }
#line 1649 "y.tab.cpp"
    break;

  case 66: /* fnDef: fnDecl LEFT_BRACE codeBlockStmtList RIGHT_BRACE  */
#line 296 "parser.yacc"
                                                       { (yyval.fnDef_) = A_FnDef((yyvsp[-3].fnDecl_)->pos, (yyvsp[-3].fnDecl_), (yyvsp[-1].codeBlockStmtList_)); }
#line 1655 "y.tab.cpp"
    break;

  case 67: /* codeBlockStmtList: codeBlockStmt  */
#line 300 "parser.yacc"
                                  { (yyval.codeBlockStmtList_) = A_CodeBlockStmtList((yyvsp[0].codeBlockStmt_), NULL); }
#line 1661 "y.tab.cpp"
    break;

  case 68: /* codeBlockStmtList: codeBlockStmt codeBlockStmtList  */
#line 301 "parser.yacc"
                                                    { (yyval.codeBlockStmtList_) = A_CodeBlockStmtList((yyvsp[-1].codeBlockStmt_), (yyvsp[0].codeBlockStmtList_)); }
#line 1667 "y.tab.cpp"
    break;

  case 69: /* codeBlockStmt: varDeclStmt  */
#line 305 "parser.yacc"
                            { (yyval.codeBlockStmt_) = A_BlockVarDeclStmt((yyvsp[0].varDeclStmt_)->pos, (yyvsp[0].varDeclStmt_)); }
#line 1673 "y.tab.cpp"
    break;

  case 70: /* codeBlockStmt: assignStmt  */
#line 306 "parser.yacc"
                           { (yyval.codeBlockStmt_) = A_BlockAssignStmt((yyvsp[0].assignStmt_)->pos, (yyvsp[0].assignStmt_)); }
#line 1679 "y.tab.cpp"
    break;

  case 71: /* codeBlockStmt: callStmt  */
#line 307 "parser.yacc"
                         { (yyval.codeBlockStmt_) = A_BlockCallStmt((yyvsp[0].callStmt_)->pos, (yyvsp[0].callStmt_)); }
#line 1685 "y.tab.cpp"
    break;

  case 72: /* codeBlockStmt: ifStmt  */
#line 308 "parser.yacc"
                       { (yyval.codeBlockStmt_) = A_BlockIfStmt((yyvsp[0].ifStmt_)->pos, (yyvsp[0].ifStmt_)); }
#line 1691 "y.tab.cpp"
    break;

  case 73: /* codeBlockStmt: whileStmt  */
#line 309 "parser.yacc"
                          { (yyval.codeBlockStmt_) = A_BlockWhileStmt((yyvsp[0].whileStmt_)->pos, (yyvsp[0].whileStmt_)); }
#line 1697 "y.tab.cpp"
    break;

  case 74: /* codeBlockStmt: returnStmt  */
#line 310 "parser.yacc"
                           { (yyval.codeBlockStmt_) = A_BlockReturnStmt((yyvsp[0].returnStmt_)->pos, (yyvsp[0].returnStmt_)); }
#line 1703 "y.tab.cpp"
    break;

  case 75: /* codeBlockStmt: CONTINUE SEMICOLON  */
#line 311 "parser.yacc"
                                   { (yyval.codeBlockStmt_) = A_BlockContinueStmt(A_Pos(0,0)); }
#line 1709 "y.tab.cpp"
    break;

  case 76: /* codeBlockStmt: BREAK SEMICOLON  */
#line 312 "parser.yacc"
                                { (yyval.codeBlockStmt_) = A_BlockBreakStmt(A_Pos(0,0)); }
#line 1715 "y.tab.cpp"
    break;

  case 77: /* codeBlockStmt: SEMICOLON  */
#line 313 "parser.yacc"
                          { (yyval.codeBlockStmt_) = A_BlockNullStmt(A_Pos(0,0)); }
#line 1721 "y.tab.cpp"
    break;

  case 78: /* returnStmt: RET rightVal SEMICOLON  */
#line 317 "parser.yacc"
                                    { (yyval.returnStmt_) = A_ReturnStmt((yyvsp[-1].rightVal_)->pos, (yyvsp[-1].rightVal_)); }
#line 1727 "y.tab.cpp"
    break;

  case 79: /* returnStmt: RET SEMICOLON  */
#line 318 "parser.yacc"
                           { (yyval.returnStmt_) = A_ReturnStmt(A_Pos(0,0), NULL); }
#line 1733 "y.tab.cpp"
    break;

  case 80: /* callStmt: fnCall SEMICOLON  */
#line 325 "parser.yacc"
                            { (yyval.callStmt_) = A_CallStmt((yyvsp[-1].fnCall_)->pos, (yyvsp[-1].fnCall_)); }
#line 1739 "y.tab.cpp"
    break;

  case 81: /* ifStmt: IF LEFT_PAREN boolExpr RIGHT_PAREN codeBlockStmtList  */
#line 329 "parser.yacc"
                                                              { (yyval.ifStmt_) = A_IfStmt((yyvsp[-2].boolExpr_)->pos, (yyvsp[-2].boolExpr_), (yyvsp[0].codeBlockStmtList_), NULL); }
#line 1745 "y.tab.cpp"
    break;

  case 82: /* ifStmt: IF LEFT_PAREN boolExpr RIGHT_PAREN LEFT_BRACE codeBlockStmtList RIGHT_BRACE  */
#line 330 "parser.yacc"
                                                                                     { (yyval.ifStmt_) = A_IfStmt((yyvsp[-4].boolExpr_)->pos, (yyvsp[-4].boolExpr_), (yyvsp[-1].codeBlockStmtList_), NULL); }
#line 1751 "y.tab.cpp"
    break;

  case 83: /* ifStmt: IF LEFT_PAREN boolExpr RIGHT_PAREN codeBlockStmtList ELSE codeBlockStmtList  */
#line 331 "parser.yacc"
                                                                                     { (yyval.ifStmt_) = A_IfStmt((yyvsp[-4].boolExpr_)->pos, (yyvsp[-4].boolExpr_), (yyvsp[-2].codeBlockStmtList_), (yyvsp[0].codeBlockStmtList_)); }
#line 1757 "y.tab.cpp"
    break;

  case 84: /* ifStmt: IF LEFT_PAREN boolExpr RIGHT_PAREN LEFT_BRACE codeBlockStmtList RIGHT_BRACE ELSE LEFT_BRACE codeBlockStmtList RIGHT_BRACE  */
#line 332 "parser.yacc"
                                                                                                                                   { (yyval.ifStmt_) = A_IfStmt((yyvsp[-8].boolExpr_)->pos, (yyvsp[-8].boolExpr_), (yyvsp[-5].codeBlockStmtList_), (yyvsp[-1].codeBlockStmtList_)); }
#line 1763 "y.tab.cpp"
    break;

  case 85: /* whileStmt: WHILE LEFT_PAREN boolExpr RIGHT_PAREN codeBlockStmtList  */
#line 336 "parser.yacc"
                                                                    { (yyval.whileStmt_) = A_WhileStmt((yyvsp[-2].boolExpr_)->pos, (yyvsp[-2].boolExpr_), (yyvsp[0].codeBlockStmtList_)); }
#line 1769 "y.tab.cpp"
    break;

  case 86: /* whileStmt: WHILE LEFT_PAREN boolExpr RIGHT_PAREN LEFT_BRACE codeBlockStmtList RIGHT_BRACE  */
#line 337 "parser.yacc"
                                                                                         { (yyval.whileStmt_) = A_WhileStmt((yyvsp[-4].boolExpr_)->pos, (yyvsp[-4].boolExpr_), (yyvsp[-1].codeBlockStmtList_)); }
#line 1775 "y.tab.cpp"
    break;


#line 1779 "y.tab.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 344 "parser.yacc"


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


