

public class ejemplo {
    
    public static boolean canarywololoIntd = false;

	/*@ requires true && canarywololoIntd == false;
	@ ensures canarywololoIntd == false;@*/
	 public static int wololoInt(String foo){
        float a=1.0f;
        float c=0.0f;
        int d=0;
        
        a=a / c;
        
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
