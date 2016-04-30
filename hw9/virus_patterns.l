/*
 * The following code matches the Wahoo Virus
 */
%{
#include <stdio.h>

int char_read = 2;

%}
HEX [a-f0-9]
MOV bc
XOR_ESI_ESI 3136
XOR_ESP_ESI 3126

%%

{MOV}{HEX}{8,8}{XOR_ESI_ESI}{XOR_ESP_ESI}	{ 
	if (1)
	{
		char num[8];
		char swapped[8];
		strncpy(num, yytext+2, 8);
		swapped[0] = num[6];
		swapped[1] = num[7];
		swapped[2] = num[4];
		swapped[3] = num[5];
		swapped[4] = num[2];
		swapped[5] = num[3];
		swapped[6] = num[0];
		swapped[7] = num[1];
		int number = (int)strtol(swapped, NULL, 16);
		if (number >= 1400 && number <= 1876) {
			printf("WARNING! Wahoo virus: byte number: %d\n", char_read/2);
			printf("%s\n\n", yytext); 
			char_read += 18;
		}
		else {
			char_read += 18;
		}
	}
	}

.              	{ ++char_read; }

%%

int main() {
   yylex();
   return 0;
}
