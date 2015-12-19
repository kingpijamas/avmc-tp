

public class ejemplo {
    
    public static boolean canary$main$bs = false;

	public static boolean canary$main$as = false;

	public static boolean canary$wololoInt$d = false;

	public static boolean canary$wololoInt$c = false;

	public static boolean canary$wololoInt$a = false;

	/*@ ensures canary$wololoInt$a == false && canary$wololoInt$c == false && canary$wololoInt$d == false; @*/
	 public static int wololoInt(String foo){
        Double a=1.0;
        Double c=0.0;
        int d=0;
        String lola="lola";
        
        if (c == 0) {
			canary$wololoInt$c = true;
		} else {
			a = a / c;
		}
        
        System.out.println("pase por wololoInt del package lalo con "+foo);
        return 1;
    }
    
    /*@ ensures canary$main$as == false && canary$main$bs == false; @*/
	 public static void main(String[] args) {
        System.out.println("lalal");
        Double as=1.0;
        Double bs=0.0;
        if(as==10){
            System.out.println("lala dentro de if");
        }
        if (bs == 0) {
			canary$main$bs = true;
		} else {
			as = as / bs;
		}
        System.out.println(as);
    }
}
