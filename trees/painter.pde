import java.util.ArrayList;
import java.util.Stack;

class Painter {

    Stack<Float> point_stack = new Stack<Float>();
    float turtle_x;
    float turtle_y;
    float turtle_z;
    float angle;
    float angle_increment;
    float lowerbound;
    float upperbound;
    float walk_step;
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
        angle_increment = (float) Math.PI / 6.0;
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
        float new_x;
        float new_y;
        float new_z;
        for(int i = 0; i < walk.length(); i++){
            char c = walk.charAt(i);
            if(c == 'X') continue;
            else if(c == 'F') {
                    save_point();
                    //calcular nova posição sem rotação
                    turtle_x += 0;
                    turtle_y += walk_step;
                    turtle_z += 0;
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
                    //rotacionar no eixo X com o angulo
                    /* new_x = turtle_x * 1 + */
                    /*         turtle_y * 0 + */
                    /*         turtle_z * 0; */
                    /* new_y = turtle_x * 0 + */
                    /*         turtle_y * get_cos(angle) + */
                    /*         turtle_z * -get_sin(angle); */
                    /* new_z = turtle_x * 0 + */
                    /*         turtle_y * get_sin(angle) + */
                    /*         turtle_z * get_cos(angle); */
                    //salvar novo ponto
                    save_point();
            }
            else if(c == '[') {
                save_state();
            }
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
