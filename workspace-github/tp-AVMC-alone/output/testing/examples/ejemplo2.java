package testing.examples;

//@ model import org.jmlspecs.lang.*;


public class ejemplo2 extends java.lang.Object {

  public static boolean canarywololoIntbs = false;
  public static boolean canarywololoIntas = false;

  /*@ 
    @ requires testing.examples.ejemplo2.canarywololoIntas  ==  false && testing.examples.ejemplo2.canarywololoIntbs  ==  false;
    @ ensures testing.examples.ejemplo2.canarywololoIntas  ==  false && testing.examples.ejemplo2.canarywololoIntbs  ==  false;
    @*/
  public void wololoInt() {
    {
      boolean t_5;
      boolean t_6;
      int var_3_as = 1;
      int var_4_bs = 1;

      t_5 = var_3_as  ==  7;

      if (t_5) {
        {
          {
            {
              {
                {
                  int t_4;

                  t_4 = var_3_as;
                  var_3_as = var_3_as + (byte)1;
                }
              }
            }
          }
        }
      }
      t_6 = var_4_bs  ==  0;
      if (t_6) {
        {
          {
            {
              {
                {
                  testing.examples.ejemplo2.canarywololoIntbs = true;
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
                  var_3_as = var_3_as / var_4_bs;
                }
              }
            }
          }
        }
      }
    }
  }


  public ejemplo2() {
  }

}
