package testing.examples;

//@ model import org.jmlspecs.lang.*;


public class ejemplo2 extends java.lang.Object {

  public static boolean canarywololoIntw = false;
  public class Wrapper extends java.lang.Object {

    int testing_examples_ejemplo2_Wrapper_value;

    public void printValue() {
      {
        int t_4;

        t_4 = this.testing_examples_ejemplo2_Wrapper_value;
        this.testing_examples_ejemplo2_Wrapper_value = this.testing_examples_ejemplo2_Wrapper_value + (byte)1;
      }
    }


    public Wrapper() {
      this.testing_examples_ejemplo2_Wrapper_value = 10;
    }

  }

  /*@ 
    @ requires testing.examples.ejemplo2.canarywololoIntw  ==  false;
    @ ensures testing.examples.ejemplo2.canarywololoIntw  ==  false;
    @*/
  public void wololoInt(testing.examples.ejemplo2.Wrapper w) {
    testing.examples.ejemplo2.Wrapper param_w_1;

    param_w_1 = w;
    {
      boolean t_3;

      t_3 = param_w_1  ==  null;
      if (t_3) {
        {
          {
            {
              {
                {
                  testing.examples.ejemplo2.canarywololoIntw = true;
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
                  param_w_1.printValue();
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
