package lexicalAnalyser;

import java.util.HashMap;
import java.util.Map;

/**
 * class for storing state attributes
 */
public class State {
    private final int state;
    private final Map<Character, Integer> transitions;
    private boolean is_final;
    private String state_name;
    private boolean is_backtracking;

    public State(int current_state) {
        this.state = current_state;
        transitions = new HashMap<>();
    }

    public State(int current_state, boolean is_final, String state_name, boolean is_backtracking) {
        this.state = current_state;
        transitions = new HashMap<>();
        this.is_final = is_final;
        this.state_name = state_name;
        this.is_backtracking = is_backtracking;
    }

    public String getState_name() {
        return state_name;
    }

    public boolean isBacktrack() {
        return is_backtracking;
    }

    public boolean isFinalState() {
        return is_final;
    }

    public Map<Character, Integer> getTransitions() {
        return transitions;
    }

    public void set_transition(char c, int i) {
        transitions.put(c, i);
    }



}
