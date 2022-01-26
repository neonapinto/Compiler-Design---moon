package lexicalAnalyser;

import java.io.File;
import java.util.Scanner;

public class LexicalDriver {

    public static void main(String[] args) {
//      lexnegativegrading.src lexpositivegrading.src
        final String path = "testcases/LexicalAnalyserTest/";
        Scanner sc = new Scanner(System.in);
        String filename = sc.next();
        File f = new File(path + filename);
        if (f.isDirectory()) {
            File[] files = f.listFiles(((dir, name) -> name.endsWith(".src")));
            if (files != null) {
                for (File file : files) {
                  TokenizeFile(file.getAbsolutePath());
                }
            }
        } else {
            if (f.getAbsolutePath().endsWith(".src")) {
                TokenizeFile(f.getAbsolutePath());
            }
        }
    }

    /**
     * Tokenizing the file
     * @param file_path name of the file
     */
    static void TokenizeFile(String file_path) {
        LexicalAnalyser lexicalAnalyser = new LexicalAnalyser();
        System.out.println("---------------------------Lexical Analyser---------------------------");
        lexicalAnalyser.createTransitionTable();
        lexicalAnalyser.writeToFiles(file_path);
        while (lexicalAnalyser.nextToken() != null) {
            if (lexicalAnalyser.isFinished())
                break;
        }
        System.out.println("Files are successfully created.");
        lexicalAnalyser.closeFiles();
    }
}






