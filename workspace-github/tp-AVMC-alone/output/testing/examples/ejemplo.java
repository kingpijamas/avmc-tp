package testing.examples;

//@ model import org.jmlspecs.lang.*;


public class ejemplo extends java.lang.Object {

  public static boolean canarywololoInta = false;
  public static boolean canarywololoIntd = false;
  public static boolean canarywololoIntc = false;

  /*@ 
    @ requires testing.examples.ejemplo.canarywololoIntc  ==  false && testing.examples.ejemplo.canarywololoIntd  ==  false && testing.examples.ejemplo.canarywololoInta  ==  false;
    @ ensures testing.examples.ejemplo.canarywololoIntc  ==  false && testing.examples.ejemplo.canarywololoIntd  ==  false && testing.examples.ejemplo.canarywololoInta  ==  false;
    @*/
  public static int wololoInt(int c, int d) {
    int param_c_2;

    param_c_2 = c;
    int param_d_3;

    param_d_3 = d;
    {
      boolean t_8;
      int var_6_a = 1;

      t_8 = param_c_2  ==  0;
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
                  param_d_3 = param_d_3 / param_c_2;
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
