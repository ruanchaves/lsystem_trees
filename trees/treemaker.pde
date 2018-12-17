import java.util.Random;

class TreeMaker {

    String axiom = "F";
    ArrayList<String> start_expr;
    ArrayList<String> end_expr;

    TreeMaker(){
        this.start_expr = new ArrayList<String>();
        this.end_expr = new ArrayList<String>();
        Random r = new Random();
        int choice = r.nextInt(3);
        switch(choice){
            case 0:
                tree1();
                break;
            case 1:
                tree2();
                break;
            case 2:
                tree3();
                break;
        }
    }

    public void build(String start_string, String end_string){
        start_expr.add(start_string);
        end_expr.add(end_string);
    }

    public void tree1(){
        build("F","F[+F]F[-F]F");
    }

    public void tree2(){
        build("F","F[+F]F[-F][F]");
    }

    public void tree3(){
        build("F","FF-[-F+F+F]+[+F-F-F]");
    }

    /* public void tree4(){ */
    /*     this.axiom = "X"; */
    /*     build("X", "F[+X][-X]FX"); */
    /*     build("F", "FF"); */
    /* } */

    /* public void tree5(){ */
    /*     this.axiom = "X"; */
    /*     build("X", "F-[[X]+X]+F[+FX]-X"); */
    /*     build("F","FF"); */
    /* } */


}
