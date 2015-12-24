package testing.examples;

//@ model import org.jmlspecs.lang.*;


public class ejemplo extends java.lang.Object {

  public static boolean canarywololoIntd = false;
  public static boolean canarywololoIntc = false;
  public static boolean canarywololoInta = false;

  /*@ 
    @ requires testing.examples.ejemplo.canarywololoInta  ==  false && testing.examples.ejemplo.canarywololoIntc  ==  false && testing.examples.ejemplo.canarywololoIntd  ==  false;
    @ ensures testing.examples.ejemplo.canarywololoInta  ==  false && testing.examples.ejemplo.canarywololoIntc  ==  false && testing.examples.ejemplo.canarywololoIntd  ==  false;
    @*/
  public static int wololoInt() {
    {
      boolean t_8;
      int var_8_a = 1;
      int var_9_c = 1;
      int var_10_d = 0;

      t_8 = var_9_c  ==  0;
      if (t_8) {
        {
          {
            {
              {
                {
                  testing.examples.ejemplo.canarywololoIntc = true;
                }
              }
            }
          }
        }
      } else {
        {
          {
            {
              {
                {
                  var_8_a = var_8_a / var_9_c;
                }
              }
            }
          }
        }
      }

      return 1;
    }
  }


  public ejemplo() {
  }

}
