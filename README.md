# WeakJava

wjc - a mini Java compiler for ziprisc1

wjc the WeakJava compiler.

Compiles WeakJava code into zas assembly code.

the output (stdout) should be put into a `.zas` file.

```
$ wjc < hello.wj > hello.zas
$ zas hello.zas > hello.zex
$ zrisc hello.zex
hello
```

## ToDos

- Need some examples of code template patterns
- How the visitor pattern is used in the code generation

![WeakJava Compiler](docs/WeakJavaCompilerOverview.png)

This project uses Antlr4. ANTLR (ANother Tool for Language Recognition) is a powerful parser 
generator for reading, processing, executing, or translating structured text or binary files.
It takes a `.g4` grammar file and produces a whole bunch of Java code which implements a laxer/parser program. 
That in turn, produces a parse tree, which as it is "walked", can be used to produce "object code".
See the eventual Notes.md about how this all works.

The diagrams are sourced with http://shapesapp.com
