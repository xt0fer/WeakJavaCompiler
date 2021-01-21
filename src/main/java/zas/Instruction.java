package zas;

public class Instruction implements ZasLine {
    private String opcode;
    private String[] args;
    public Instruction(String d, String ...args) {
        this.opcode = d;
        this.args = args;
    }
    public String emit() {
        String line = String.format("\t%s ", opcode);
        for (String s : args) {
            line = line + s + " ";
        }
        return line;
    }
}
