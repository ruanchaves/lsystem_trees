import java.util.Random;

String file_path = "./models/tree";
String ext = ".txt";
int limit = 3;

void setup(){
    size(500,500, P3D);
    for(int i = 0; i < limit; i++){
        TreeMaker t = new TreeMaker();
        Random rd = new Random();
        int tree_size = 3;
        Replacer r = new Replacer(tree_size, t.axiom, t.start_expr, t.end_expr);
        String result = r.generate();
        Painter p = new Painter();
        ArrayList<Float> points = p.paint(result);
        String padded = String.format("%03d", i);
        Saver s = new Saver(file_path + padded + ext);
        s.save(points);
    }
}

void draw(){
    background(204);
    String filename = "./models/tree000.txt";
    String[] lines = loadStrings(filename);
    Plotter plt = new Plotter(lines);
    plt.plot();
    plt.show();
}
