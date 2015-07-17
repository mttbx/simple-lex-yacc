%{
#include <stdio.h>
typedef void* yyscan_t;
int yylex();
%}
%token digit NUMBER SEMICOLON
%start list
%left '+' '-' '*' '/'

%%
list: |
list expr SEMICOLON '\n' {printf("%d\n",$2);}
;
expr:
expr '*' expr { $$ = $1 * $3; }
|
expr '/' expr { $$ = $1 / $3; }
|
expr '+' expr { $$ = $1 + $3; }
|
expr '-' expr { $$ = $1 - $3; }
|
NUMBER
;
%%
int yyerror()
{
return 1;
}
int main()
{
yyparse();
return 0;
}
