package examples;

import ar.edu.itba.avmc.tp.annotations.Check;
import java.lang.String;

public class ejemplo2 {
    
    @Check("Arithmetic")
    public void wololoInt(){
        Integer i= null;
        i.intValue();
        
    }
    
    @Check("Arithmetic")
    public static void main(String[] args) {
        float as=1.0f;
        float bs=0.0f;
        if(as==10){
            as++;
        }
        as=as / bs;
    }
}