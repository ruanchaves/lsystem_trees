class TreeMaker {

    String axiom = "X";
    ArrayList<String> start_expr;
    ArrayList<String> end_expr;

    TreeMaker(){
        this.start_expr = new ArrayList<String>();
        start_expr.add("F");
        this.end_expr = new ArrayList<String>();
        end_expr.add("F[+F]F[-F][F]");
    }


}
