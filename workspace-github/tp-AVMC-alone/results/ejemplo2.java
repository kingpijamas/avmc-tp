
import ar.edu.itba.avmc.tp.annotations.Check;

public class ejemplo2 {
    
    public static boolean canary$main$bs = false;

	public static boolean canary$main$as = false;

	public static boolean canary$wololoInt$i = false;

	/*@ ensures canary$i == false; @*/
	 public void wololoInt(String foo){
        Integer i= null;
        if (i == null) {
			canary$i = true;
		} else {
			i.intValue();
		}
        
        return;
    }
    
    /*@ ensures canary$as == false && canary$bs == false; @*/
	 public static void main(String[] args) {
        System.out.println("lalal");
        Double as=1.0;
        Double bs=0.0;
        if(as==10){
            System.out.println("lala dentro de if");
        }
        if (bs == null) {
			canary$bs = true;
		} else {
			as = as / bs;
		}
        System.out.println(as);
    }
}
