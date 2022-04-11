package AST;

import visitors.Visitor;

import java.util.List;

public class StructListNode extends Node{
    public StructListNode() {
        super("");
    }

    public StructListNode(Node p_parent) {
        super("", p_parent);
    }

    public StructListNode(List<Node> p_listOfStructNodes) {
        super("");
        for (Node child : p_listOfStructNodes)
            this.addChild(child);
    }
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
