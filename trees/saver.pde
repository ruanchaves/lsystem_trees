class Saver {

    String filename;
    PrintWriter output;

    Saver(String filename){
        this.filename = filename;
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
        String[] lines_array = lines.toArray(new String[lines.size()]);
        saveStrings(filename, lines_array);
    }

}
