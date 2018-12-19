import java.util.ArrayList;
import java.util.Stack;
import java.util.Random;
import java.util.Map;
import java.util.TreeMap;

class Painter {

    Stack<Float> point_stack = new Stack<Float>();
    float turtle_x;
    float turtle_y;
    float turtle_z;
    float angle;
    float angle_increment;
    float walk_step;
    ArrayList<Float> points;

    Painter(){
	    turtle_x = 0;
	    turtle_y = 0;
	    turtle_z = 0;
	    angle = 0;
        Random rd = new Random();
        walk_step = 3 + rd.nextInt(3);
        float bottom = (float) Math.PI / 6.0;
        float upper = (float) Math.PI / 3.0;
        float angle_increment = bottom + rd.nextFloat() * ( upper - bottom );
        points = new ArrayList<Float>();
    }

    Painter(Replacer r){
       this();
       this.points = paint(r.result);
    }

    public float get_around(float value){
        Random rd = new Random();
        float bottom = 0.8 * value;
        float upper = value;
        return bottom + rd.nextFloat() * ( upper - bottom );
    }

    public void save_state(){
        point_stack.push(turtle_x);
        point_stack.push(turtle_y);
        point_stack.push(turtle_z);
        point_stack.push(angle);

    }

    public void load_state(){
        angle = point_stack.pop();
        turtle_z = point_stack.pop();
        turtle_y = point_stack.pop();
        turtle_x = point_stack.pop();
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

        float vector_x = 0;
        float vector_y = 1;
        float vector_z = 0;
        turtle_x = 0;
        turtle_y = 0;
        turtle_z = 0;

        for(int i = 0; i < walk.length(); i++){


            vector_x = 0;
            vector_y = 1;
            vector_z = 0;

            float tmp_x = vector_x;
            float tmp_y = vector_y;
            float tmp_z = vector_z;

            char c = walk.charAt(i);

            if(c == 'X') continue;
            else if(c == 'F') {
                    save_point();

                    //rotacionar no eixo Y com o angulo
                    vector_x = tmp_x * get_cos(angle) +
                            tmp_y * 0 +
                            tmp_z * get_sin(angle);
                    vector_y = tmp_x * 0 +
                            tmp_y * 1 +
                            tmp_z * 0;
                    vector_z = tmp_x * -get_sin(angle) +
                            tmp_y * 0 +
                            tmp_z * get_cos(angle);
                    tmp_x = vector_x;
                    tmp_y = vector_y;
                    tmp_z = vector_z;
                    //rotacionar no eixo Z com o angulo
                    vector_x = tmp_x * get_cos(angle) +
                            tmp_y * -get_sin(angle) +
                            tmp_z * 0;
                    vector_y = tmp_x * get_sin(angle) +
                            tmp_y * get_cos(angle) +
                            tmp_z * 0;
                    vector_z = tmp_x * 0 +
                            tmp_y * 0 +
                            tmp_z * 1;
                    tmp_x = vector_x;
                    tmp_y = vector_y;
                    tmp_z = vector_z;

                    vector_x *= walk_step;
                    vector_y *= walk_step;
                    vector_z *= walk_step;
                    turtle_x += vector_x;
                    turtle_y += vector_y;
                    turtle_z += vector_z;
                    save_point();
            }
            else if(c == '[') {
                save_state();
            }
            else if(c == ']') {
                load_state();
            }
            else if(c == '+') {
                angle += get_around(angle_increment);
            }
            else if(c == '-') {
                angle -= get_around(angle_increment);
            }
        }
        return points;
    }

}
