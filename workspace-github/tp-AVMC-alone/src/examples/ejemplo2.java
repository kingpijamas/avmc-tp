package examples;

import ar.edu.itba.avmc.tp.annotations.Check;
import java.lang.String;

public class ejemplo2 {
    
    @Check("NullPointer")
    public void wololoInt(Wrapper w){
        
//        Wrapper w = new Wrapper();
        
        w.printValue();
        
    }
 
    public class Wrapper {
        
        int value = 10;
        
        public void printValue(){
            value++;
        }
    }   
   
}

