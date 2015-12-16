package ar.edu.itba.ayvmc;

//@ model import org.jmlspecs.lang.*;


public class BinTreeBug extends java.lang.Object {

  public /*@ nullable @*/ ar.edu.itba.ayvmc.NodeBTBug ar_edu_itba_ayvmc_BinTreeBug_root;
  public int ar_edu_itba_ayvmc_BinTreeBug_intendedSize;
  /*@ invariant (\forall ar.edu.itba.ayvmc.NodeBTBug n; \reach(this.ar_edu_itba_ayvmc_BinTreeBug_root, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n))); \reach(n.ar_edu_itba_ayvmc_NodeBTBug_left, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n)))  ==  false);
    @*/
  /*@ invariant (\forall ar.edu.itba.ayvmc.NodeBTBug n; \reach(this.ar_edu_itba_ayvmc_BinTreeBug_root, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n))); \reach(n.ar_edu_itba_ayvmc_NodeBTBug_right, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n)))  ==  false);
    @*/
  /*@ invariant (\forall ar.edu.itba.ayvmc.NodeBTBug n; \reach(this.ar_edu_itba_ayvmc_BinTreeBug_root, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n))); (\forall ar.edu.itba.ayvmc.NodeBTBug m; \reach(n.ar_edu_itba_ayvmc_NodeBTBug_right, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(m))); m.ar_edu_itba_ayvmc_NodeBTBug_value  >=  n.ar_edu_itba_ayvmc_NodeBTBug_value));
    @*/
  /*@ invariant (\forall ar.edu.itba.ayvmc.NodeBTBug n; \reach(this.ar_edu_itba_ayvmc_BinTreeBug_root, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n))); (\forall ar.edu.itba.ayvmc.NodeBTBug m; \reach(n.ar_edu_itba_ayvmc_NodeBTBug_left, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(m))); m.ar_edu_itba_ayvmc_NodeBTBug_value  <  n.ar_edu_itba_ayvmc_NodeBTBug_value));
    @*/

  public BinTreeBug() {
    this.ar_edu_itba_ayvmc_BinTreeBug_root = ((ar.edu.itba.ayvmc.NodeBTBug)(null));
    this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize = 0;
    {
      this.ar_edu_itba_ayvmc_BinTreeBug_root = ((ar.edu.itba.ayvmc.NodeBTBug)(null));
    }
  }


  /*@ 
    @ requires true;
    @ ensures \result  ==  \reach(this.ar_edu_itba_ayvmc_BinTreeBug_root, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).int_size();
    @*/
  public int getSize() {
    {
      int t_37;

      t_37 = this.getTreeSize(this.ar_edu_itba_ayvmc_BinTreeBug_root);

      return t_37;
    }
  }


  public int getTreeSize(ar.edu.itba.ayvmc.NodeBTBug n) {
    ar.edu.itba.ayvmc.NodeBTBug param_n_4;

    param_n_4 = n;
    {
      boolean t_38;
      boolean t_39;
      boolean t_40;
      boolean t_41;
      boolean t_44;
      boolean t_47;
      int t_48;
      int t_49;
      int t_50;
      int t_51;

      t_38 = param_n_4  ==  null;

      if (t_38) {
        {
          {
            {
              {
                {
                  return 0;
                }
              }
            }
          }
        }
      }
      t_40 = n.ar_edu_itba_ayvmc_NodeBTBug_left  ==  null;

      if (t_40) {
        {
          {
            t_41 = n.ar_edu_itba_ayvmc_NodeBTBug_right  ==  null;
            if (t_41) {
              {
                t_39 = true;
              }
            } else {
              {
                t_39 = false;
              }
            }
          }
        }
      } else {
        {
          t_39 = false;
        }
      }

      if (t_39) {
        {
          {
            {
              {
                {
                  return 1;
                }
              }
            }
          }
        }
      }
      t_44 = n.ar_edu_itba_ayvmc_NodeBTBug_left  ==  null;

      if (t_44) {
        {
          {
            {
              {
                {
                  int t_42;
                  int t_43;

                  t_42 = this.getTreeSize(n.ar_edu_itba_ayvmc_NodeBTBug_right);
                  t_43 = 1 + t_42;

                  return t_43;
                }
              }
            }
          }
        }
      }
      t_47 = n.ar_edu_itba_ayvmc_NodeBTBug_right  ==  null;

      if (t_47) {
        {
          {
            {
              {
                {
                  int t_45;
                  int t_46;

                  t_45 = this.getTreeSize(n.ar_edu_itba_ayvmc_NodeBTBug_left);
                  t_46 = 1 + t_45;

                  return t_46;
                }
              }
            }
          }
        }
      }
      t_48 = this.getTreeSize(n.ar_edu_itba_ayvmc_NodeBTBug_left);
      t_49 = 1 + t_48;
      t_50 = this.getTreeSize(n.ar_edu_itba_ayvmc_NodeBTBug_right);
      t_51 = t_49 + t_50;

      return t_51;
    }
  }


  /*@ 
    @ requires \reach(this.ar_edu_itba_ayvmc_BinTreeBug_root, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n)))  ==  false;
    @ requires n.ar_edu_itba_ayvmc_NodeBTBug_left  ==  null && n.ar_edu_itba_ayvmc_NodeBTBug_right  ==  null && n.ar_edu_itba_ayvmc_NodeBTBug_value  ==  0;
    @ ensures true;
    @*/
  public void add(int x, ar.edu.itba.ayvmc.NodeBTBug n) {
    int param_x_5;

    param_x_5 = x;
    ar.edu.itba.ayvmc.NodeBTBug param_n_6;

    param_n_6 = n;
    {
      boolean t_58;
      ar.edu.itba.ayvmc.NodeBTBug var_9_current = this.ar_edu_itba_ayvmc_BinTreeBug_root;

      t_58 = this.ar_edu_itba_ayvmc_BinTreeBug_root  ==  null;
      if (t_58) {
        {
          {
            {
              {
                {
                  int t_52;

                  this.ar_edu_itba_ayvmc_BinTreeBug_root = param_n_6;
                  this.ar_edu_itba_ayvmc_BinTreeBug_root.ar_edu_itba_ayvmc_NodeBTBug_value = param_x_5;
                  t_52 = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize;
                  this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize + (byte)1;
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
                  boolean var_10_ws_4;

                  var_10_ws_4 = var_9_current.ar_edu_itba_ayvmc_NodeBTBug_value  !=  param_x_5;
                  while (var_10_ws_4) {
                    boolean t_57;

                    t_57 = param_x_5  <  var_9_current.ar_edu_itba_ayvmc_NodeBTBug_value;

                    if (t_57) {
                      {
                        {
                          {
                            {
                              {
                                boolean t_54;

                                t_54 = var_9_current.ar_edu_itba_ayvmc_NodeBTBug_left  ==  null;
                                if (t_54) {
                                  {
                                    {
                                      {
                                        {
                                          {
                                            int t_53;

                                            var_9_current.ar_edu_itba_ayvmc_NodeBTBug_left = param_n_6;
                                            var_9_current.ar_edu_itba_ayvmc_NodeBTBug_left.ar_edu_itba_ayvmc_NodeBTBug_value = param_x_5;
                                            t_53 = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize;
                                            this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize + (byte)1;
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
                                            var_9_current = var_9_current.ar_edu_itba_ayvmc_NodeBTBug_left;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
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
                                boolean t_56;

                                t_56 = var_9_current.ar_edu_itba_ayvmc_NodeBTBug_right  ==  null;
                                if (t_56) {
                                  {
                                    {
                                      {
                                        {
                                          {
                                            int t_55;

                                            var_9_current.ar_edu_itba_ayvmc_NodeBTBug_right = param_n_6;
                                            var_9_current.ar_edu_itba_ayvmc_NodeBTBug_right.ar_edu_itba_ayvmc_NodeBTBug_value = param_x_5;
                                            t_55 = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize;
                                            this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize + (byte)1;
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
                                            var_9_current = var_9_current.ar_edu_itba_ayvmc_NodeBTBug_right;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                    var_10_ws_4 = var_9_current.ar_edu_itba_ayvmc_NodeBTBug_value  !=  param_x_5;
                  }
                }
              }
            }
          }
        }
      }
    }
  }


  /*@ 
    @ requires (\exists ar.edu.itba.ayvmc.NodeBTBug n; \reach(this.ar_edu_itba_ayvmc_BinTreeBug_root, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n)))  ==  true; n.ar_edu_itba_ayvmc_NodeBTBug_value  ==  x);
    @ ensures (\forall ar.edu.itba.ayvmc.NodeBTBug n; \reach(this.ar_edu_itba_ayvmc_BinTreeBug_root, ar.edu.itba.ayvmc.NodeBTBug, ar_edu_itba_ayvmc_NodeBTBug_right + ar_edu_itba_ayvmc_NodeBTBug_left).has(((java.lang.Object)(n)))  ==  true; n.ar_edu_itba_ayvmc_NodeBTBug_value  !=  x);
    @*/
  public boolean remove(int x) {
    int param_x_7;

    param_x_7 = x;
    {
      ar.edu.itba.ayvmc.NodeBTBug var_11_current = this.ar_edu_itba_ayvmc_BinTreeBug_root;
      ar.edu.itba.ayvmc.NodeBTBug var_12_parent = ((ar.edu.itba.ayvmc.NodeBTBug)(null));
      boolean var_13_branch = true;
      boolean var_14_ws_6;

      var_14_ws_6 = var_11_current  !=  null;
      while (var_14_ws_6) {
        boolean t_71;
        boolean t_72;

        t_71 = var_11_current.ar_edu_itba_ayvmc_NodeBTBug_value  ==  param_x_7;

        if (t_71) {
          {
            {
              {
                {
                  {
                    boolean t_59;
                    boolean t_60;
                    boolean t_61;
                    boolean t_67;
                    boolean t_68;
                    boolean t_69;
                    int t_70;
                    ar.edu.itba.ayvmc.NodeBTBug var_15_bigson = var_11_current;
                    boolean var_16_ws_5;

                    t_60 = var_15_bigson.ar_edu_itba_ayvmc_NodeBTBug_left  !=  null;

                    if (t_60) {
                      {
                        t_59 = true;
                      }
                    } else {
                      {
                        {
                          t_61 = var_15_bigson.ar_edu_itba_ayvmc_NodeBTBug_right  !=  null;
                          if (t_61) {
                            {
                              t_59 = true;
                            }
                          } else {
                            {
                              t_59 = false;
                            }
                          }
                        }
                      }
                    }
                    var_16_ws_5 = t_59;
                    while (var_16_ws_5) {
                      boolean t_62;
                      boolean t_63;
                      boolean t_64;
                      boolean t_65;

                      var_12_parent = var_15_bigson;
                      t_62 = var_15_bigson.ar_edu_itba_ayvmc_NodeBTBug_right  !=  null;

                      if (t_62) {
                        {
                          {
                            {
                              {
                                {
                                  var_15_bigson = var_15_bigson.ar_edu_itba_ayvmc_NodeBTBug_right;
                                  var_13_branch = false;
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
                                  var_15_bigson = var_15_bigson.ar_edu_itba_ayvmc_NodeBTBug_left;
                                  var_13_branch = true;
                                }
                              }
                            }
                          }
                        }
                      }
                      t_64 = var_15_bigson.ar_edu_itba_ayvmc_NodeBTBug_left  !=  null;

                      if (t_64) {
                        {
                          t_63 = true;
                        }
                      } else {
                        {
                          {
                            t_65 = var_15_bigson.ar_edu_itba_ayvmc_NodeBTBug_right  !=  null;
                            if (t_65) {
                              {
                                t_63 = true;
                              }
                            } else {
                              {
                                t_63 = false;
                              }
                            }
                          }
                        }
                      }
                      var_16_ws_5 = t_63;
                    }
                    t_67 = var_15_bigson  ==  this.ar_edu_itba_ayvmc_BinTreeBug_root;

                    if (t_67) {
                      {
                        {
                          {
                            {
                              {
                                int t_66;

                                this.ar_edu_itba_ayvmc_BinTreeBug_root = ((ar.edu.itba.ayvmc.NodeBTBug)(null));
                                t_66 = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize;
                                this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize + (byte)-1;

                                return true;
                              }
                            }
                          }
                        }
                      }
                    }
                    t_68 = var_12_parent  !=  null;

                    if (t_68) {
                      {
                        {
                          {
                            {
                              {
                                if (var_13_branch) {
                                  {
                                    {
                                      {
                                        {
                                          {
                                            var_12_parent.ar_edu_itba_ayvmc_NodeBTBug_left = ((ar.edu.itba.ayvmc.NodeBTBug)(null));
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
                                            var_12_parent.ar_edu_itba_ayvmc_NodeBTBug_right = ((ar.edu.itba.ayvmc.NodeBTBug)(null));
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                    t_69 = var_15_bigson  !=  var_11_current;

                    if (t_69) {
                      {
                        {
                          {
                            {
                              {
                                var_11_current.ar_edu_itba_ayvmc_NodeBTBug_value = var_15_bigson.ar_edu_itba_ayvmc_NodeBTBug_value;
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
                              }
                            }
                          }
                        }
                      }
                    }
                    t_70 = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize;
                    this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize = this.ar_edu_itba_ayvmc_BinTreeBug_intendedSize + (byte)-1;

                    return true;
                  }
                }
              }
            }
          }
        }
        var_12_parent = var_11_current;
        t_72 = var_11_current.ar_edu_itba_ayvmc_NodeBTBug_value  >  param_x_7;

        if (t_72) {
          {
            {
              {
                {
                  {
                    var_11_current = var_11_current.ar_edu_itba_ayvmc_NodeBTBug_left;
                    var_13_branch = true;
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
                    var_11_current = var_11_current.ar_edu_itba_ayvmc_NodeBTBug_right;
                    var_13_branch = false;
                  }
                }
              }
            }
          }
        }
        var_14_ws_6 = var_11_current  !=  null;
      }

      return false;
    }
  }

}
