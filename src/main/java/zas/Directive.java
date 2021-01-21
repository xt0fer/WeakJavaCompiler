package zas;

public class Directive implements ZasLine {
    private String directive;
    private String[] args;
    public Directive(String d, String ...args) {
        this.directive = d;
        this.args = args;
    }
    public String emit() {
        String line = String.format("%s\t", directive);
        for (String s : args) {
            line = line + s + " ";
        }
        return line;
    }
}
