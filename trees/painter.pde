import java.util.ArrayList;

class Painter {

    float turtle_x;
    float turtle_y;
    float turtle_z;
    float angle;
    float angle_increment;
    float walk_step;
    ArrayList<Float> state;
    ArrayList<Float> points;

    Painter(){
	    turtle_x = 0;
	    turtle_y = 0;
	    turtle_z = 0;
	    angle = 0;
	    angle_increment = (float) Math.PI / 6.0;
	    walk_step = 5;
        points = new ArrayList<Float>();
    }

    public void set_increment(){
            Random r = new Random();
            float lowerbound = (float) Math.PI / 7;
            float upperbound = (float) Math.PI / 6;
            angle_increment = lowerbound + r.nextFloat() * (upperbound - lowerbound);
    }

    public void save_state(){
        state = new ArrayList<Float>();
        state.add(turtle_x);
        state.add(turtle_y);
        state.add(turtle_z);
        state.add(angle);

    }

    public void load_state(){
        turtle_x = state.get(0);
        turtle_y = state.get(1);
        turtle_z = state.get(2);
        angle = state.get(3);
    }

    public void save_point(){
        points.add(turtle_x);
        points.add(turtle_y);
        points.add(turtle_z);
    }

    public float get_sin(float angle){
        return (float) Math.sin(angle);
    }


    public float get_cos(float angle){
        return (float) Math.cos(angle);
    }


    public ArrayList<Float> paint(String walk){
        float new_x;
        float new_y;
        float new_z;
        for(int i = 0; i < walk.length(); i++){
            char c = walk.charAt(i);
            if(c == 'X') continue;
            else if(c == 'F') {
                    save_point();
                    //calcular nova posição sem rotação
                    turtle_x += walk_step;
                    turtle_y += walk_step;
                    turtle_z += walk_step;
                    //rotacionar no eixo Y com o angulo
                    new_x = turtle_x * get_cos(angle) +
                            turtle_y * 0 +
                            turtle_z * get_sin(angle);
                    new_y = turtle_x * 0 +
                            turtle_y * 1 +
                            turtle_z * 0;
                    new_z = turtle_x * -get_sin(angle) +
                            turtle_y * 0 +
                            turtle_z * get_cos(angle);
                    turtle_x = new_x;
                    turtle_y = new_y;
                    turtle_z = new_z;
                    //rotacionar no eixo Z com o angulo
                    new_x = turtle_x * get_cos(angle) +
                            turtle_y * -get_sin(angle) +
                            turtle_z * 0;
                    new_y = turtle_x * get_sin(angle) +
                            turtle_y * get_cos(angle) +
                            turtle_z * 0;
                    new_z = turtle_x * 0 +
                            turtle_y * 0 +
                            turtle_z * 1;
                    turtle_x = new_x;
                    turtle_y = new_y;
                    turtle_z = new_z;
                    //salvar novo ponto
                    save_point();
            }
            else if(c == '[') save_state();
            else if(c == ']') {
                load_state();
            }
            else if(c == '+') {
                set_increment();
                angle += angle_increment;
            }
            else if(c == '-') {
                set_increment();
                angle -= angle_increment;
            }
        }
        return points;
    }

}
