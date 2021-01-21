package zas;

import java.util.ArrayList;

public class CodeList extends ArrayList<ZasLine> {

    public void emitAll() {
        this.forEach((z) -> System.out.println(z.emit()));
    }
}
