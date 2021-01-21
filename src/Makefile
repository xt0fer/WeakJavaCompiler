all: compile test

antlr4=/Volumes/DeVere/kristofer/Documents/Projects/Groundz/src/test/java/antlr-4.9-complete.jar
srcs=./main/java
gendsrc=./main/java
antlr4command=java -cp $(antlr4) org.antlr.v4.Tool
TARGET=./target


generate: $(srcs)/Groundz.g4
	#java -jar $(antlr4) $(srcs)/Groundz.g4 -o $(gendsrc)
	$(antlr4command) -o $(gendsrc) $(srcs)/Groundz.g4

compile: generate
	javac -cp .:$(antlr4) -d $(TARGET) $(gendsrc)/Groundz*.java $(srcs)/zas/*.java

test: compile
	java  -cp .:$(antlr4):$(gendsrc):$(gendsrc)/zas org.antlr.v4.runtime.misc.TestRig Groundz program grzero.wj
