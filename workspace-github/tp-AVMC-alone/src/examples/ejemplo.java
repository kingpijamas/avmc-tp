package examples;

import ar.edu.itba.avmc.tp.annotations.Check;

public class ejemplo {
    
    @Check("Arithmetic")
    public static int wololoInt(int c, int d){
        int a=1;
        //int c=0;
        //int d=0;
        
        d=d / c;
        
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