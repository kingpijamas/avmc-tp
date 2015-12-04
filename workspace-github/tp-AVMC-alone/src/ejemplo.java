
import ar.edu.itba.avmc.tp.annotations.check;

public class ejemplo {
    
    @check("Arithmetic")
    public static int wololoInt(String foo){
        Double a=1.0;
        Double b=0.0;
        a=a / b;
        
        System.out.println("pase por wololoInt del package lalo con "+foo);
        return 1;
    }
    
    public static void main(String[] args) {
        System.out.println("lalal");
        Double a=1.0;
        Double b=0.0;
        a=a / b;
        System.out.println(a);
    }
}