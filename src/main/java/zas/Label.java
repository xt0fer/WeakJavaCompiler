package zas;

public class Label implements ZasLine {
    private String label;
    private String[] args;
    public Label(String d, String ...args) {
        this.label = d;
        this.args = args;
    }
    public String emit() {
        String line = String.format("%s:\t", label);
        for (String s : args) {
            line = line + s + " ";
        }
        return line;
    }
}
