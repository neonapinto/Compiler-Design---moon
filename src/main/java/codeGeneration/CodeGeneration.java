package codeGeneration;

import AST.Node;
import visitors.StackBasedVisitor;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;

public class CodeGeneration {
    private Node progNode;
    private final StackBasedVisitor SBVisitor = new StackBasedVisitor();
    private PrintStream writer_moon;

    public CodeGeneration() {
    }

    public void setProgNode(Node progNode) {
        this.progNode = progNode;
    }

    public void generateCode(){
        System.out.println("---------------------Code Generation-------------------");
        if(progNode!=null) {
            System.out.println("StackBased visitor starts: ");
            progNode.accept(SBVisitor);
        }
    }



    public void writeToFiles(String src_file_path) {
        try {
            String file_path_temp = src_file_path.substring(0, src_file_path.length() - 4);
            File outfile_moon = new File(file_path_temp + ".m");
            System.out.println("Writing to the file: " + outfile_moon.getName());
            writer_moon = new PrintStream(outfile_moon);
            PrintStream console = System.out;
            System.setOut(writer_moon);
            System.out.println(SBVisitor.m_moonExecCode);
            System.out.println(SBVisitor.m_moonDataCode);
            System.setOut(console);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

    }

    public void closeFiles() {
        System.out.println("Flushing & closing files. ");
        writer_moon.flush();
        writer_moon.close();
    }

}
