package syntaxAnalyser;

public class SemanticAction {
    private String sem_act_id;
    private String sem_act_LHS;
    private String sem_act_RHS;

    public SemanticAction(String sem_act_id, String sem_act_LHS, String sem_act_RHS) {
        this.sem_act_id = sem_act_id;
        this.sem_act_LHS = sem_act_LHS;
        this.sem_act_RHS = sem_act_RHS;
    }

    public String getSem_act_LHS() {
        return sem_act_LHS;
    }

    public String getSem_act_RHS() {
        return sem_act_RHS;
    }

    @Override
    public String toString() {
        return "SemanticAction{" +
                "sem_act_id='" + sem_act_id + '\'' +
                ", sem_act_LHS='" + sem_act_LHS + '\'' +
                ", sem_act_RHS='" + sem_act_RHS + '\'' +
                '}';
    }
}
