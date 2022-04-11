package AST;

import visitors.Visitor;

import java.util.List;

public class ImplDefListNode extends Node {

    public ImplDefListNode() {
        super("");
    }

    public ImplDefListNode(Node p_parent) {
        super("", p_parent);
    }

    public ImplDefListNode(List<Node> p_listOfImplNodes) {
        super("");
        for (Node child : p_listOfImplNodes)
            this.addChild(child);
    }

    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}