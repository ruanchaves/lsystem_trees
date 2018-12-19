import java.util.Random;
import java.util.HashMap;
import java.util.ArrayList;

class Replacer {

    String axiom;
    HashMap<String, ArrayList<String>> expr;
    int tree_size;
    String result;

    Replacer(TreeMaker t){
        this.axiom = t.axiom;
        this.expr = t.expr;
        this.tree_size = t.tree_size;
        generate();
    }

    public String get_random(String key){
        ArrayList<String> value = expr.get(key);
        if(value == null){
            return null;
        }
        else{
            Random rd = new Random();
            int chosen = rd.nextInt(value.size());
            return value.get(chosen);
        }
    }

    public void generate(){
        String result = axiom;
        for (int k = 0; k < this.tree_size; k++){
            for(String key: expr.keySet()){
                String value = get_random(key);
                if(value != null) result = result.replaceAll(key, value);
            }
        }
        this.result = result;
    }
}

