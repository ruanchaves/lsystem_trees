import java.util.Random;
import java.util.Map;
import java.util.TreeMap;

String grass_path = "./models/grass/grass";
String tree_path = "./models/tree/tree";
String meta_path = "./models/meta/meta";
String ext = ".txt";
int limit = 10;

void setup(){
    for(int i = 0; i < limit; i++){

        Random rd = new Random();
        int tree_size = 3 + rd.nextInt(4);
        int choice = rd.nextInt(7);
        TreeMaker t = new TreeMaker(tree_size, choice);
        Replacer r = new Replacer(t);
        Analyzer a = new Analyzer(r);
        Painter p = new Painter(r);
        p.paint();
        Saver s = new Saver(a,p);

        String padded = String.format("%03d", i);
        s.set_path(tree_path + padded + ext);
        s.save();
    }
    exit();
}

void draw(){
}
