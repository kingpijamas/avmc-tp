package lalala;

import ar.edu.itba.avmc.tp.annotations.check;

public class lalaAnnotated {
    
    @check("Arithmetic")
    public void foo(String myParam) {
       System.out.println("This is " + myParam);
    }
 }