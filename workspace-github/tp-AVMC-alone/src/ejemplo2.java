
import ar.edu.itba.avmc.tp.annotations.Check;
import java.lang.String;

public class ejemplo2 {
    
    @Check("Arithmetic")
    public void wololoInt(String foo){
        Integer i= null;
        i.intValue();
        
        return;
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