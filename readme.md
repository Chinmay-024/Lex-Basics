# Lexical Analysis (LEX/Flex)

## Introduction

Lexical analysis is the process of analyzing the input source code to identify and categorize different tokens (or lexemes) that make up the programming language. Lex/Flex is a popular tool used to generate lexical analyzers.

## Writing and Compiling Lex/Flex Programs

1. Use any text editor (e.g., nano, vim, VS Code) to write Lex/Flex programs.

2. Save the program with a `.l` extension (e.g., `program.l`).

3. Compile the Lex/Flex program using the `lex` command:

4. Compile the generated C code (lex.yy.c) using a C compiler (e.g., gcc):

5. Execute the compiled program:

## Section 1

### Question 1

Q1 provides Lex/Flex program that recognizes binary strings containing at least four consecutive '1' digits.

#### Explanation

The provided Lex/Flex program is designed to recognize binary strings that contain at least four consecutive '1' digits. The program is structured as follows:

1. The `%{ ... %}` section includes necessary header files (`stdio.h` and `string.h`).

2. The `%%` section contains the regular expression patterns and associated actions for recognizing binary strings. The program recognizes patterns where there are at least four consecutive '1' digits surrounded by any number of '0' or '1' digits.

3. The regular expression `(0|1)*1111(0|1)*` matches strings that contain at least four consecutive '1' digits.

4. If the input matches the specified pattern, the program prints "ACCEPTED". If not, it prints "REJECTED".

5. The `.*` regular expression matches any other characters or sequences not explicitly defined.

6. The `int yywrap(void){}` function definition is required by Flex, even though it is empty.

7. The `main()` function initializes the lexical analysis process by calling `yylex()` and returns 0 when finished.

### Note

1. The program matches the input string against the defined pattern: (0|1)_1111(0|1)_. It considers any sequence of 0s and 1s before and after the four consecutive 1s.

2. The program uses Lex to generate a lexer, which tokenizes the input string based on the defined rules.

3. If the input matches the pattern, "ACCEPTED" is printed; otherwise, "REJECTED" is printed.

4. The yywrap function is defined but does not perform any action since the lexer is used to process a single input string.

### Example

```javascript
Input: 100011110;
Output: ACCEPTED;

Input: 1111;
Output: ACCEPTED;

Input: 10001110;
Output: REJECTED;
```

### Question 2

#### Introduction

This Lex program analyzes binary strings to determine whether they are balanced according to certain criteria. A balanced binary string has either an even count of zeros and an odd count of ones, or it has an odd count of zeros and an even count of ones.

#### Code Explanation

The provided Lex program is designed to analyze binary strings and determine if they are balanced. Here's how it works:

1. The `%{ ... %}` section allows you to declare and initialize variables (`zero_count` and `one_count`) that will keep track of the counts of zeros and ones.

2. The `%%` section contains the rules and actions for recognizing and analyzing the binary strings.

3. The rule `[01]` matches individual '0' and '1' characters. Depending on the matched character, the program updates the `zero_count` or `one_count` accordingly.

4. The rule `\n` matches newline characters. After analyzing the input binary string, this rule checks if the counts satisfy the balancing criteria. If so, it prints "ACCEPTED"; otherwise, it prints "REJECTED". Then, it resets the counts.

5. The rule `.` matches any other characters. If any invalid character is encountered, the program prints "Invalid" and exits.

6. The `int yywrap(void){}` function definition is required by Lex, even though it is empty.

7. The `main()` function initializes the lexical analysis process by calling `yylex()` and returns 0 when finished.

#### Note

1. A balanced binary string either has an even count of zeros and an odd count of ones, or an odd count of zeros and an even count of ones.

2. The program matches each character in the input string and updates the zero and one counts accordingly.

3. After analyzing the entire input string, it checks if the counts satisfy the balancing criteria and outputs the result accordingly.

#### Example

```javascript
Input: 001101;
Output: ACCEPTED;

Input: 1100;
Output: ACCEPTED;

Input: 01010101;
Output: REJECTED;

Input: 011000110;
Output: REJECTED;

Input: 001234;
Output: Invalid;
```

### Question 3

#### Introduction

This Lex program performs lexical analysis on strings to determine if they meet certain validation criteria. The program checks if a string has a total length of 8 characters and contains at least two consecutive 'a's or 'b's.

#### Code Explanation

The provided Lex program analyzes strings and validates them based on the specified criteria. Here's how it works:

1. The `%{ ... %}` section allows you to declare and initialize variables (`length`, `a_c`, and `b_c`) that will keep track of the string length and character counts.

2. The `%%` section contains the rules and actions for recognizing and validating the strings.

3. The rules `aa` and `bb` match consecutive pairs of 'a' and 'b' characters. When these rules are matched, the program updates the string length and the respective character count.

4. The rule `[abc]` matches individual 'a', 'b', or 'c' characters and increments the string length.

5. The rule `\n` matches newline characters. After analyzing the input string, this rule checks if the string length is 8 and if there are at least two consecutive 'a's or 'b's. If so, it prints "ACCEPTED"; otherwise, it prints "REJECTED". Then, it resets the variables.

6. The rule `.` matches any other characters. If an invalid character is encountered, the program prints "Invalid" and exits.

7. The `int yywrap(void){}` function definition is required by Lex, even though it is empty.

8. The `main()` function initializes the lexical analysis process by calling `yylex()` and returns 0 when finished.

#### Note

1. The program validates strings by checking their total length and the presence of consecutive 'a's or 'b's.

2. Consecutive pairs of 'a' or 'b' characters increase the string length by 2.

3. The program outputs "ACCEPTED" if the string has a total length of 8 and contains at least two consecutive 'a's or 'b's; otherwise, it outputs "REJECTED".

4. The program handles invalid characters and prints "Invalid" if such characters are encountered.

### Examples

```javascript
Input: aabbabcb;
Output: ACCEPTED;

Input: aaacbbab;
Output: ACCEPTED;

Input: abababaaabbbb;
Output: REJECTED;

Input: aabbcddd;
Output: Invalid;
```

## Section 2

#### Introduction

This Lex program serves as a simple lexical analyzer for a basic programming language. It tokenizes input source code, identifying keywords, operators, identifiers, numbers, and other elements.

#### How to Run

```bash
   lex 2.l
   gcc lex.yy.c
   ./lexer input.txt
```

#### Code Explanation

The provided Lex program tokenizes input source code into various categories. Here's how it works:

1. The `%{ ... %}` section includes the necessary header file `stdio.h`.

2. The `%%` section contains the rules and actions for recognizing and tokenizing the input elements.

3. The program recognizes keywords like "if," "then," and "else" and prints their respective tokens.

4. Operators such as "=" and relational operators ("<", ">", "<=", ">=", "==", "<>") are recognized and categorized as tokens.

5. The rule `{NUMBER}` matches numbers, including integers and floating-point numbers in scientific notation. The program prints their respective tokens.

6. The rule `{ID}` identifies identifiers, which begin with a letter and can include letters and digits. The program prints their respective tokens.

7. Single-line comments (starting with "//") are ignored.

8. Whitespace characters (spaces and tabs) are ignored.

9. Unrecognized characters are categorized as "UNRECOGNIZED."

10. Newlines are ignored.

11. The `int yywrap(void){}` function definition is required by Lex, even though it is empty.

12. The `main()` function takes an input file as a command-line argument and processes it. It opens the file, sets `yyin` to the input file, calls `yylex()` to tokenize the input, and then closes the file.

#### Examples

Input :

```javascript
if input<10 then output1=100 else output2>=100
```

Output :

```javascript
IF
IDENTIFIER input
RELOP, <
NUMBER 10
THEN
IDENTIFIER output1
RELOP, =
NUMBER 100
ELSE
IDENTIFIER output2
RELOP, >=
NUMBER 100
```

## Section 3

#### Introduction

This Lex program serves as a simple lexical analyzer for a basic programming language. It tokenizes input source code, identifying data types, keywords, operators, identifiers, numbers, and other elements.

#### How to Run

```bash
   lex 3.l
   gcc lex.yy.c
   ./lexer input.txt
```

#### Code Explanation

The provided Lex program tokenizes input source code into various categories. Here's how it works:

1. The `%{ ... %}` section includes the necessary header file `stdio.h`.

2. The `%%` section contains the rules and actions for recognizing and tokenizing the input elements.

3. The program recognizes data types such as "int," "float," and "char" and prints their respective tokens.

4. Keywords like "if," "for," "while," "input," "display," and "main" are recognized and categorized as tokens.

5. Various operators (e.g., `+`, `-`, `*`, `/`, `<`, `>`, `<=`, `>=`, `==`, `!=`, `++`, `--`, `=`) are recognized and tokenized accordingly.

6. The rule `{NUMBER}` matches numbers, including integers, floating-point numbers, and scientific notation. The program prints their respective tokens.

7. The rule `{ID}` identifies identifiers, which consist of letters and digits and start with a letter. The program prints their respective tokens.

8. String literals enclosed in double quotes are recognized and tokenized as "STRING_LITERAL."

9. Single-line comments (starting with "//") are ignored.

10. Whitespace characters (spaces and tabs) are ignored.

11. Unrecognized characters are categorized as "UNRECOGNIZED."

12. Newlines are ignored.

13. The `int yywrap(void){}` function definition is required by Lex, even though it is empty.

14. The `main()` function takes an input file as a command-line argument and processes it. It opens the file, sets `yyin` to the input file, calls `yylex()` to tokenize the input, and then closes the file.

#### Note

1. The program tokenizes input source code, recognizing data types, keywords, operators, identifiers, numbers, and string literals, among other elements.

2. It ignores single-line comments and whitespace.

3. If an unrecognized character is encountered, the program categorizes it as "UNRECOGNIZED."

4. The provided example demonstrates how the program tokenizes a simple code snippet.

#### Example

Input :

```javascript
int main() {
    int num = 42;
    if (num > 0) {
        display("Positive");
    } else {
        display("Non-positive");
    }
    return 0;
}
```

Output :

```javascript
DATA_TYPE_INT
MAIN
LPAREN
RPAREN
LBRACE
DATA_TYPE_INT
IDENTIFIER num
ASSIGN
NUMBER 42
SEMICOLON
IF
LPAREN
IDENTIFIER num
GREATERTHAN
NUMBER 0
RPAREN
LBRACE
DISPLAY
LPAREN
STRING_LITERAL
RPAREN
SEMICOLON
RBRACE
ELSE
LBRACE
DISPLAY
LPAREN
STRING_LITERAL
RPAREN
SEMICOLON
RBRACE
RETURN
NUMBER 0
SEMICOLON
RBRACE
```
