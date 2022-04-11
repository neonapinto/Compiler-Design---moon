package AST;

import visitors.Visitor;

public class InheritListNode extends Node {

    public InheritListNode() {
        super("");
    }

    public InheritListNode(Node parent) {
        super("", parent);
    }

    public void accept(Visitor visitor) {
        visitor.visit(this);
    }

}
