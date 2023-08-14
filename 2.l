%{
#include <stdio.h>
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT})*
NUMBER      ([0-9]+)(\.[0-9]+)?(E[+-])?([0-9]+)

%%
"if"                { printf("IF\n"); }
"then"              { printf("THEN\n"); }
"else"              { printf("ELSE\n"); }
"="                 { printf("RELOP, =\n"); }
"<"                 { printf("RELOP, <\n"); }
">"                 { printf("RELOP, >\n"); }
"<="                { printf("RELOP, <=\n"); }
">="                { printf("RELOP, >=\n"); }
"=="                { printf("RELOP, ==\n"); }
"<>"                { printf("RELOP, <>\n"); }
{NUMBER}            { printf("NUMBER %s\n", yytext); }
{ID}                { printf("IDENTIFIER %s\n", yytext); }
"//"(.*)            // Ignore single-line comments
" "|\t             // Ignore whitespace characters
.                   { printf("UNRECOGNIZED %s\n", yytext); }
\n                  ; // Ignore newlines
%%

int yywrap(void){}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file;
    yylex();

    fclose(input_file);
    return 0;
}
