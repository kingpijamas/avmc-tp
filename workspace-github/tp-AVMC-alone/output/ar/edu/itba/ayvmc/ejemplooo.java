package ar.edu.itba.ayvmc;

//@ model import org.jmlspecs.lang.*;


public class ejemplooo extends java.lang.Object {

  public boolean ar_edu_itba_ayvmc_ejemplooo_canarywololoInti;

  /*@ 
    @ requires this.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti  ==  false;
    @ ensures this.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti  ==  false;
    @*/
  public void wololoInt() {
    {
      boolean t_4;
      int var_4_i = 1;

      t_4 = var_4_i  ==  0;
      if (t_4) {
        {
          {
            {
              {
                {
                  this.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti = true;
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
                  var_4_i = 1;
                }
              }
            }
          }
        }
      }
    }
  }


  public ejemplooo() {
    this.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti = false;
  }

}
