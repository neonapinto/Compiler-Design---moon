package syntaxAnalyser;

import lexicalAnalyzer.Token;
import lexicalAnalyzer.LexicalAnalyzer;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.*;

public class SyntacticAnalyser {
    private LexicalAnalyzer lexical_analyzer;
    private final Grammar grammar;
    //  parse stack
    private final Stack<String> parsing_stack;
    // variables
    private Token lookahead_token;          // token from the nexttoken() from lexical analyzer
    private Token terminal_suc_token;       // store the terminal token that has been parsed
    private String lookahead;               // token type read (represented by type)
    private String derivation;              // record Derivation output
    private int index_terminal_derivation;  // keep updated index of the terminal symbol in derivation
    private String top_of_stack;
    private boolean end_of_file;

    // output to files
    private PrintWriter writer_derivation;
    private PrintWriter writer_err_report;
    public String parser_errors;
    private PrintWriter writer_string_err;
    private StringWriter string_err;
    private final HashSet<Integer> error_set = new HashSet<>();

    /**
     * constructor
     */
    public SyntacticAnalyser() {
        lexical_analyzer = new LexicalAnalyzer();
        parsing_stack = new Stack<>();
        grammar = new Grammar();
        grammar.generateGrammarProject();
        end_of_file = false;
        parser_errors = "";
        string_err = new StringWriter();
        writer_string_err = new PrintWriter(string_err);
    }

    /**
     * lexical analyzer setup
     * @param src_file_path input file
     */
    public void parserLexicalSetup(String src_file_path) {
        lexical_analyzer.createTable();
        lexical_analyzer.IOFileSetup(src_file_path);
    }

    /**
     * input output files setup
     *
     * @param src_file_path input file
     */
    public void parserIOFileSetup(String src_file_path) {
        try {
            String file_path_temp = src_file_path.substring(0, src_file_path.length() - 4);
            File outfile_derivation = new File(file_path_temp + ".outderivation");
            File outfile_error = new File(file_path_temp + ".outsyntaxerrors");
            System.out.println("[Parser] Writing to the file: " + outfile_derivation.getName());
            System.out.println("[Parser] Writing to the file: " + outfile_error.getName());
            writer_derivation = new PrintWriter(outfile_derivation);
            writer_err_report = new PrintWriter(outfile_error);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * close files
     */
    public void parserIOFileClose() {
        System.out.println("[Parser] Flushing & closing files. ");
        lexical_analyzer.IOFileClose();
        writer_derivation.flush();
        writer_derivation.close();
        writer_err_report.flush();
        writer_err_report.close();
        parser_errors += string_err;
    }

    /**
     * parsing function to check for syntax errors
     * @return false when syntactic error exists
     */
    public boolean parse() {
        System.out.println("[Parser] Starting parsing...");
        boolean error = false;
        parsing_stack.push("$");
        parsing_stack.push("START");
        derivation = "START";
        writer_derivation.append(derivation).append("\r\n");
        skipCommentsRead();
        while (!parsing_stack.peek().equals("$") && !end_of_file) {
            top_of_stack = parsing_stack.peek();
            // the top of parsing stack is a terminal symbol
            if (grammar.getTerminal_list().contains(top_of_stack)) {
                terminal_suc_token = lookahead_token;
                // when matching a terminal symbol
                if (top_of_stack.equals(lookahead)) {
                    parsing_stack.pop();
                    // process derivation
                    if (index_terminal_derivation < derivation.length()) {
                        String temp_derivation = derivation;
                        derivation = derivation.substring(0, index_terminal_derivation) + derivation.substring(index_terminal_derivation).replaceFirst(lookahead, lookahead_token.getLexeme());
                        if (!temp_derivation.equals(derivation)) {
                            // store the index of the latest terminal in derivation
                            index_terminal_derivation += derivation.substring(index_terminal_derivation).indexOf(lookahead_token.getLexeme());
                            writer_derivation.append("=> ").append(derivation).append("\r\n");
                        }
                    }
                    // read next valid token
                    skipCommentsRead();
                } else {    // when match fails
                    skipErrors();
                    error = true;
                }
            } else {
                // when the top of parsing stack is a non terminal symbol
                if (grammar.getNonTerminal_list().contains(top_of_stack)) {
                    // looking up parsing table
                    if (!lookupParsingTable(top_of_stack, lookahead).equals("error")) {
                        parsing_stack.pop();
                        inverseRHSMultiplePush(top_of_stack, lookupParsingTable(top_of_stack, lookahead));
                    } else {
                        skipErrors();
                        error = true;
                    }
                } else {
                    parsing_stack.pop();
//                    }
                }
            }
        }
        if (!lookahead.equals("$") && !error) {
            if (!error_set.contains(lookahead_token.getLocation())) {
                writer_err_report.append("[Syntax error] at line: ").append(String.valueOf(lookahead_token.getLocation())).append(";\t Unexpected: '").
                        append(lookahead).append("'\r\n");
                writer_string_err.append("[Syntax error] at line: ").append(String.valueOf(lookahead_token.getLocation())).append(";\t Unexpected: '").
                        append(lookahead).append("'\r\n");
                error_set.add(lookahead_token.getLocation());
            }
        }
        return lookahead.equals("$") && !error;
    }

    /**
     * looking up result of the parsing table
     *
     * @param top_of_stack non terminal symbols on the top of stack
     * @param lookahead  token
     * @return result in the parsing table
     */
    private String lookupParsingTable(String top_of_stack, String lookahead) {
        if (lookahead.equals("invalidchar") || lookahead.equals("invalidnum") || lookahead.equals("invalidid") || lookahead.equals("invalidcmt")) {
            System.err.println("[Lexer] Lexical error(s) found!");
            lexical_analyzer.IOFileClose();
            System.exit(0);
        }
        return grammar.getParsing_table().get(top_of_stack).get(lookahead);
    }

    /**
     * inverse push into the parsing stack
     *
     * @param LHS  non terminal symbols
     * @param rule grammar in the parsing table
     */
    private void inverseRHSMultiplePush(String LHS, String rule) {
        String RHS_in_rule = grammar.getRules_attribute().get(rule).getRule_RHS().trim();
        if (!RHS_in_rule.equals("EPSILON")) {
            // generate derivation
            String RHS_to_replace = RHS_in_rule;
            if (RHS_in_rule.contains("EPSILON")) {
                RHS_to_replace = RHS_to_replace.replace("EPSILON", "");
            }
            derivation = derivation.replaceFirst(LHS.trim(), RHS_to_replace.trim());
            writer_derivation.append("=> ").append(derivation).append("\r\n");
            // push into the stack
            String[] symbols = RHS_in_rule.split("\\s");
            if (symbols.length == 1) {
                parsing_stack.push(symbols[0]);
            } else {
                for (int i = symbols.length - 1; i >= 0; i--) {
                    if (!symbols[i].isEmpty() && !symbols[i].equals(" ")) {
                        if (!symbols[i].equals("EPSILON")) {
                            parsing_stack.push(symbols[i]);
                        }
                    }
                }
            }
        } else {
            // a EPSILON rule
            derivation = derivation.replaceFirst(LHS.trim(), "");
            derivation = derivation.replace("  ", " ");
            derivation = derivation.replace(" EPSILON", "");
            writer_derivation.append("=> ").append(derivation).append("\r\n");

        }
    }

    /**
     * pop the stack if the next token is in the FOLLOW set of our current non-terminal on top of the stack.
     * scan tokens until we get one with which we can resume the parse
     */
    private void skipErrors() {
        Map<String, ArrayList<String>> first_sets = grammar.getFirst_sets();
        Map<String, ArrayList<String>> follow_sets = grammar.getFollow_sets();
        // get the original lexeme
        String expected = grammar.getSymbol_map().get(top_of_stack) == null ? top_of_stack : grammar.getSymbol_map().get(top_of_stack);
        // output error info
        if (lookahead_token != null) {
            String unexpected = grammar.getSymbol_map().get(lookahead) == null ? lookahead : grammar.getSymbol_map().get(lookahead);
            // top of stack is a terminal symbol
            if (grammar.getTerminal_list().contains(top_of_stack)) {
                parsing_stack.pop();
                System.out.println("Syntax error at: " + lookahead_token.getLocation());
                if (!error_set.contains(lookahead_token.getLocation())) {
                    writer_err_report.append("[Syntax error] at line: ").append(String.valueOf(lookahead_token.getLocation())).
                            append("\t Missing expected symbol: '").append(expected).append("'\t Unexpected: '").append(unexpected).append("'\r\n");
                    writer_string_err.append("[Syntax error] at line: ").append(String.valueOf(lookahead_token.getLocation())).
                            append("\t Missing expected symbol: '").append(expected).append("'\t Unexpected: '").append(unexpected).append("'\r\n");
                    error_set.add(lookahead_token.getLocation());
                }
            } else {
                //  pop the stack if the next token is in the FOLLOW set of our current non terminal on top of the stack
                if (lookahead.equals("$") || follow_sets.get(top_of_stack).contains(lookahead)) {
                    System.out.println("Syntax error at: " + lookahead_token.getLocation());
                    if (!error_set.contains(lookahead_token.getLocation())) {
                        writer_err_report.append("[Syntax error] at line: ").append(String.valueOf(lookahead_token.getLocation())).append("\t Skip parsing : '").
                                append(unexpected).append("'\t Expected: '").append(expected).append("'\r\n");
                        writer_string_err.append("[Syntax error] at line: ").append(String.valueOf(lookahead_token.getLocation())).append("\t Skip parsing : '").
                                append(unexpected).append("'\t Expected: '").append(expected).append("'\r\n");
                        parsing_stack.pop();
                        error_set.add(lookahead_token.getLocation());
                    }

                } else {
                    // scan tokens until we get one with which we can resume the parse
                    System.out.println("Syntax error at: " + lookahead_token.getLocation());
                    if (!error_set.contains(lookahead_token.getLocation())) {
                        writer_err_report.append("[Syntax error] at line: ").append(String.valueOf(lookahead_token.getLocation())).append("\t Unexpected: '").
                                append(unexpected).append("'\t Expected: '").append(expected).append("'\r\n");
                        writer_string_err.append("[Syntax error] at line: ").append(String.valueOf(lookahead_token.getLocation())).append("\t Unexpected: '").
                                append(unexpected).append("'\t Expected: '").append(expected).append("'\r\n");
                        error_set.add(lookahead_token.getLocation());
                    }else{
                        skipCommentsRead();
                    }
                    while (!first_sets.get(top_of_stack).contains(lookahead) &&
                            ((first_sets.get(top_of_stack).contains("EPSILON") && !follow_sets.get(top_of_stack).contains(lookahead)))) {
                        skipCommentsRead();
                        if (lookahead.equals("$")) {
                            break;
                        }
                    }
                }
            }
        } else {
            System.out.println("The program has syntax error(s).");
            writer_err_report.append("[Syntax error] at the end of the file.").append("\t Unexpected: '").
                    append(lookahead).append("'\r\n");
            writer_string_err.append("[Syntax error] at the end of the file.").append("\t Unexpected: '").
                    append(lookahead).append("'\r\n");
            writer_err_report.flush();
            writer_err_report.close();
            end_of_file = true;
        }
    }


    /**
     * ignore comments token and look for the nexttoken
     */
    private void skipCommentsRead() {
        String lookahead_type;
        do {
            lookahead_token = lexical_analyzer.nextToken();
            if (lexical_analyzer.isFinished()) {
                lookahead_type = "$";
                lookahead = "$";
                break;
            } else {
                lookahead_type = lookahead_token.getType();
            }
        } while (lookahead_type.equals("blockcmt") || lookahead_type.equals("inlinecmt"));
        lookahead = toTerminalSymbols(lookahead_type);
    }


    /**
     * match the token type to the forms of rules defined
     *
     * @param lookahead_type type of the token
     * @return corresponding to grammar rules
     */
    private String toTerminalSymbols(String lookahead_type) {
        switch (lookahead_type) {
            case "openpar":
                return "lpar";
            case "closepar":
                return "rpar";
            case "opensqbr":
                return "lsqbr";
            case "closesqbr":
                return "rsqbr";
            case "opencubr":
                return "lcurbr";
            case "closecubr":
                return "rcurbr";
            case "noteq":
                return "neq";
            case "coloncolon":
                return "sr";
            default:
                return lookahead_type;
        }
    }
}
