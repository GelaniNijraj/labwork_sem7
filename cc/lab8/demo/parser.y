%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
	
%}
%union {float f;}
%left '+'
%left '*'
%token <f> FNUM
%type <f> E
%type <f> T
%type <f> F
%type <f> program

%%
program:	program E '\n'		{ printf("%f\n", $2); }
		|
		;
		
E:		E'+'T			{ $$ = $1+$3;}
		| 
		T				{ $$ = $1; }
		;
T:		T'*'F			{ $$ = $1 * $3; }
		| 
		F				{ $$ = $1; }
		;
F:		FNUM				{ $$ = $1;}
		|
	    '('E')'		     { $$ = $2;}
		;
%%

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}
int main(void) {
	yyparse();
	return 0;
}        
