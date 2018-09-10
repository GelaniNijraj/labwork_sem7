%{
	#include <stdlib.h>
	#include <stdio.h>
	void yyerror(char *);
	#include "y.tab.h"
%}
d [0-9]+
p '.'
%%
(([0-9]+(\.[0-9]*)?)|([0-9]*\.[0-9]+))		{	yylval.f= atof(yytext);
										return FNUM;
									}
[*+()\n]			return *yytext;
[ \t]			; /* skip whitespace */
.				yyerror("invalid character");
%%
int yywrap(void) {
	return 1;
}
