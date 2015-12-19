
import java.lang.String;

public class ejemplo2 {
    
    public static boolean canary$main$bs = false;

	public static boolean canary$main$as = false;

	public static boolean canary$wololoInt$i = false;

	/*@ ensures canary$wololoInt$i == false; @*/
	 public void wololoInt(String foo){
        Integer i= null;
        if (i == null) {
			canary$wololoInt$i = true;
		} else {
			i.intValue();
		}
        
        return;
    }
    
    /*@ ensures canary$main$as == false && canary$main$bs == false; @*/
	 public static void main(String[] args) {
        System.out.println("lalal");
        Double as=1.0;
        Double bs=0.0;
        if(as==10){
            System.out.println("lala dentro de if");
        }
        if (bs == null) {
			canary$main$bs = true;
		} else {
			as = as / bs;
		}
        System.out.println(as);
    }
}
