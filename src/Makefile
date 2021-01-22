all: compile test

antlr4=../antlr-4.9-complete.jar
srcs=./main/java
gendsrc=./main/java
antlr4command=java -cp $(antlr4) org.antlr.v4.Tool
TARGET=../target


generate: $(srcs)/WeakJava.g4
	$(antlr4command) -o $(TARGET) $(srcs)/WeakJava.g4

compile: generate
	javac -cp .:$(antlr4) -d $(TARGET) $(TARGET)/main/java/WeakJava*.java $(srcs)/zas/*.java

test: compile
	java  -cp .:$(antlr4):$(TARGET) org.antlr.v4.runtime.misc.TestRig WeakJava compilationunit grzero.wj
