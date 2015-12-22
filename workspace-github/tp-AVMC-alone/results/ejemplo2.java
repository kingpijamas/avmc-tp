
import java.lang.String;

public class ejemplo2 {
    
    public static boolean canarymainbs = false;

	public static boolean canarymainas = false;

	public void wololoInt(String foo){
        Integer i= null;
        i.intValue();
        
        return;
    }
    
    /*@ ensures canarymainas == false && canarymainbs == false; @*/
	 public static void main(String[] args) {
        System.out.println("lalal");
        Double as=1.0;
        Double bs=0.0;
        if(as==10){
            System.out.println("lala dentro de if");
        }
        if (bs == 0) {
			canarymainbs = true;
		} else {
			as = as / bs;
		}
        System.out.println(as);
    }
}
