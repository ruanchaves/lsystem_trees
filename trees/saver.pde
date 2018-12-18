import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

class Saver {

    String filename;
    PrintWriter output;

    Saver(String filename){
        this.filename = filename;
    }

    public void dump(String filename, ArrayList<String> lines){
        String[] lines_array = lines.toArray(new String[lines.size()]);
        saveStrings(filename, lines_array);
    }

    public void save_meta(Map<Integer,String> mapping){
        ArrayList<String> lines = new ArrayList<String>();
        for( Map.Entry<Integer,String> entry : mapping.entrySet()){
            int int_key = entry.getKey();
            if(int_key < 0) continue;
            String key = Integer.toString(int_key);
            String value = entry.getValue();
            String line = key + " " + value;
            lines.add(line);
        }
        dump(filename, lines);
    }

    public void save(ArrayList<Float> points){
        float x;
        float y;
        float z;
        ArrayList<String> lines = new ArrayList<String>();
        for(int i = 0; i < points.size(); i += 3){
            x = points.get(i);
            y = points.get(i+1);
            z = points.get(i+2);
            String line = x + " " + y + " " + z;
            lines.add(line);
        }
        dump(filename, lines);
    }

}
