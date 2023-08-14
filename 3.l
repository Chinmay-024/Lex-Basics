%{
#include <stdio.h>
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT})*
NUMBER      ([0-9]+)(\.[0-9]+)?(E[+-]?)?([0-9]+)

%%
"INT"|"int"         { printf("DATA_TYPE_INT\n"); }
"FLOAT"|"float"     { printf("DATA_TYPE_FLOAT\n"); }
"CHAR"|"char"       { printf("DATA_TYPE_CHAR\n"); }
"if"                { printf("IF\n"); }
"for"               { printf("FOR\n"); }
"while"             { printf("WHILE\n"); }
"input"             { printf("INPUT\n"); }
"display"           { printf("DISPLAY\n"); }
"main"              { printf("MAIN\n"); }
"("                 { printf("LPAREN\n"); }
")"                 { printf("RPAREN\n"); }
"{"                 { printf("LBRACE\n"); }
"}"                 { printf("RBRACE\n"); }
";"                 { printf("SEMICOLON\n"); }
"="                 { printf("ASSIGN\n"); }
"++"                { printf("BINARY_PLUS\n"); }
"--"                { printf("BINARY_MINUS\n"); }
"+"                 { printf("PLUS\n"); }
"-"                 { printf("MINUS\n"); }
"*"                 { printf("MULTIPLY\n"); }
"/"                 { printf("DIVIDE\n"); }
"<"                 { printf("LESSTHAN\n"); }
">"                 { printf("GREATERTHAN\n"); }
"<="                { printf("LESSTHANEQUAL\n"); }
">="                { printf("GREATERTHANEQUAL\n"); }
"=="                { printf("EQUALTO\n"); }
"!="                { printf("NOTEQUALTO\n"); }
{NUMBER}            { printf("NUMBER %s\n", yytext); }
{ID}                { printf("IDENTIFIER %s\n", yytext); }
"\""([^"])*"\""     { printf("STRING_LITERAL\n"); }
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
