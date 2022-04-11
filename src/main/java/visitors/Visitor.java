package visitors;
import AST.*;

/**
 * Visitor superclass. Can be either an interface or an abstract class.
 * Needs to have one visit method for each of the visit methods
 * implemented by any of its subclasses.
 *
 * This forces all its subclasses to implement all of them, even if they
 * are not concerned with processing of this particular subtype, creating
 * visit methods with a body whose only function is to propagate accept() to
 * all the children of the visited node.
 *
 * Or use a regular class with empty methods
 */

public class Visitor {
    public void visit(AddOpNode         p_node) {};
    public void visit(AParamsNode       p_node) {};
    public void visit(ArithExprNode     p_node) {};
    public void visit(AssignStatNode    p_node){};
    public void visit(StructListNode    p_node){};
    public void visit(StructDeclNode    p_node){};
    public void visit(ImplDefListNode   p_node){};
    public void visit(ImplDefNode       p_node){};
    public void visit(DataMemNode       p_node){};
    public void visit(DimListNode       p_node){};
    public void visit(DimNode           p_node){};
    public void visit(DotNode           p_node){};
    public void visit(ExprNode          p_node){};
    public void visit(FactorNode        p_node){};
    public void visit(FloatNode         p_node){};
    public void visit(FParamListNode    p_node){};
    public void visit(FParamNode        p_node){};
    public void visit(FuncBodyNode      p_node){};
    public void visit(FuncCallNode      p_node){};
    public void visit(FuncCallStatNode  p_node){};
    public void visit(FuncDeclNode      p_node){};
    public void visit(FuncDefListNode   p_node){};
    public void visit(FuncDefNode       p_node){};
    public void visit(FuncOrVarNode     p_node){};
    public void visit(IdNode            p_node){};
    public void visit(IfStatNode        p_node){};
    public void visit(IndiceNode        p_node){};
    public void visit(InheritListNode p_node){};
    public void visit(MembDeclNode      p_node){};
    public void visit(MembListNode      p_node){};
    public void visit(MultOpNode        p_node){};
    public void visit(Node              p_node){};
    public void visit(NotNode           p_node){};
    public void visit(NumNode           p_node){};
    public void visit(ProgNode          p_node){};
    public void visit(ReadStatNode      p_node){};
    public void visit(RelExprNode       p_node){};
    public void visit(RelOpNode         p_node){};
    public void visit(ReturnStatNode    p_node){};
    public void visit(SignNode          p_node){};
    public void visit(StatBlockNode     p_node){};
    public void visit(TermNode          p_node){};
    public void visit(TypeNode          p_node){};
    public void visit(VarDeclNode       p_node){};
    public void visit(VariableNode      p_node){};
    public void visit(VisibilityNode    p_node){};
    public void visit(WhileStatNode     p_node){};
    public void visit(WriteStatNode     p_node){};
}