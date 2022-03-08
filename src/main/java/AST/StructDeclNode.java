package AST;

import java.util.List;

public class StructDeclNode extends Node{

    public StructDeclNode() {
        super("");
    }

    public StructDeclNode(Node p_parent) {
        super("", p_parent);
    }

    public StructDeclNode(Node p_id, List<Node> p_listOfStructMemberNodes) {
        super("");
        this.addChild(p_id);
        for (Node child : p_listOfStructMemberNodes)
            this.addChild(child);
    }
}
