
import ar.edu.itba.avmc.tp.annotations.Check;

public class ejemplo {
    
    @Check("Arithmetic")
    /*@ ensures canary$a == false  && canary$c == false  && canary$d == false ; @*/
	 public static int wololoInt(String foo){
        Boolean canary$a = false; Double a=1.0;
        Boolean canary$c = false; Double c=0.0;
        Boolean canary$d = false; int d=0;
        String lola="lola";
        
        if (c == 0) {
			canary$c = true;
		} else {
			a = a / c;
		}
        
        System.out.println("pase por wololoInt del package lalo con "+foo);
        return 1;
    }
    
    @Check("Arithmetic")
    /*@ ensures canary$a == false  && canary$b == false ; @*/
	 public static void main(String[] args) {
        System.out.println("lalal");
        Boolean canary$a = false; Double a=1.0;
        Boolean canary$b = false; Double b=0.0;
        if(a==10){
            System.out.println("lala dentro de if");
        }
        if (b == 0) {
			canary$b = true;
		} else {
			a = a / b;
		}
        System.out.println(a);
    }
}