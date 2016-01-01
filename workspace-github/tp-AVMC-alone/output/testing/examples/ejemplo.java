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
    int param_c_4;

    param_c_4 = c;
    int param_d_5;

    param_d_5 = d;
    {
      boolean t_6;
      int var_2_a = 1;

      t_6 = param_c_4  ==  0;
      if (t_6) {
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
                  param_d_5 = param_d_5 / param_c_4;
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
