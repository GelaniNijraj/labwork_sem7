%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
%}
%token FNUM
%token VAR
%union{
	float fval;
	char cval;
}
%token <fval> FNUM
%token <cval> VAR
%type <fval> E
%type <fval> T
%type <fval> F
%left '+'
%left '*'
%%
program:
	  program E '\n'		{ printf("%.2f\n", $2); }
	| program A '\n'		{ printf("%.2f\n", $2); }
	|
	;

A:

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
	| VAR				{ $$ = val($1); }
	| '(' E ')'			{ $$ = $2; }
	;

%%

void yyerror(char* s){
	printf("ERR %s\n", s);
}

float val(char k){
	printf("<%c>", k);
	return 100;
}

int main(void){
	yyparse();
	return 0;
}
