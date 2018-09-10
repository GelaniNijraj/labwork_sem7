%{
	#include <stdlib.h>
	void yyerror(char*);
	#include "y.tab.h"
%}
FLOAT	[0-9]+[\.]{0,1}[0-9]*	
%%
FLOAT				{
					yylval.fval = atoi(yytext);
					return FNUM;
				}
[a-z]'='FLOAT			{
					assign(yytex, yylen);
					return ASSIGNMENT;
				}
[\*\+\(\)\n]			return *yytext;
[ \t]				;
.				yyerror("Invalid input");
%%

void assign(char* expr){
	printf("<%s>\n", expr);
}

int yywrap(void){
	return 1;
}


