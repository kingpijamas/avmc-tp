package examples;

//@ model import org.jmlspecs.lang.*;


public class ejemplo extends java.lang.Object {

  public static boolean canarywololoIntd = false;

  /*@ 
    @ requires examples.ejemplo.canarywololoIntd  ==  false;
    @ ensures examples.ejemplo.canarywololoIntd  ==  false;
    @*/
  public static int wololoInt(java.lang.String foo) {
    java.lang.String param_foo_3;

    param_foo_3 = foo;
    {
      float var_3_a = 1.0F;
      float var_4_c = +0.0F;
      int var_5_d = 0;

      var_3_a = var_3_a / var_4_c;

      return 1;
    }
  }


  public ejemplo() {
  }

}
