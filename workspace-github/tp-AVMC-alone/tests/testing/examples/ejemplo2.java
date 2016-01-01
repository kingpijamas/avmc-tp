package testing.examples;

import java.lang.String;

public class ejemplo2 {
    
    public static boolean canarywololoIntw = false;

	/*@ requires true && canarywololoIntw == false;
	@ ensures canarywololoIntw == false;@*/
	 public void wololoInt(Wrapper w){
        
//        Wrapper w = new Wrapper();
        
        if (w == null) {
			canarywololoIntw = true;
		} else {
			w.printValue();
		}
        
    }
 
    public class Wrapper {
        
        int value = 10;
        
        public void printValue(){
            value++;
        }
    }   
   
}

