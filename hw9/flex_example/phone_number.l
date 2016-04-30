/*
 * The following code matches a phone number: xxx-xxx-xxxx
 */
%{
#include <stdio.h>
#include <string.h>

int char_read = 1;

%}

DIGIT  [0-9]
%%

{DIGIT}{3,3}-{DIGIT}{3,3}-{DIGIT}{4,4}   { 
                 				printf("Found %s at character %d\n", yytext, char_read);
                 				printf("\n");
                 				char_read += 12;
               				 }
.              				 { ++char_read; }

%%

int main() {
   yylex();
   return 0;
}
