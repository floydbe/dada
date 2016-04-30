filter:
	gcc -m32 -o filter filter.c
	flex virus_patterns.l 
	gcc -o scanner lex.yy.c -lfl
clean:
	rm filter 
	rm lex.yy.c
	rm scanner
	
