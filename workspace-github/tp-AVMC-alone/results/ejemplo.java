

public class ejemplo {
    
    public static boolean canarymainbs = false;

	public static boolean canarymainas = false;

	public static boolean canarywololoIntd = false;

	public static boolean canarywololoIntc = false;

	public static boolean canarywololoInta = false;

	/*@ ensures canarywololoInta == false && canarywololoIntc == false && canarywololoIntd == false; @*/
	 public static int wololoInt(String foo){
        Double a=1.0;
        Double c=0.0;
        int d=0;
        String lola="lola";
        
        if (c == 0) {
			canarywololoIntc = true;
		} else {
			a = a / c;
		}
        
        System.out.println("pase por wololoInt del package lalo con "+foo);
        return 1;
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
