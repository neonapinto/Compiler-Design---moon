package codeGeneration;

import lexicalAnalyzer.LexicalAnalyzer;
import semanticAnalyzer.SemanticAnalyzer;
import syntaxAnalyser.SyntacticAnalyser;
import java.io.File;
import java.util.Scanner;

public class CompilerDriver {
    public static void main(String[] args) {
        //testcases/LexicalAnalyserTest/
        //testcases/SyntacticAnalyserTest/syntacticCorrectFiles
        //testcases/SyntacticAnalyserTest/syntacticIncorrectFiles
        //testcases/SemanticAnalyserTest
        //testcases/CodeGeneration/
        System.out.println("Enter the file name or the directory name:");
        Scanner sc = new Scanner(System.in);
        String path = sc.nextLine();
        File f = new File(path);
        if (f.isDirectory()) {
            File[] files = f.listFiles(((dir, name) -> name.endsWith(".src")));
            if (files != null) {
                for (File file : files) {
                    if(!tokenizingOneFile(file.getAbsolutePath())){
                        compileOneFile(file.getAbsolutePath());
                        System.out.println();
                    }
                }
            }
        }else if (f.getAbsolutePath().endsWith(".src")) {
                compileOneFile(f.getAbsolutePath());
        }
        else{
            System.out.println("The file or the directory is not found.");
        }
    }

    static boolean tokenizingOneFile(String file_path){
        boolean lexer_error = false;
        // lexical analysis
        System.out.println("-------------------Lexical Analyzer--------------------");
        LexicalAnalyzer lexicalAnalyzer = new LexicalAnalyzer();
        lexicalAnalyzer.createTransitionTable();
        lexicalAnalyzer.fileSetup(file_path);
        while (lexicalAnalyzer.nextToken() != null) {
            if (lexicalAnalyzer.isFinished())
                break;
        }
        lexicalAnalyzer.closeFiles();
        if(!lexicalAnalyzer.lex_errors.isEmpty()){
            lexer_error = true;
        }
        return lexer_error;
    }

    // processing single file
    static void compileOneFile(String file_path) {
        // parse the src file
        SyntacticAnalyser syntacticAnalyzer = new SyntacticAnalyser();
        syntacticAnalyzer.parserLexicalSetup(file_path);
        syntacticAnalyzer.parserFileSetup(file_path);
        System.out.println("-------------------Syntax Analyzer--------------------");
        boolean syntacticCorrect = syntacticAnalyzer.parse();
        if (syntacticCorrect) {
            System.out.println("[OK]The program is syntactically correct.");
            syntacticAnalyzer.parserFileClose();
        } else {
            System.out.println("[ERROR]The program has syntax error(s).");
            syntacticAnalyzer.parserFileClose();
        }

        // do semantic analysis
        SemanticAnalyzer semanticAnalyzer = new SemanticAnalyzer();
        semanticAnalyzer.setProgNode(syntacticAnalyzer.getProgNode());
        semanticAnalyzer.createTableAndChecking();
        semanticAnalyzer.setParser_errors(syntacticAnalyzer.parser_errors);
        semanticAnalyzer.writeToFiles(file_path);
        semanticAnalyzer.closeFiles();

        // generate code
        CodeGeneration codeGeneration = new CodeGeneration();
        codeGeneration.setProgNode(syntacticAnalyzer.getProgNode());
        codeGeneration.generateCode();
        codeGeneration.writeToFiles(file_path);
        codeGeneration.closeFiles();
        String file_path_temp = file_path.substring(0, file_path.length() - 4);
        System.out.println("******* Code generated for file " + new File(file_path_temp).getName() + ".src *********");
    }
}
