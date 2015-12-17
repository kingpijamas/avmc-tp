package ar.edu.itba.ayvmc;


public class ejemplooo {
    
    boolean canary$i = false;
    static boolean canary$as;
    static boolean canary$bs;
    
    /*@ ensures canary$i == false; @*/
	 public void add(String foo){
        /*boolean canary$i = false;*/ Integer i= null;
        if (i == null) {
			canary$i = true;
		} else {
			i.intValue();
		}
        
        return;
    }
    
    
    
	 public static void main(String[] args) {
        System.out.println("lalal");
        boolean canary$as = false; double as=1.0;
        boolean canary$bs = false; double bs=0.0;
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
