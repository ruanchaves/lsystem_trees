class TreeMaker {

    String axiom = "X";
    ArrayList<String> start_expr;
    ArrayList<String> end_expr;

    TreeMaker(){
        this.start_expr = new ArrayList<String>();
        start_expr.add("F");
        start_expr.add("X");
        this.end_expr = new ArrayList<String>();
        end_expr.add("FF");
        end_expr.add("F-[[X]+X]+F[+FX]-X");

    }


}
