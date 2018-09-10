build:
	yacc -d parser.y
	lex lexer.l
	cc y.tab.c lex.yy.c -o out

clean:
	rm lex.yy.c out y.tab.c y.tab.h
