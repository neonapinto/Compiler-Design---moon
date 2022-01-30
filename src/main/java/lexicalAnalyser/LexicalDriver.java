package lexicalAnalyser;

import java.io.File;

public class LexicalDriver {
    public static void main(String[] args) {
//      lexnegativegrading.src lexpositivegrading.src commentstests.src numbertests.src stringidentifierstests.src
        final String path = "testcases/LexicalAnalyserTest/";
        File f = new File(path);
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






