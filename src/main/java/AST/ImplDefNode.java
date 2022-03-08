package AST;

import java.util.List;

public class ImplDefNode extends Node{
    public ImplDefNode() {
        super("");
    }

    public ImplDefNode(Node p_parent) {
        super("", p_parent);
    }

    public ImplDefNode(Node p_id, List<Node> p_listOfImplNodes) {
        super("");
        this.addChild(p_id);
        for (Node child : p_listOfImplNodes)
            this.addChild(child);
    }
}
