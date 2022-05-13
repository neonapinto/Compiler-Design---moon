package visitors;


import AST.*;
/**
 * Visitor to construct a string that represents the subexpression
 * of the subtree for which the current node is the head.
 * <p>
 * This applies only to nodes that are part of expressions, i.e.
 * IdNode, AddOpNode, MultOpNode, and AssignStatp_node.
 */

public class ReconstructSourceVisitor extends Visitor {
    public ReconstructSourceVisitor() {
    }

    public void visit(ProgNode p_node) {
        // propagate accepting the same visitor to all the children
        // this effectively achieves Depth-First AST Traversal
        for (Node child : p_node.getChildren())
            child.accept(this);

        for (Node child : p_node.getChildren()) {
            p_node.m_subtreeString += child.m_subtreeString;
        }
    }

    public void visit(StatBlockNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        for (Node child : p_node.getChildren()) {
            p_node.m_subtreeString += "  " + child.m_subtreeString + "\n";
        }
    }

    public void visit(StructListNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        for (Node child : p_node.getChildren())
            p_node.m_subtreeString += child.m_subtreeString;
    }

    public void visit(StructDeclNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "struct ";
        p_node.m_subtreeString += p_node.getChildren().get(0).getData() + p_node.getChildren().get(1).m_subtreeString + " {\n";
        p_node.m_subtreeString += p_node.getChildren().get(2).m_subtreeString + "};\n\n";
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(ImplDefNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "impl " + p_node.getChildren().get(0).getData() + "{\n";
        p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString + "}";
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(InheritListNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "";
        boolean first = true;
        for (Node child : p_node.getChildren()) {
            if (first)
                p_node.m_subtreeString += " inherits " + child.m_subtreeString;
            else
                p_node.m_subtreeString += ", " + child.m_subtreeString;
            first = false;
        }
    }

    public void visit(MembListNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        for (Node child : p_node.getChildren()) {
            p_node.m_subtreeString += child.m_subtreeString;
        }
    }

    public void visit(MembDeclNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "  " + p_node.getChildren().get(0).m_subtreeString;
        p_node.m_subtreeString += " " + p_node.getChildren().get(1).m_subtreeString;
    }

    public void visit(FuncDeclNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "func " + p_node.getChildren().get(0).m_subtreeString;
        p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString + ": ";
        p_node.m_subtreeString += p_node.getChildren().get(2).m_subtreeString + ";\n";
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(VisibilityNode p_node) {
        p_node.m_subtreeString += p_node.getData();
    }

    public void visit(FuncCallNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += p_node.getChildren().get(0).m_subtreeString;
        p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(IfStatNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "if(" + p_node.getChildren().get(0).m_subtreeString + ")";
        p_node.m_subtreeString += "\nthen {" + p_node.getChildren().get(1).m_subtreeString + "} ";
        p_node.m_subtreeString += "else" + p_node.getChildren().get(2).m_subtreeString + ";";
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(WhileStatNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "while(" + p_node.getChildren().get(0).m_subtreeString + ")";
        p_node.m_subtreeString += "{\n" + p_node.getChildren().get(1).m_subtreeString + "};";
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(ReadStatNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "read(" + p_node.getChildren().get(0).m_subtreeString + ");";
    }

    public void visit(WriteStatNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "write(" + p_node.getChildren().get(0).m_subtreeString + ");";
    }

    public void visit(ReturnStatNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "return(" + p_node.getChildren().get(0).m_subtreeString + ");";
        p_node.m_line = p_node.getChildren().get(0).m_line;

    }

    public void visit(FuncCallStatNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        for (Node child : p_node.getChildren())
            p_node.m_subtreeString += child.m_subtreeString + ";";
    }

    public void visit(FuncDefNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);

        if(p_node.getChildren().size()>3) {
            p_node.m_subtreeString += "func " + p_node.getChildren().get(0).m_subtreeString;
            p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString + ": ";
            p_node.m_subtreeString += p_node.getChildren().get(2).m_subtreeString;
            p_node.m_subtreeString += p_node.getChildren().get(3).m_subtreeString + "\n";
            p_node.m_line = p_node.getChildren().get(0).m_line;
        }
    }



    public void visit(FuncBodyNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);

        if (p_node.getChildren().get(0).isLeaf()) {
            if(p_node.getChildren().size()>1) {
                p_node.m_subtreeString += "{" + p_node.getChildren().get(1).m_subtreeString + "}";
            }
        } else {
            p_node.m_subtreeString += "{\n" + p_node.getChildren().get(0).m_subtreeString + "}";
            if(p_node.getChildren().size()>1) {
                p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString + "}";
            }
        }

    }


    public void visit(FParamListNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "(";
        boolean first = true;
        for (Node child : p_node.getChildren()) {
            if (first)
                p_node.m_subtreeString += child.m_subtreeString;
            else
                p_node.m_subtreeString += ", " + child.m_subtreeString;
            first = false;
        }
        p_node.m_subtreeString += ") ";
    }


    public void visit(FParamNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += p_node.getChildren().get(0).m_subtreeString + " ";
        p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString;
        p_node.m_subtreeString += p_node.getChildren().get(2).m_subtreeString;
    }


    public void visit(AParamsNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "(";
        boolean first = true;
        for (Node child : p_node.getChildren()) {
            if (first)
                p_node.m_subtreeString += child.m_subtreeString;
            else
                p_node.m_subtreeString += ", " + child.m_subtreeString;
            first = false;
        }
        p_node.m_subtreeString += ")";
    }


    public void visit(TypeNode p_node) {
        for (Node child : p_node.getChildren()) {
            child.accept(this);
        }
        if (p_node.getData().equals("")) {
            p_node.setSubtreeString(p_node.getChildren().get(0).m_subtreeString);
            p_node.m_line = p_node.getChildren().get(0).m_line;
        } else {
            p_node.setSubtreeString(p_node.getData());
        }
    }

    public void visit(VarDeclNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += p_node.getChildren().get(0).m_subtreeString + " ";
        p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString;
        p_node.m_subtreeString += p_node.getChildren().get(2).m_subtreeString + ";";
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(DimListNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        for (Node child : p_node.getChildren()) {
            p_node.m_subtreeString += child.m_subtreeString;
        }
            p_node.m_line = p_node.getLm_sibling().m_line;
    }

    public void visit(IdNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.setSubtreeString(p_node.getData());
    }

    public void visit(IndiceNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        for (Node child : p_node.getChildren()) {
            p_node.m_subtreeString += "[" + child.m_subtreeString + "]";
            p_node.m_line = child.m_line;
        }
    }

    public void visit(NumNode p_node) {
        p_node.setSubtreeString(p_node.getData());
    }

    public void visit(FloatNode p_node) {
        p_node.setSubtreeString(p_node.getData());
    }

    public void visit(RelOpNode p_node) {
        p_node.setSubtreeString(p_node.getData());
    }

    public void visit(NotNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += "!" + p_node.getChildren().get(0).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(SignNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += p_node.getChildren().get(0).m_subtreeString;
    }

    public void visit(AddOpNode p_node) {
        // propagate accepting the same visitor to all the children
        // this effectively achieves Depth-First AST Traversal
        for (Node child : p_node.getChildren())
            child.accept(this);
        // Then, do the processing of this nodes' visitor
        p_node.setSubtreeString(p_node.getChildren().get(0).getSubtreeString() +
                p_node.getData() +
                p_node.getChildren().get(1).getSubtreeString());
    }

    public void visit(MultOpNode p_node) {
        // propagate accepting the same visitor to all the children
        // this effectively achieves Depth-First AST Traversal
        for (Node child : p_node.getChildren())
            child.accept(this);
        // Then, do the processing of this nodes' visitor
        p_node.setSubtreeString(p_node.getChildren().get(0).getSubtreeString() +
                p_node.getData() +
                p_node.getChildren().get(1).getSubtreeString());
    }

    public void visit(AssignStatNode p_node) {
        // propagate accepting the same visitor to all the children
        // this effectively achieves Depth-First AST Traversal
        for (Node child : p_node.getChildren())
            child.accept(this);
        // Then, do the processing of this nodes' visitor
        p_node.setSubtreeString(p_node.getChildren().get(0).getSubtreeString() +
                p_node.getData() +
                p_node.getChildren().get(1).getSubtreeString() + ";");
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(RelExprNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.setSubtreeString(p_node.getChildren().get(0).getSubtreeString() +
                p_node.getChildren().get(1).getSubtreeString() +
                p_node.getChildren().get(2).getSubtreeString());
        p_node.m_line = p_node.getChildren().get(1).m_line;
    }

    public void visit(VariableNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += p_node.getChildren().get(0).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(DataMemNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += p_node.getChildren().get(0).m_subtreeString;
        p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(DotNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString += p_node.getChildren().get(0).m_subtreeString + ".";
        p_node.m_subtreeString += p_node.getChildren().get(1).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(FuncDefListNode p_node) {
        // propagate accepting the same visitor to all the children
        // this effectively achieves Depth-First AST Traversal
        for (Node child : p_node.getChildren())
            child.accept(this);
        for (Node child : p_node.getChildren())
            p_node.m_subtreeString += child.m_subtreeString;
    }

    public void visit(ExprNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString = p_node.getChildren().get(0).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(ArithExprNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString = p_node.getChildren().get(0).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(TermNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString = p_node.getChildren().get(0).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(FactorNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString = p_node.getChildren().get(0).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

    public void visit(DimNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString = p_node.getData();
    }

    public void visit(FuncOrVarNode p_node) {
        for (Node child : p_node.getChildren())
            child.accept(this);
        p_node.m_subtreeString = p_node.getChildren().get(0).m_subtreeString;
        p_node.m_line = p_node.getChildren().get(0).m_line;
    }

}
