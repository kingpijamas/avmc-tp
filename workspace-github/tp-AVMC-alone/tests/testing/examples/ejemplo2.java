package testing.examples;

import java.lang.String;

public class ejemplo2 {
    
    public static boolean canarywololoIntbs = false;

	public static boolean canarywololoIntas = false;

	/*@ requires true && canarywololoIntas == false && canarywololoIntbs == false;
	@ ensures canarywololoIntas == false && canarywololoIntbs == false;@*/
	 public void wololoInt(){
        int as=1;
        int bs=1;
        if(as==7){
            as++;
        }
        if (bs == 0) {
			canarywololoIntbs = true;
		} else {
			as = as / bs;
		}        
        
    }
    
   
}
