%{
#include <stdio.h>
#include <stdlib.h>

#define ID 256
#define INTVAL 257
#define DBLVAL 258
#define CHARVAL 259
#define FLTVAL 260
#define STRVAL 261
#define VOID 262
#define SHORT 263
#define LONG 264
#define DOUBLE 265
#define CHAR 266
#define INT 267
#define FLOAT 268
#define EQ 269
#define NE 270
#define GE 271
#define LE 272
#define GT 273
#define LT 274
#define ADD 275
#define SUB 276
#define MUL 277
#define DIV 278
#define MOD 279
#define OR 280
#define AND 281
#define NOT 282
#define COM 283
#define LSH 284
#define RSH 285
#define SET 286
#define SETADD 287
#define SETSUB 288
#define SETMUL 289
#define SETDIV 290
#define SETMOD 291
#define SETOR 292
#define SETAND 293
#define SETXOR 294
#define SETLSH 295
#define SETRSH 296
#define RETURN 297
#define DO 298
#define WHILE 299
#define FOR 300
#define SWITCH 303
#define CASE 304
#define DEFAULT 305
#define IF 306
#define ELSE 307
#define CONTINUE 308
#define BREAK 309
#define GOTO 310
#define UNSIGNED 311
#define TYPEDEF 312
#define STRUCT 313
#define UNION 314
#define CONST 315
#define STATIC 316
#define EXTERN 317
#define AUTO 318
#define REGISTER 319
#define SIZEOF 320
#define PREPROC 321
#define BITXOR 301
#define BITOR 302
#define BITAND 303
%}

%option       noyywrap nounput yylineno

%x COMMENT

id [a-zA-Z][a-zA-Z0-9_]*
digit [0-9]
octaldigit[0-8]
hexdigit[0-9a-fA-F]
WS [ \t\v\n\f]
%%

"//".* {
  /*IGNORED*/
}

"/*" {
  /* START OF COMMENT */
  BEGIN COMMENT;
}

<COMMENT>{WS}+ {}

<COMMENT>"*/" {
  /* END OF COMMENT */
}

{WS}+ {}

"#".* {
  printf("PREPROC\n");
  return PREPROC;
}

"(" {
  printf("(\n");
  return '(';
}

")" {
  printf(")\n");
  return ')';
}

"{" {
  printf("{\n");
  return '{';
}

"}" {
  printf("}\n");
  return '}';
}

"[" {
  printf("[\n");
  return '[';
}

"]" {
  printf("]\n");
  return ']';
}

"," {
  printf(",\n");
  return ',';
}

";" {
  printf(";\n");
  return ';';
}

[1-9]{digit}* {
  printf("INTVAL\n");
  return INTVAL;
}

"0"{octaldigit}* {
  printf("INTVAL\n");
  return INTVAL;
}

"0x"{hexdigit}* {
  printf("INTVAL\n");
  return INTVAL;
}

{digit}+"."{digit}+"f" {
  printf("FLTVAL\n");
  return FLTVAL;
}

{digit}+"."{digit}+ {
  printf("DBLVAL\n");
  return DBLVAL;
}

"\"".*"\"" {
  printf("STRVAL\n");
  return STRVAL;
}

"\'".*"\'" {
  printf("CHARVAL\n");
  return CHARVAL;
}

"void" {
  printf("VOID\n");
  return VOID;
}

"char" {
  printf("CHAR\n");
  return CHAR;
}

"short" {
  printf("SHORT\n");
  return SHORT;
}

"int" {
  printf("INT\n");
  return INT;
}

"long" {
  printf("LONG\n");
  return LONG;
}

"float" {
  printf("FLOAT\n");
  return FLOAT;
}

"double" {
  printf("DOUBLE\n");
  return DOUBLE;
}

"==" {
  printf("EQ\n");
  return EQ;
}

"!=" {
  printf("NE\n");
  return NE;
}

">=" {
  printf("GE\n");
  return GE;
}

"<=" {
  printf("LE\n");
  return LE;
}

">" {
  printf("GT\n");
  return GT;
}

"<" {
  printf("LT\n");
  return LT;
}

"+" {
  printf("ADD\n");
  return ADD;
}

"-" {
  printf("SUB\n");
  return SUB;
}

"*" {
  printf("MUL\n");
  return MUL;
}

"/" {
  printf("DIV\n");
  return DIV;
}

"%" {
  printf("MOD\n");
  return MOD;
}

"||" {
  printf("OR\n");
  return OR;
}

"&&" {
  printf("AND\n");
  return AND;
}

"|" {
  printf("BITOR\n");
  return BITOR;
}

"&" {
  printf("BITAND\n");
  return BITAND;
}

"^" {
  printf("BITXOR\n");
  return BITXOR;
}

"!" {
  printf("NOT\n");
  return NOT;
}

"~" {
  printf("COM\n");
  return COM;
}

"<<" {
  printf("LSH\n");
  return LSH;
}

">>" {
  printf("RSH\n");
  return RSH;
}

"=" {
  printf("SET\n");
  return SET;
}

"+=" {
  printf("SETADD\n");
  return SETADD;
}

"-=" {
  printf("SETSUB\n");
  return SETSUB;
}

"*=" {
  printf("SETMUL\n");
  return SETMUL;
}

"/=" {
  printf("SETDIV\n");
  return SETDIV;
}

"%=" {
  printf("SETMOD\n");
  return SETMOD;
}

"|=" {
  printf("SETOR\n");
  return SETOR;
}

"&=" {
  printf("SETAND\n");
  return SETAND;
}

"^=" {
  printf("SETXOR\n");
  return SETXOR;
}

"<<=" {
  printf("SETLSH\n");
  return SETLSH;
}

">>=" {
  printf("SETRSH\n");
  return SETRSH;
}

"return" {
  printf("RETURN\n");
  return RETURN;
}

"do" {
  printf("DO\n");
  return DO;
}

"while" {
  printf("WHILE\n");
  return WHILE;
}

"for" {
  printf("FOR\n");
  return FOR;
}

"switch" {
  printf("SWITCH\n");
  return SWITCH;
}

"case" {
  printf("CASE\n");
  return CASE;
}

"default" {
  printf("DEFAULT\n");
  return DEFAULT;
}

"if" {
  printf("IF\n");
  return IF;
}

"else" {
  printf("ELSE\n");
  return ELSE;
}

"continue" {
  printf("CONTINUE\n");
  return CONTINUE;
}

"break" {
  printf("BREAK\n");
  return BREAK;
}

"goto" {
  printf("GOTO\n");
  return GOTO;
}

"unsigned" {
  printf("UNSIGNED\n");
  return UNSIGNED;
}

"typedef" {
  printf("TYPEDEF\n");
  return TYPEDEF;
}

"struct" {
  printf("STRUCT\n");
  return STRUCT;
}

"union" {
  printf("UNION\n");
  return UNION;
}

"const" {
  printf("CONST\n");
  return CONST;
}

"static" {
  printf("STATIC\n");
  return STATIC;
}

"extern" {
  printf("EXTERN\n");
  return EXTERN;
}

"auto" {
  printf("AUTO\n");
  return AUTO;
}

"register" {
  printf("REGISTER\n");
  return REGISTER;
}

"sizeof" {
  printf("SIZEOF\n");
  return SIZEOF;
}

{id} {
  printf("ID\n");
  return ID;
}

%%


int main( int argc, const char *argv[] ) {
    yylex();
    return 0;
}
