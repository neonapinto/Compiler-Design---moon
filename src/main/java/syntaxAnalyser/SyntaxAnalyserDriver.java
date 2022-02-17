package syntaxAnalyser;

import java.io.File;

public class SyntaxAnalyserDriver {
    public static void main(String[] args) {
        final String path = "testcases/SyntacticAnalyserTest/syntacticCorrectFiles/";
        File f = new File(path);
        System.out.println("---------------------------Syntax Analyser---------------------------");
        if (f.isDirectory()) {
            File[] files = f.listFiles(((dir, name) -> name.endsWith(".src")));
            if (files != null) {
                for (File file : files) {
                    syntacticAnalyzerOneFile(file.getAbsolutePath());
                }
            }
        } else {
            if (f.getAbsolutePath().endsWith(".src")) {
                syntacticAnalyzerOneFile(f.getAbsolutePath());
            }
        }
    }

    // tokenizing single file
    static void syntacticAnalyzerOneFile(String file_path) {
        SyntacticAnalyser syntacticAnalyzer = new SyntacticAnalyser();
        syntacticAnalyzer.parserLexicalSetup(file_path);
        syntacticAnalyzer.parserIOFileSetup(file_path);
        boolean syntacticCorrect = syntacticAnalyzer.parse();
        if (syntacticCorrect) {
            System.out.println("The program is syntactically correct.");
        } else {
            System.out.println("The program has syntax error(s).");
        }
        syntacticAnalyzer.parserIOFileClose();
    }
}
