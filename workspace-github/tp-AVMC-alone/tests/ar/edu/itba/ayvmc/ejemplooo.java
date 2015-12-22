package ar.edu.itba.ayvmc;


//import java.lang.String;

public class ejemplooo {
    
 //   public static boolean canarymainbs = false;

 //   public static boolean canarymainas = false;

    public boolean canarywololoInti = false;

    /*@ requires true && canarywololoInti == false; 
      @ ensures canarywololoInti == false; @*/
     public void wololoInt(){
        int i= 0;
        if (i == 0) {
            canarywololoInti = true;
        } else {
            i=1;
        }
    }
    
//    /*@ ensures canarymainas == false && canarymainbs == false; @*/
//     public static void main(String[] args) {
////        System.out.println("lalal");
//        float as=1.0f;
//        float bs=0.0f;
//        if(as==10){
// //           System.out.println("lala dentro de if");
//        }
//        if (bs == 0) {
//            canarymainbs = true;
//        } else {
//            as = as / bs;
//        }
//        //System.out.println(as);
//    }
}