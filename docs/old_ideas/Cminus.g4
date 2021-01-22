/* Cminus */
grammar Cminus;

program
    : mainFunction functionList?
    ;
    
functionList
    : functionDefinition
    | functionList functionDefinition
    ;
    
mainFunction
    : Main Paren paramList? Thesis typeSpecifier? compoundStatement
    ;

functionDefinition
    :  Func Identifier Paren paramList Thesis typeSpecifier compoundStatement
    ;

statementList
    : statement
    | statementList statement
    ;

declarationList
    :   declaration
    |   declarationList declaration
    ;

statement
    :   compoundStatement
    |   expressionStatement
    |   selectionStatement
    |   iterationStatement
    |   jumpStatement
    |   assignmentStatement
    ;

assignmentStatement
    : Identifier Assign expressionStatement
    ;

compoundStatement
    :   '{' blockItemList? '}'
    ;

blockItemList
    :   blockItem
    |   blockItemList blockItem
    ;

blockItem
    :   statementList
    |   declarationList
    ;

declaration
    : Var Identifier Assign typeSpecifier Paren Constant Thesis Semi
    ;

expressionStatement
    :   expression Semi
    ;

selectionStatement
    :   If Paren expression Thesis compoundStatement (Else compoundStatement)?
    ;

iterationStatement
    :   While Paren expression Thesis compoundStatement
    ;

jumpStatement
    :   'continue' Semi
    |   'break' Semi
    |   'return' expression? Semi
    ;

// primaryExpression
//     :   Identifier
//     |   Constant
//     |   StringLiteral+
//     ;

expression 
    : Minus expression     
    | expression mulop expression 
    | expression addop expression 
    | Paren expression Thesis
    | Constant      
    ;

addop : Plus | Minus ;

mulop : Star | Div | Mod ;

conditionalExpression
    :   logicalOrExpression ('?' expression ':' conditionalExpression)?
    ;

// assignmentExpression
// //    :   conditionalExpression
//     :  Identifier assignmentOperator assignmentExpression
//     ;

assignmentOperator
    :   '=' // | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
    ;

constantExpression
    :   conditionalExpression
    ;

// multiplicativeExpression
//     :   multiplicativeExpression
//     |   multiplicativeExpression '*' multiplicativeExpression
//     |   multiplicativeExpression '/' multiplicativeExpression
//     |   multiplicativeExpression '%' multiplicativeExpression
//     ;

// additiveExpression
//     :   multiplicativeExpression
//     |   additiveExpression '+' multiplicativeExpression
//     |   additiveExpression '-' multiplicativeExpression
//     ;

shiftExpression
    :   expression
    |   shiftExpression '<<' expression
    |   shiftExpression '>>' expression
    ;

relationalExpression
    :   shiftExpression
    |   relationalExpression '<' shiftExpression
    |   relationalExpression '>' shiftExpression
    |   relationalExpression '<=' shiftExpression
    |   relationalExpression '>=' shiftExpression
    ;

equalityExpression
    :   relationalExpression
    |   equalityExpression '==' relationalExpression
    |   equalityExpression '!=' relationalExpression
    ;

andExpression
    :   equalityExpression
    |   andExpression '&' equalityExpression
    ;

exclusiveOrExpression
    :   andExpression
    |   exclusiveOrExpression '^' andExpression
    ;

inclusiveOrExpression
    :   exclusiveOrExpression
    |   inclusiveOrExpression '|' exclusiveOrExpression
    ;

logicalAndExpression
    :   inclusiveOrExpression
    |   logicalAndExpression '&&' inclusiveOrExpression
    ;

logicalOrExpression
    :   logicalAndExpression
    |   logicalOrExpression '||' logicalAndExpression
    ;

typeSpecifier
    :   Void
    |   Rune
    |   Int
    |   StringType
    |   Bool
    ;


paramList
    : param
    | paramList param
    ;
param
    : Comma? typeSpecifier Identifier 
    ;

Break : 'break';
Continue : 'continue';
Else : 'else';
If : 'if';
Var : 'var';
Int : 'int';
Bool : 'boolean';
StringType : 'string';
Rune : 'rune';
Array : 'array';
Return : 'return';
Void : 'void';
While : 'while';
Func : 'function';
Main : 'main';
True : 'true';
False : 'false';

Paren : '(';
Thesis : ')';
LeftBracket : '[';
RightBracket : ']';
LeftBrace : '{';
RightBrace : '}';

Less : '<';
LessEqual : '<=';
Greater : '>';
GreaterEqual : '>=';
LeftShift : '<<';
RightShift : '>>';

Plus : '+';
PlusPlus : '++';
Minus : '-';
MinusMinus : '--';
Star : '*';
Div : '/';
Mod : '%';

And : '&';
Or : '|';
AndAnd : '&&';
OrOr : '||';
Caret : '^';
Not : '!';
Tilde : '~';

Question : '?';
Colon : ':';
Semi : ';';
Comma : ',';

Assign : '=';

Identifier
    :   IdentifierNondigit ( IdentifierNondigit | Digit )*
    ;
    
fragment
IdentifierNondigit
    :   Nondigit
    |   UniversalCharacterName
    //|   // other implementation-defined characters...
    ;

fragment
Nondigit
    :   [a-zA-Z_]
    ;

fragment
Digit
    :   [0-9]
    ;

fragment
UniversalCharacterName
    :   '\\u' HexQuad
    |   '\\U' HexQuad HexQuad
    ;

fragment
HexQuad
    :   HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
    ;

Constant
    :   IntegerConstant
    |   CharacterConstant
    ;

fragment
IntegerConstant
    :   DecimalConstant 
    |   OctalConstant 
    |   HexadecimalConstant 
    |	BinaryConstant
    |   BooleanConstant
    ;

fragment
BinaryConstant
	:	'0' [bB] [0-1]+
	;

fragment
BooleanConstant
    : True
    | False
    ;

fragment
DecimalConstant
    :   NonzeroDigit Digit*
    ;

fragment
OctalConstant
    :   '0' OctalDigit*
    ;

fragment
HexadecimalConstant
    :   HexadecimalPrefix HexadecimalDigit+
    ;

fragment
HexadecimalPrefix
    :   '0' [xX]
    ;

fragment
NonzeroDigit
    :   [1-9]
    ;

fragment
OctalDigit
    :   [0-7]
    ;

fragment
HexadecimalDigit
    :   [0-9a-fA-F]
    ;

fragment
Sign
    :   '+' | '-'
    ;

DigitSequence
    :   Digit+
    ;

fragment
HexadecimalDigitSequence
    :   HexadecimalDigit+
    ;

fragment
CharacterConstant
    :   '\'' CCharSequence '\''
    |   'L\'' CCharSequence '\''
    |   'u\'' CCharSequence '\''
    |   'U\'' CCharSequence '\''
    ;

fragment
CCharSequence
    :   CChar+
    ;

fragment
CChar
    :   ~['\\\r\n]
    |   EscapeSequence
    ;

fragment
EscapeSequence
    :   SimpleEscapeSequence
    |   OctalEscapeSequence
    |   HexadecimalEscapeSequence
    |   UniversalCharacterName
    ;

fragment
SimpleEscapeSequence
    :   '\\' ['"?abfnrtv\\]
    ;

fragment
OctalEscapeSequence
    :   '\\' OctalDigit
    |   '\\' OctalDigit OctalDigit
    |   '\\' OctalDigit OctalDigit OctalDigit
    ;
fragment
HexadecimalEscapeSequence
    :   '\\x' HexadecimalDigit+
    ;
StringLiteral
    : '"' SCharSequence? '"'
    ;

fragment
SCharSequence
    :   SChar+
    ;
fragment
SChar
    :   ~["\\\r\n]
    |   EscapeSequence
    |   '\\\n'   // Added line
    |   '\\\r\n' // Added line
    ;

Whitespace
    :   [ \t]+
        -> skip
    ;

Newline
    :   (   '\r' '\n'?
        |   '\n'
        )
        -> skip
    ;

BlockComment
    :   '/*' .*? '*/'
        -> skip
    ;

LineComment
    :   '//' ~[\r\n]*
        -> skip
    ;