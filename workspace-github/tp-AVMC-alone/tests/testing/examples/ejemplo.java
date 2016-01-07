package testing.examples;

public class ejemplo {
    
    public static boolean canarywololoInta = false;

	public static boolean canarywololoIntd = false;

	public static boolean canarywololoIntc = false;

	/*@ requires true && canarywololoIntc == false && canarywololoIntd == false && canarywololoInta == false;
	@ ensures canarywololoIntc == false && canarywololoIntd == false && canarywololoInta == false;@*/
	 public static int wololoInt(int c, int d){
        int a=1;
//        if (c == 0 || d == 0) {
//        	return -1;
//        }
        //int c=0;
        //int d=0;
        
        if (c == 0) {
			canarywololoIntc = true;
		} else {
			d = d / c;
		}
        
        return 1;
    }
    
/*    @Check("Arithmetic")
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
*/
}
