package examples;

import ar.edu.itba.avmc.tp.annotations.Check;
import java.lang.String;

public class ejemplo2 {
    
    @Check("Arithmetic")
    public void wololoInt(){
        int as=1;
        int bs=1;
        if(as==7){
            as++;
        }
        as=as / bs;        
        
    }
    
   
}