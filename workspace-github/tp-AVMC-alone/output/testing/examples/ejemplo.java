package testing.examples;

//@ model import org.jmlspecs.lang.*;


public class ejemplo extends java.lang.Object {

  public static boolean canarywololoIntd = false;

  /*@ 
    @ requires testing.examples.ejemplo.canarywololoIntd  ==  false;
    @ ensures testing.examples.ejemplo.canarywololoIntd  ==  false;
    @*/
  public static int wololoInt(java.lang.String foo) {
    java.lang.String param_foo_3;

    param_foo_3 = foo;
    {
      float var_6_a = 1.0F;
      float var_7_c = +0.0F;
      int var_8_d = 0;

      var_6_a = var_6_a / var_7_c;

      return 1;
    }
  }


  public ejemplo() {
  }

}
