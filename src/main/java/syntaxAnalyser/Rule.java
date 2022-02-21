package syntaxAnalyser;

public class Rule {
    private String rule_id;
    private String rule_LHS;
    private String rule_RHS;

    /**
     * constructors
     */
    public Rule() {
    }

    public Rule(String rule_id, String rule_LHS, String rule_RHS) {
        this.rule_id = rule_id;
        this.rule_LHS = rule_LHS;
        this.rule_RHS = rule_RHS;
    }

    /**
     * setter and getters for rule ID
     * @return rule which is a string
     */
    public String getRule_id() {
        return rule_id;
    }

    public void setRule_id(String rule_id) {
        this.rule_id = rule_id;
    }

    /**
     * setter and getters for rule LHS
     * @return rule_LHS which is a string
     */
    public String getRule_LHS() {
        return rule_LHS;
    }

    public void setRule_LHS(String rule_LHS) {
        this.rule_LHS = rule_LHS;
    }

    /**
     * setter and getters for rule RHS
     * @return rule_RHS which is a string
     */
    public String getRule_RHS() {
        return rule_RHS;
    }

    public void setRule_RHS(String rule_RHS) {
        this.rule_RHS = rule_RHS;
    }

    /**
     * toString method to return the strong
     * @return rule which is a string
     */
    @Override
    public String toString() {
        return "Rule{" +
                "rule_id='" + rule_id + '\'' +
                ", rule_LHS='" + rule_LHS + '\'' +
                ", rule_RHS='" + rule_RHS + '\'' +
                '}';
    }
}
