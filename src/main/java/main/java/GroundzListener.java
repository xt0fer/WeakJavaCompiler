// Generated from ./main/java/Groundz.g4 by ANTLR 4.9
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link GroundzParser}.
 */
public interface GroundzListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link GroundzParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(GroundzParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(GroundzParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#declaration}.
	 * @param ctx the parse tree
	 */
	void enterDeclaration(GroundzParser.DeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#declaration}.
	 * @param ctx the parse tree
	 */
	void exitDeclaration(GroundzParser.DeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(GroundzParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(GroundzParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#ifstmt}.
	 * @param ctx the parse tree
	 */
	void enterIfstmt(GroundzParser.IfstmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#ifstmt}.
	 * @param ctx the parse tree
	 */
	void exitIfstmt(GroundzParser.IfstmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#printstmt}.
	 * @param ctx the parse tree
	 */
	void enterPrintstmt(GroundzParser.PrintstmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#printstmt}.
	 * @param ctx the parse tree
	 */
	void exitPrintstmt(GroundzParser.PrintstmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#assignstmt}.
	 * @param ctx the parse tree
	 */
	void enterAssignstmt(GroundzParser.AssignstmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#assignstmt}.
	 * @param ctx the parse tree
	 */
	void exitAssignstmt(GroundzParser.AssignstmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(GroundzParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(GroundzParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#term}.
	 * @param ctx the parse tree
	 */
	void enterTerm(GroundzParser.TermContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#term}.
	 * @param ctx the parse tree
	 */
	void exitTerm(GroundzParser.TermContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#identifier}.
	 * @param ctx the parse tree
	 */
	void enterIdentifier(GroundzParser.IdentifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#identifier}.
	 * @param ctx the parse tree
	 */
	void exitIdentifier(GroundzParser.IdentifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link GroundzParser#integer}.
	 * @param ctx the parse tree
	 */
	void enterInteger(GroundzParser.IntegerContext ctx);
	/**
	 * Exit a parse tree produced by {@link GroundzParser#integer}.
	 * @param ctx the parse tree
	 */
	void exitInteger(GroundzParser.IntegerContext ctx);
}