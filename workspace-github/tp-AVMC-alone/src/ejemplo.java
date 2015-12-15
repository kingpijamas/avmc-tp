
import ar.edu.itba.avmc.tp.annotations.Check;

public class ejemplo {
    
    @Check("Arithmetic")
    public static int wololoInt(String foo){
        Double a=1.0;
        Double c=0.0;
        int d=0;
        String lola="lola";
        
        a=a / c;
        
        System.out.println("pase por wololoInt del package lalo con "+foo);
        return 1;
    }
    
    @Check("Arithmetic")
    public static void main(String[] args) {
        System.out.println("lalal");
        Double as=1.0;
        Double bs=0.0;
        if(as==10){
            System.out.println("lala dentro de if");
        }
        as=as / bs;
        System.out.println(as);
    }
}