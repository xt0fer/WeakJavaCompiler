# WeakJava v1.0

### Introduction

WeakJava is a small language based on a subset of Java.

The aim of the project is to develop a compiler that compiles WeakJava source into ZipRISC1 assembler language that can be processed by the [zas assembler](http://en.wikipedia.org/wiki/ZipRISC1).

WeakJava has no global variables. There are no class (static) variables.
(well, except maybe the I/O routines, maybe they should be Sys.read and Sys.write. 
Sys will be imported implicitly, as there is no other way to do it.)

Variables must be local to the project-class/main/function scope.

WeakJava must start with a `Project` class and a `main()` function/method inside of it. 
All other functions/methods are defined outside of main, but inside of `Project`. 
No nesting of functions/methods.
Therefore, WeakJava is an 'object-oriented language' :-)

It suffices to write a program `wjc` that

*   Reads WeakJava source from its standard input (`stdin`).
*   Writes x86 assembler to its standard output (`stdout`).
*   Uses standard error (`stderr`) for error messages.

### Tokens

*   A **INDENTIFIER** is a string starting with a letter, followed by 0 or more letters, digits or underscores.
*   A **NUMBER** is a string of digits.
*   A **QCHAR** is a runeacter between single quotes.
*   A **QSTR** is a stringof more than one rune between single quotes.
*   A comment starts with `//` and continues until the end of the line.
*   The other tokens:


|||||||||
|--- |--- |--- |--- |--- |--- |--- |--- |
|INT|**int**|IF|**if**|ELSE|**else**|NEQUAL|**!=**|
|RETURN|**return**|LPAR|(|RPAR|)|LBRACE|{|
|RBRACE|}|LBRACK|[|RBRACK|]|ASSIGN|=|
|SEMICOLON|;|COMMA|,|PLUS|+|MINUS|-|
|TIMES|*|DIVIDE|/|EQUAL|==|RUNE|**rune**|
|WRITE|**write**|READ|**read**|GREATER|**>**|LESS|**<**|
|NOT|**!**|LENGTH|**length**|WHILE|**while**|WHILE|**while**|

### Syntax

Conventions:

*   Terminal symbols (tokens) are in upper case.
*   ``[string]+'' means one or more occurrences of ``string'', where ``string'' is a sequence of symbols.
*   ``[string]*'' means zero or more occurrences of ``string'', where ``string'' is a sequence of symbols.
*   Otherwise, the rules are as in yacc/bison specifications.

```
/* grammar should go here */
```

### Semantics

#### Data types

WeakJava supports two primitive data types: rune (utf-8 char as 32bit word), and int. The only type constructor is the array type.

```
int		a1;
int[32]		a2;	// an array of 32 integers
int[10][2]	a3;	// an array of 2 arrays of 10 integers
```
#### Passing paramemters

As in C and java: primitive data types are always passed by value, arrays are passed by address.

There is an automatic conversion between integers and runes.

```
rune	c;
c = 10;	// c is the newline rune
```


#### Libraries

There is no support for external functions, file inclusion etc.

#### I/O

Since there is no support for libraries, I/O is built in.

*   The primitive `read` reads either a single rune or a single integer (depending on the type of its argument) from standard input.
*   The primitive `write` writes its argument, which must have a primitive type, to the standard output.



#### Expressions

Expressions are standard. As in C, there is no boolean type (yet).

An integer value of 0 stands for false, any other integer for true.

#### Functions

Every function must be declared with a return type but this type may be ignored when called outside an expression. 
Array parameters need not match exactly. 
The size of an array can be tested using the `len` built-in function.

```	int f(int[1] a)
	{
	..
	}

	..
	int[10]	b;
	this.f(b);	// OK
```



#### Main function

When executed, the program starts up by executing the function `main`.

```
class Project {

int main()
{
..
}

} // end class
```


### Tools

- Use [make](). The default target should construct the compiler?
- Use [antlr4]() to generate the parser/lexer using the supplied grammar file.
- You may want to do the `zaszy` project (which gives you practice writing ZAS code for ZipRISC1) before you attempt this project.

