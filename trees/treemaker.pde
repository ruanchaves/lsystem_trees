import java.util.Random;
import java.util.HashMap;
import java.util.ArrayList;

class TreeMaker {

    String axiom;
    HashMap<String, ArrayList<String>> expr;
    int tree_size;

    public int size(){
        return tree_size;
    }

    public void build(String key, String value){
        ArrayList<String> arr = new ArrayList<String>();
        if( expr.containsKey(key) ) arr = expr.get(key);
        arr.add(value);
        expr.put(key, arr);
    }

    TreeMaker(int choice, int tree_size){
        this.expr = new HashMap<String, ArrayList<String>>();
        this.tree_size = tree_size;
        switch(choice){
            case 0:
                tree0();
                break;
            case 1:
                tree1();
                break;
            case 2:
                tree2();
                break;
            case 3:
                tree3();
                break;
            case 4:
                tree4();
                break;
            case 5:
                tree5();
                break;
            case 6:
                tree6();
                break;
            default:
                tree0();
                break;
        }
    }

    public void tree0(){
        this.axiom = "F";
        build("F","F[+F]F[-F]F");
        build("F","F[-F]F[-F]F");
    }

    public void tree1(){
        this.axiom = "F";
        build("F","F[+F]F[-F][F]");
        build("F","F[-F]F[-F][F]");
    }

    public void tree2(){
        this.axiom = "F";
        build("F","FF-[-F+F+F]+[+F-F-F]");
        build("F","FF+[-F+F+F]+[+F-F-F]");
    }

    public void tree3(){
        this.axiom = "X";
        build("X", "F[+X]F[-X]+X");
        build("X", "F[-X]F[-X]+X");
        build("F", "FF");
    }

    public void tree4(){
        this.axiom = "X";
        build("X", "F[+X][-X]FX");
        build("X", "F[-X][-X]FX");
        build("F","FF");
    }

    public void tree5(){
        this.axiom = "X";
        build("X","F-[[X]+X]+F[+FX]-X");
        build("X","F+[[X]+X]+F[+FX]-X");
        build("F","FF");
    }

    public void tree6(){
        this.axiom = "F";
        build("F", "F[+F]F[-F]+F");
        build("F", "F[+F]F");
        build("F","F[-F]F");
    }

}
