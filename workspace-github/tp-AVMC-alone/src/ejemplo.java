
import ar.edu.itba.avmc.tp.annotations.Check;

public class ejemplo {
    
    @Check("Arithmetic")
    public static int wololoInt(String foo){
        Double a=1.0;
        Double c=0.0;
        a=a / c;
        
        System.out.println("pase por wololoInt del package lalo con "+foo);
        return 1;
    }
    
    @Check("Arithmetic")
    public static void main(String[] args) {
        System.out.println("lalal");
        Double a=1.0;
        Double b=0.0;
        if(a==10){
            System.out.println("lala dentro de if");
        }
        a=a / b;
        System.out.println(a);
    }
}