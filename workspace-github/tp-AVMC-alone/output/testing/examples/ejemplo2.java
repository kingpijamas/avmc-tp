package testing.examples;

//@ model import org.jmlspecs.lang.*;


public class ejemplo2 extends java.lang.Object {


  public void wololoInt() {
    {
      int t_1;
      java.lang.Integer var_1_i = ((java.lang.Integer)(null));

      t_1 = var_1_i.intValue();
    }
  }


  public static void main(java.lang.String[] args) {
    java.lang.String[] param_args_0;

    param_args_0 = args;
    {
      boolean t_3;
      float var_2_as = 1.0F;
      float var_3_bs = +0.0F;

      t_3 = var_2_as  ==  10.0F;

      if (t_3) {
        {
          {
            {
              {
                {
                  float t_2;

                  t_2 = var_2_as;
                  var_2_as = var_2_as + (byte)1;
                }
              }
            }
          }
        }
      }
      var_2_as = var_2_as / var_3_bs;
    }
  }


  public ejemplo2() {
  }

}
