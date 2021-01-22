// A simple syntax-directed translator for a simple language

grammar Groundz;

// Root non-terminal symbol
// A program is a bunch of declarations followed by a bunch of statements
// The Java code outputs the necessary NASM code around these declarations

@parser::header {
    import zas.CodeList;
    import zas.Directive;
    import zas.Instruction;
    import zas.Label;

}

@parser::members{
    CodeList program = new zas.CodeList();
}

compilationunit :
        mainfunction
        {
        program.emitAll();
        }
       ;

mainfunction : MAIN LEFTBRACE
              {
            program.add(new Directive(".OR", "0x0000"));
            program.add(new Instruction("BRA", "_stackbase"));
            // preamble
            program.add(new Label("vars", "// data section"));
            }
            declaration*
            // add postamble, pop result of return, and Halt
            statement*
            {
            program.add(new Label("_quit", ""));
            program.add(new Instruction("POP", "xFP"));
            program.add(new Instruction("OUT", "xFP"));
            program.add(new Instruction("HLT", ""));
            program.add(new Directive(".OR", "0x7000"));
            program.add(new Label("_stackbase", "// base of stack"));
            program.add(new Instruction("LDI", "x5", "_stackbase"));
            program.add(new Instruction("MOV", "xFP", "x5"));
            program.add(new Instruction("MOV", "xSP", "x5"));
            program.add(new Instruction("CALL", "_main"));
            program.add(new Instruction("BRA", "_quit"));
            }
            RIGHTBRACE
            ;

// Parse rule for variable declarations

declaration   :
              {int a; }
              INT a=IDENT SEMICOLON
              {
              program.add(new Label($a.text, "// variable"));
              program.add(new Directive(".WD", "0"));
              }
              ;

// Parse rule for statements

statement      :
               ifstmt
             | printstmt
             | assignstmt
               ;

// Parse rule for if statements

ifstmt      :
            {int a,b;}
            {String label;}
            IF PAREN a=identifier EQUAL b=integer THESIS LEFTBRACE
            {
            program.add(new Instruction("Compare", $a.toString, $b.toString));
             label = "label_"+Integer.toString($IF.index);
            program.add(new Instruction("Jump if Not Zero", label));
            }
            statement*
            { program.add(new Label(label, "")); }
            RIGHTBRACE
            ;

// Parse rule for print statements

printstmt      :
               PRINT term SEMICOLON
               {
               // need to push term into call arg0
               program.add(new Instruction("Load term into arg0", ""));
               program.add(new Instruction("CALL", "print"));
               }
               ;

// Parse rule for assignment statements

assignstmt      :
                {int a; }
                a=IDENT ASSIGN expression SEMICOLON
                {
                // move x8 to memory a.text
               program.add(new Instruction("load x8 with memory at", $a.text));
                }
                ;

// Parse rule for expressions

expression      :
                {int a,b; }
                a=term
                { // mov a to x8
               program.add(new Instruction("load x8 with memory at", $a.toString));
                }
              |
                a=term PLUS b=term
                { // mov a to x8
               program.add(new Instruction("load x8 with memory at", $a.toString));
                }
                { // add b to x8, lv in x8
               program.add(new Instruction("add x8 with memory at", $b.toString));
                }
                ;

// Parse rule for terms

term returns [String toString]  :
    identifier {$toString = $identifier.toString;}
    | integer {$toString = $integer.toString;}
    ;

// Parse rule for identifiers

identifier returns [String toString]: IDENT {$toString = $IDENT.text;} ;

// Parse rule for numbers

integer returns [String toString]: INTEGER {$toString = "("+$INTEGER.text+")";} ;

// Reserved Keywords
////////////////////////////////

IF: 'if';
MAIN: 'main';
PRINT: 'print';
INT: 'int';

// Operators
PLUS: '+';
EQUAL: '==';
ASSIGN: '=';
NOTEQUAL: '!=';

// Semicolon and parentheses
SEMICOLON: ';';
PAREN: '(';
THESIS: ')';
LEFTBRACE: '{';
RIGHTBRACE: '}';

// Integers
INTEGER: [0-9][0-9]*;

// Variable names
IDENT: [a-zA-Z0-9_]+;

// Ignore all white spaces
WS: [ \t\r\n]+ -> skip ;