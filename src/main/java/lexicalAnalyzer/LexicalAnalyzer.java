package lexicalAnalyzer;

import java.io.*;

public class LexicalAnalyzer {
    private static State[] transition_table;    // an array storing states
    private BufferedReader reader;
    private PrintWriter writer_tok;
    private PrintWriter writer_err;
    private StringWriter string_err;
    private PrintWriter writer_string_err;
    public String lexical_errors;
    private Token curr_token;           // token object storing info
    private StringBuilder curr_lexeme;  // records the lexeme for the current token
    private int curr_line;              // records the current line
    private int out_line;               // for printing token file
    private Character backup_char;      // back up the current char in case of backtrace
    private boolean is_finished;        // end of file
    private int num_nested_cmt;         // for nested comments

    public LexicalAnalyzer() {
        curr_line = 1;
        out_line = 1;
        is_finished = false;
        num_nested_cmt = 0;
        string_err = new StringWriter();
        writer_string_err = new PrintWriter(string_err);
    }

    public boolean isFinished() {
        return is_finished;
    }

    /**
     * set up the reader and writer
     * @param file_path the path of .src files
     */
    public void fileSetup(String file_path) {
        try {
            File file_read = new File(file_path);
            System.out.println("Reading the file: " + file_read.getName());
            reader = new BufferedReader(new FileReader(file_path));
            String file_path_temp = file_path.substring(0, file_path.length() - 4);
            File outfile_tok = new File(file_path_temp + ".outlextokens");
            File outfile_err = new File(file_path_temp + ".outlexerrors");
            System.out.println("Writing to the file: " + outfile_tok.getName());
            System.out.println("Writing to the file: " + outfile_err.getName());
            writer_tok = new PrintWriter(outfile_tok);
            writer_err = new PrintWriter(outfile_err);

        }catch (FileNotFoundException e){
            System.err.println("Folder or file does not exist. ");
            System.exit(0);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * flush contents to files and close files
     */
    public void closeFiles() {
        System.out.println("Flushing & closing files.");
        try {
            reader.close();
            writer_tok.flush();
            writer_tok.close();
            writer_err.flush();
            writer_err.close();
            lexical_errors = string_err.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addTransitions(int state, int[] next_state) {
        char[] column_char = {'L', 'e', '0', 'N', '_', '/', '*', '=', '<', '>', ':', '+', '-', '&', '.', ' ', '\n', '\r', '~', '\u0000'};
        for (int i = 0; i < 20; i++) {
            transition_table[state].add_transition(column_char[i], next_state[i]);
        }
    }

    private void setNonFinalState(int index, int[] next_state) {
        transition_table[index] = new State(index);
        addTransitions(index, next_state);
    }

    private void setFinalState(int index, String final_state_name, boolean backtrack) {
        transition_table[index] = new State(index, true, final_state_name, backtrack);

    }

    /**
     * create the transition table, each row is a state object in which stores a map <Character, Integer> for transitions
     */
    public void createTransitionTable() {
        System.out.println("Creating the transition table... ");
        transition_table = new State[50];
        setFinalState(0, "invalidchar", false);
        int[] next_state;
        next_state = new int[]{2, 2, 6, 8, 4 , 26, 46, 33, 36, 40, 43, 46, 23 , 46, 46, 1, 1, 1, 0, 1};
        setNonFinalState(1, next_state);
        next_state = new int[]{2, 2, 2, 2, 2 , 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 3};
        setNonFinalState(2, next_state);
        setFinalState(3, "id", true);
        next_state = new int[]{4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 5};
        setNonFinalState(4, next_state);
        setFinalState(5, "invalidid", true);
        next_state = new int[]{4, 9, 9, 9, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 14, 7, 7, 7, 0, 7};
        setNonFinalState(6, next_state);
        setFinalState(7, "intnum", true);
        next_state = new int[]{12, 12, 8, 8, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 13, 13, 13, 0, 13};
        setNonFinalState(8, next_state);
        next_state = new int[]{4, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 9, 9, 10, 9, 10, 10, 10, 0, 10};
        setNonFinalState(9, next_state);
        setFinalState(10, "invalidnum", true);
        setFinalState(11, "invalidcmt", false);
        next_state = new int[]{12, 12, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 5};
        setNonFinalState(12, next_state);
        setFinalState(13, "intnum", true);
        next_state = new int[]{10, 10, 15, 15, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 10};
        setNonFinalState(14, next_state);
        next_state = new int[]{10, 18, 16, 15, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 0, 17};
        setNonFinalState(15, next_state);
        next_state = new int[]{10, 10, 16, 15, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 10};
        setNonFinalState(16, next_state);
        setFinalState(17, "floatnum", true);
        next_state = new int[]{10, 10, 20, 22, 10, 10, 10, 10, 10, 10, 10, 19, 19, 10, 10, 10, 10, 10, 0, 10};
        setNonFinalState(18, next_state);
        next_state = new int[]{10, 10, 20, 22, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 10};
        setNonFinalState(19, next_state);
        next_state = new int[]{10, 10, 21, 21, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 0, 17};
        setNonFinalState(20, next_state);
        next_state = new int[]{10, 10, 21, 21, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10};
        setNonFinalState(21, next_state);
        next_state = new int[]{10, 10, 22, 22, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 0, 17};
        setNonFinalState(22, next_state);
        next_state = new int[]{25, 25, 25, 25, 25, 25, 25, 25, 25, 24, 25, 25, 25, 25, 25, 25, 25, 25, 0, 25};
        setNonFinalState(23, next_state);
        setFinalState(24, "arrow", false);
        setFinalState(25, "minus", true);
        next_state = new int[]{29, 29, 29, 29, 29, 27, 30, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 0, 29};
        setNonFinalState(26, next_state);
        next_state = new int[]{27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28, 28, 27, 28};
        setNonFinalState(27, next_state);
        setFinalState(28, "inlinecmt", false);
        setFinalState(29, "div", true);
        next_state = new int[]{49, 49, 49, 49, 49, 47, 31, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 11};
        setNonFinalState(30, next_state);
        next_state = new int[]{49, 49, 49, 49, 49, 48, 31, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 11};
        setNonFinalState(31, next_state);
        setFinalState(32, "blockcmt", false);
        next_state = new int[]{35, 35, 35, 35, 35, 35, 35, 34, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 0, 35};
        setNonFinalState(33, next_state);
        setFinalState(34, "eq", false);
        setFinalState(35, "assign", true);
        next_state = new int[]{39, 39, 39, 39, 39, 39, 39, 37, 0, 38, 39, 39, 39, 39, 39, 39, 39, 39, 0, 39};
        setNonFinalState(36, next_state);
        setFinalState(37, "leq", false);
        setFinalState(38, "noteq", false);
        setFinalState(39, "lt", true);
        next_state = new int[]{42, 42, 42, 42, 42, 0, 0, 41, 0, 0, 42, 42, 42, 42, 42, 42, 42, 42, 0, 42};
        setNonFinalState(40, next_state);
        setFinalState(41, "geq", false);
        setFinalState(42, "gt", true);
        next_state = new int[]{45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 44, 45, 45, 45, 45, 45, 45, 45, 0, 45};
        setNonFinalState(43, next_state);
        setFinalState(44, "coloncolon", false);
        setFinalState(45, "colon", true);
        setFinalState(46, "symbol", false);
        next_state = new int[]{49, 49, 49, 49, 49, 47, 30, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 11};
        setNonFinalState(47, next_state);
        next_state = new int[]{49, 49, 49, 49, 49, 47, 31, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 11};
        setNonFinalState(48, next_state);
        next_state = new int[]{49, 49, 49, 49, 49, 47, 31, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 11};
        setNonFinalState(49, next_state);
    }

    /**
     * Called by syntactic analyzer
     *
     * @return Extract the next token in the program
     */
    public Token nextToken() {
        int curr_state = 1;
        curr_token = null;
        curr_lexeme = new StringBuilder();
        boolean will_finish = false;
        do {
            if(will_finish){
                is_finished = true;
                break;
            }

            char lookup_char = nextChar();      // read next character
            char input_char = initialToInput(lookup_char);      // mapping to characters in the transition table
            curr_state = lookupTable(curr_state, input_char);   // look up the next state
            curr_state = nestedComments(curr_state);            // deal with nested block comments
            if (transition_table[curr_state].isFinalState()) {
                if ((transition_table[curr_state].isBacktrack()) && (lookup_char != '\n') && (lookup_char != '\r')) {
                    backup_char = lookup_char;              // back up
                } else {
                    backup_char = null;
                    curr_lexeme.append(lookup_char);
                }
                curr_token = createToken(curr_state);       // generate the token
                writeToBuffers();
            } else {
                backup_char = null;
                curr_lexeme.append(lookup_char);            // records the lexeme for current token
            }
            if (lookup_char == 10) {                        // when reads a new line
                curr_line++;
            }

            if (lookup_char == 65535) {                      // when reach the end of file
                will_finish = true;
                writer_tok.write("\r\n");
            }
        } while (curr_token == null);
        return curr_token;
    }

    /**
     * Dealing with nested comments
     * @param current state
     * @return the state after dealing with nested block comments case
     */
    private int nestedComments(int current) {
        if (current == 30) {
            num_nested_cmt++;
        }
        if (current == 48) {
            num_nested_cmt--;
            if (num_nested_cmt == 0) {
                return 32;
            }
        }
        return current;
    }

    /**
     * write the info to output buffers
     */
    public void writeToBuffers() {
        if (out_line == curr_line) {
            writer_tok.append(curr_token.toString());
            writer_tok.append(" ");

        } else {
            writer_tok.append("\r\n");
            writer_tok.append(curr_token.toString());
            out_line = curr_line;
        }

        if (curr_token.isError()) {
            switch (curr_token.getType()) {
                case "invalidchar":
                    writer_err.append("Lexical error: Invalid character: \"").append(curr_token.getLexeme()).append("\": line ").append(String.valueOf(curr_token.getLocation())).append(".\n");
                    writer_string_err.append("Lexical error: Invalid character: \"").append(curr_token.getLexeme()).append("\": line ").append(String.valueOf(curr_token.getLocation())).append(".\n");
                    break;
                case "invalidnum":
                    writer_err.append("Lexical error: Invalid number: \"").append(curr_token.getLexeme()).append("\": line ").append(String.valueOf(curr_token.getLocation())).append(".\n");
                    writer_string_err.append("Lexical error: Invalid number: \"").append(curr_token.getLexeme()).append("\": line ").append(String.valueOf(curr_token.getLocation())).append(".\n");
                    break;
                case "invalidid":
                    writer_err.append("Lexical error: Invalid identifier: \"").append(curr_token.getLexeme()).append("\": line ").append(String.valueOf(curr_token.getLocation())).append(".\n");
                    writer_string_err.append("Lexical error: Invalid identifier: \"").append(curr_token.getLexeme()).append("\": line ").append(String.valueOf(curr_token.getLocation())).append(".\n");
                    break;
                case "invalidcmt":
                    num_nested_cmt = 0;
                    writer_err.append("Lexical error: Unclosed comments: \"").append(curr_token.getLexeme()).append("\": line ").append(String.valueOf(curr_token.getLocation())).append(".\n");
                    writer_string_err.append("Lexical error: Unclosed comments: \"").append(curr_token.getLexeme()).append("\": line ").append(String.valueOf(curr_token.getLocation())).append(".\n");
                    break;
            }
        }
    }

    /**
     * @return the next character read in the input program
     */
    public char nextChar() {
        try {
            if (backup_char != null) {
                return backup_char;
            }
            int lookup = reader.read();
            return (char) lookup;
        } catch (IOException e) {
            e.printStackTrace();
            return '~';
        }
    }

    /**
     * @param character character read in the file
     * @return character in the table after mapping
     */
    private char initialToInput(int character) {
        if (character == 65535) {
            return '\u0000';            // end of file
        }
        if (character == 0 | character == 9 | character == 32) {
            return 32;                  // space
        }
        if ((character >= 65 && character <= 90) | (character >= 97 && character <= 122 && (character != 101))) {
            return 'L';                 // letter except 'e'
        } else {
            if (character >= 49 && character <= 57) {
                return 'N';             // nonzero
            } else {
                if (character == 124 | character == 38 | character == 33 | character == 40 | character == 41 | character == 123 | character == 125 | character == 91 | character == 93 | character == 59 | character == 44) {
                    return '&';             // symbols
                } else {
                    if (character == 101 | character == 48 | character == 95 | character == 47 | character == 42 | character == 61 | character == 60 | character == 62 | character == 58 | character == 43 | character == 45 | character == 46 | character == 10 | character == 13) {
                        return (char) character;          // keep the same
                    } else
                        return 126;             // '~' for all the invalid characters
                }
            }
        }
    }


    /**
     * @param state the current state
     * @return Returns the value corresponding to [state,column] in the state transition table.
     * @Param column corresponding to input character in the transition table
     */
    public Integer lookupTable(int state, char column) {
        // reduce transitions in final state since they all go to state 1
        if (transition_table[state].isFinalState()) {
            return 1;
        }
        Integer next = transition_table[state].getTransitions().get(column);
        if (next != null) {
            return next;
        } else
            return 0;
    }

    /**
     * Creates and returns a structure that contains the token type, its location in the source code,
     * and its value (for literals), for the token kind corresponding to a state,
     * as found in the state transition table.
     *
     * @param state that represents a token
     * @return a Token object for writing to buffers
     */
    public Token createToken(int state) {
        int token_line = curr_line;   // record the line of the current token
        String type = transition_table[state].getState_name();
        String lexeme = curr_lexeme.toString().trim();

        // deal with operator
        if (type.equals("symbol")) {
            switch (lexeme) {
                case "+":
                    type = "plus";
                    break;
                case "*":
                    type = "mult";
                    break;
                case ".":
                    type = "dot";
                    break;
                case "|":
                    type = "or";
                    break;
                case "&":
                    type = "and";
                    break;
                case "!":
                    type = "not";
                    break;
                case "(":
                    type = "openpar";
                    break;
                case ")":
                    type = "closepar";
                    break;
                case "{":
                    type = "opencubr";
                    break;
                case "}":
                    type = "closecubr";
                    break;
                case "[":
                    type = "opensqbr";
                    break;
                case "]":
                    type = "closesqbr";
                    break;
                case ";":
                    type = "semi";
                    break;
                case ",":
                    type = "comma";
                    break;
            }
        }

        // checking for the reserved word if the type is ID
        if (type.equals("id")) {
            if (lexeme.equals("if") | lexeme.equals("then") | lexeme.equals("else") | lexeme.equals("integer")
                    | lexeme.equals("float") | lexeme.equals("void") | lexeme.equals("public")
                    | lexeme.equals("private") | lexeme.equals("func")  | lexeme.equals("struct")
                    | lexeme.equals("while") | lexeme.equals("read") | lexeme.equals("write") | lexeme.equals("return")
                    | lexeme.equals("inherits") | lexeme.equals("let") | lexeme.equals("impl")) {
                type = lexeme;
            }
        }

        // block comments
        if (type.equals("blockcmt") || type.equals("invalidcmt")) {
            lexeme = lexeme.replaceAll("\r\n|\n", "\\\\n");
            int num_line = 0;  // record the number of lines in comments
            int old_index = 0;
            int new_index;
            while ((new_index = lexeme.indexOf("\\n", old_index)) > -1) {
                num_line++;
                old_index = new_index + 2;
            }
            token_line = curr_line - num_line;
        }

        // create token
        curr_token = new Token(type, lexeme, token_line);
        if (type.contains("invalid")) {
            curr_token.setIs_error(true);
        }
        return curr_token;
    }
}

