
import ar.edu.itba.avmc.tp.annotations.Check;

public class ejemplo {
    
    public static boolean canary$main$bs = false;

	public static boolean canary$main$as = false;

	public static boolean canary$wololoInt$d = false;

	public static boolean canary$wololoInt$c = false;

	public static boolean canary$wololoInt$a = false;

	/*@ ensures canary$a == false && canary$c == false && canary$d == false; @*/
	 public static int wololoInt(String foo){
        Double a=1.0;
        Double c=0.0;
        int d=0;
        String lola="lola";
        
        if (c == 0) {
			canary$c = true;
		} else {
			a = a / c;
		}
        
        System.out.println("pase por wololoInt del package lalo con "+foo);
        return 1;
    }
    
    /*@ ensures canary$as == false && canary$bs == false; @*/
	 public static void main(String[] args) {
        System.out.println("lalal");
        Double as=1.0;
        Double bs=0.0;
        if(as==10){
            System.out.println("lala dentro de if");
        }
        if (bs == 0) {
			canary$bs = true;
		} else {
			as = as / bs;
		}
        System.out.println(as);
    }
}
