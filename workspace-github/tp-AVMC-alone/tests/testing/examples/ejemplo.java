package testing.examples;

public class ejemplo {
    
    public static boolean canarywololoIntd = false;

	public static boolean canarywololoIntc = false;

	public static boolean canarywololoInta = false;

	/*@ requires true && canarywololoInta == false && canarywololoIntc == false && canarywololoIntd == false;
	@ ensures canarywololoInta == false && canarywololoIntc == false && canarywololoIntd == false;@*/
	 public static int wololoInt(){
        int a=1;
        int c=1;
        int d=0;
        
        if (c == 0) {
			canarywololoIntc = true;
		} else {
			a = a / c;
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
