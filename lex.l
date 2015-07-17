%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
%}
%option noyywrap
NUMBER [0-9]+
%%
; {return(SEMICOLON);} ;
{NUMBER} {
	yylval = atoi(yytext);
	return(NUMBER);
}
[^0-9\b] {
return(yytext[0]);
}
