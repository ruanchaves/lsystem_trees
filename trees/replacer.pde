import java.util.Random;

class Replacer {

    String axiom;
    ArrayList<String> start_expr;
    ArrayList<String> end_expr;
    String result;
    int range;

    Replacer(int range, String axiom, ArrayList<String> start_expr, ArrayList<String> end_expr){
        this.range = range;
        this.start_expr = new ArrayList<String>();
        this.end_expr = new ArrayList<String>();
        for(String expr: start_expr){
            this.start_expr.add(expr);
        }
        for(String expr: end_expr){
            this.end_expr.add(expr);
        }
        this.axiom = axiom;
    }

    public String generate(){
        String result = axiom;
        for (int k = 0; k < this.range; k++){
	        for(String expr: start_expr){
                Random r = new Random();
                int i = r.nextInt(end_expr.size());
	            String target = end_expr.get(i);
	            result = result.replaceAll(expr,target);
	        }
        }
        return result;
    }

}

