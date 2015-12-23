package lalala.lololo;

import ar.edu.itba.avmc.tp.annotations.Check;

public class lalaAnnotated {
    
    @Check("Arithmetic")
    public void foo(String myParam) {
       System.out.println("This is " + myParam);
    }
 }