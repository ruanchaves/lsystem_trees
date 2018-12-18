import java.util.Random;
import java.util.Map;
import java.util.TreeMap;

String grass_path = "./models/grass/grass";
String tree_path = "./models/tree/tree";
String meta_path = "./models/meta/meta";
String ext = ".txt";
int limit = 1000;

void setup(){
    size(500,500, P3D);
    for(int i = 0; i < limit; i++){

        TreeMaker t = new TreeMaker();
        t.make_grass();
        int tree_size = t.size();
        Replacer r = new Replacer(tree_size, t.axiom, t.start_expr, t.end_expr);

        String result = r.generate();
        Analyzer a = new Analyzer(result);
        Map<Integer, String> mapping = a.build_tree();

        Painter p = new Painter();
        p.mapping = mapping;
        ArrayList<Float> points = p.paint(result);

        Thick th = new Thick();
        th.generate();

        String padded = String.format("%03d", i);
        Saver s = new Saver(grass_path + padded + ext);
        s.save(points);
        s = new Saver(meta_path + padded + ext);
        s.save_meta(mapping);
    }
    exit();
}

void draw(){
}
