%{
	#include <stdlib.h>
	void yyerror(char*);
	#include "y.tab.h"
%}
%%
[0-9]+[\.]{0,1}[0-9]*		{
					yylval.fval = atoi(yytext);
					return FNUM;
				}
[\*\+\(\)\n]			return *yytext;
[ \t]				;
.				yyerror("Invalid input");
%%
int yywrap(void){
	return 1;
}


