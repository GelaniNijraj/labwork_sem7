%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
%}
%token FNUM
%union{
	float fval;
}
%token <fval> FNUM
%type <fval> E
%type <fval> T
%type <fval> F
%left '+'
%left '*'
%%
program:
	  program E '\n'		{ printf("%.2f\n", $2); }
	|
	;

E:
	  E '+' T			{ $$ = $1 + $3; } 
	| T				{ $$ = $1; }
	;

T:
	  T '*' F			{ $$ = $1 * $3; }
	| F
	;

F:
	  FNUM				{ $$ = $1; }
	| '(' E ')'			{ $$ = $2; }
	;

%%

void yyerror(char* s){
	printf("ERR %s\n", s);
}

int main(void){
	yyparse();
	return 0;
}
