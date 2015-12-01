package roops.core.objects;

//@ model import org.jmlspecs.lang.*;

/** SinglyLinkedListInsertBackBug9x12Ix8I
*/
public class SinglyLinkedList extends java.lang.Object {

  public /*@ nullable @*/ roops.core.objects.SinglyLinkedListNode roops_core_objects_SinglyLinkedList_header;
  /*@ invariant (\forall roops.core.objects.SinglyLinkedListNode n; \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).has(((java.lang.Object)(n))); \reach(n.roops_core_objects_SinglyLinkedListNode_next, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).has(((java.lang.Object)(n)))  ==  false);
    @*/

  public SinglyLinkedList() {
    this.roops_core_objects_SinglyLinkedList_header = ((roops.core.objects.SinglyLinkedListNode)(null));
    {
    }
  }


  /*@ 
    @ requires true;
    @ ensures (\exists roops.core.objects.SinglyLinkedListNode n; \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).has(((java.lang.Object)(n))); n.roops_core_objects_SinglyLinkedListNode_value  ==  valueParam) ==> (\result  ==  true);
    @ ensures (\result  ==  true) ==> (\exists roops.core.objects.SinglyLinkedListNode n; \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).has(((java.lang.Object)(n))); n.roops_core_objects_SinglyLinkedListNode_value  ==  valueParam);
    @ signals (java.lang.RuntimeException e) false;
    @*/
  public boolean contains(/*@ nullable @*/ java.lang.Object valueParam) {
    java.lang.Object param_valueParam_600;

    param_valueParam_600 = valueParam;
    {
      boolean t_1744;
      boolean t_1745;
      boolean t_1746;
      roops.core.objects.SinglyLinkedListNode var_833_current;
      boolean var_834_result;

      var_833_current = this.roops_core_objects_SinglyLinkedList_header.roops_core_objects_SinglyLinkedListNode_next;
      var_834_result = false;
      boolean var_835_ws_169;

      t_1745 = var_834_result  ==  false;

      if (t_1745) {
        {
          {
            t_1746 = var_833_current  !=  null;
            if (t_1746) {
              {
                t_1744 = true;
              }
            } else {
              {
                t_1744 = false;
              }
            }
          }
        }
      } else {
        {
          t_1744 = false;
        }
      }
      var_835_ws_169 = t_1744;
      while (var_835_ws_169) {
        boolean t_1749;
        boolean t_1750;
        boolean t_1751;
        boolean t_1752;
        boolean t_1753;
        boolean t_1754;
        boolean t_1755;
        boolean var_836_equalVal;

        t_1750 = param_valueParam_600  ==  null;

        if (t_1750) {
          {
            {
              t_1751 = var_833_current.roops_core_objects_SinglyLinkedListNode_value  ==  null;
              if (t_1751) {
                {
                  t_1749 = true;
                }
              } else {
                {
                  t_1749 = false;
                }
              }
            }
          }
        } else {
          {
            t_1749 = false;
          }
        }

        if (t_1749) {
          {
            {
              {
                {
                  {
                    var_836_equalVal = false;
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
                    boolean t_1748;

                    t_1748 = param_valueParam_600  ==  null;
                    if (t_1748) {
                      {
                        {
                          {
                            {
                              {
                                boolean t_1747;

                                t_1747 = param_valueParam_600  ==  var_833_current;
                                if (t_1747) {
                                  {
                                    {
                                      {
                                        {
                                          {
                                            var_836_equalVal = true;
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
                                            var_836_equalVal = false;
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
                                var_836_equalVal = false;
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
        t_1752 = var_836_equalVal  ==  true;

        if (t_1752) {
          {
            {
              {
                {
                  {
                    var_834_result = true;
                  }
                }
              }
            }
          }
        }
        var_833_current.roops_core_objects_SinglyLinkedListNode_next = var_833_current.roops_core_objects_SinglyLinkedListNode_next.roops_core_objects_SinglyLinkedListNode_next;
        t_1754 = var_834_result  ==  false;

        if (t_1754) {
          {
            {
              t_1755 = var_833_current  !=  null;
              if (t_1755) {
                {
                  t_1753 = true;
                }
              } else {
                {
                  t_1753 = false;
                }
              }
            }
          }
        } else {
          {
            t_1753 = false;
          }
        }
        var_835_ws_169 = t_1753;
      }

      return var_834_result;
    }
  }


  /*@ 
    @ requires index  >=  0 && index  <  \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).int_size();
    @ ensures \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).has(((java.lang.Object)(\result)))  ==  true;
    @ ensures \reach(\result, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).int_size()  ==  \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).int_size() - index;
    @ signals (java.lang.RuntimeException e) false;
    @*/
  public roops.core.objects.SinglyLinkedListNode getNode(int index) {
    int param_index_601;

    param_index_601 = index;
    {
      boolean t_1756;
      boolean t_1757;
      boolean t_1758;
      roops.core.objects.SinglyLinkedListNode var_837_current = this.roops_core_objects_SinglyLinkedList_header;
      roops.core.objects.SinglyLinkedListNode var_838_result = ((roops.core.objects.SinglyLinkedListNode)(null));
      int var_839_current_index = 0;
      boolean var_840_ws_170;

      t_1757 = var_838_result  ==  null;

      if (t_1757) {
        {
          {
            t_1758 = var_837_current  !=  null;
            if (t_1758) {
              {
                t_1756 = true;
              }
            } else {
              {
                t_1756 = false;
              }
            }
          }
        }
      } else {
        {
          t_1756 = false;
        }
      }
      var_840_ws_170 = t_1756;
      while (var_840_ws_170) {
        boolean t_1759;
        boolean t_1760;
        boolean t_1761;
        boolean t_1762;

        t_1759 = param_index_601  ==  var_839_current_index;

        if (t_1759) {
          {
            {
              {
                {
                  {
                    var_838_result = var_837_current;
                  }
                }
              }
            }
          }
        }
        var_839_current_index = var_839_current_index + 1;
        var_837_current = var_837_current.roops_core_objects_SinglyLinkedListNode_next;
        t_1761 = var_838_result  ==  null;

        if (t_1761) {
          {
            {
              t_1762 = var_837_current  !=  null;
              if (t_1762) {
                {
                  t_1760 = true;
                }
              } else {
                {
                  t_1760 = false;
                }
              }
            }
          }
        } else {
          {
            t_1760 = false;
          }
        }
        var_840_ws_170 = t_1760;
      }

      return var_838_result;
    }
  }


  /*@ 
    @ requires true;
    @ ensures (\exists roops.core.objects.SinglyLinkedListNode n; \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).has(((java.lang.Object)(n))); n.roops_core_objects_SinglyLinkedListNode_value  ==  arg && n.roops_core_objects_SinglyLinkedListNode_next  ==  null);
    @ ensures (\forall roops.core.objects.SinglyLinkedListNode n; \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).has(((java.lang.Object)(n))); n.roops_core_objects_SinglyLinkedListNode_next  !=  null ==> \old(\reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next)).has(((java.lang.Object)(n))));
    @ ensures (\forall roops.core.objects.SinglyLinkedListNode n; \old(\reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next)).has(((java.lang.Object)(n))); \reach(this.roops_core_objects_SinglyLinkedList_header, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).has(((java.lang.Object)(n))) && n.roops_core_objects_SinglyLinkedListNode_next  !=  null);
    @ signals (java.lang.Exception e) false;
    @*/
  public void insertBack(java.lang.Object arg) {
    java.lang.Object param_arg_602;

    param_arg_602 = arg;
    {
      roops.core.objects.SinglyLinkedListNode t_1763;
      boolean t_1766;

      t_1763 = new roops.core.objects.SinglyLinkedListNode();
      roops.core.objects.SinglyLinkedListNode var_841_freshNode = t_1763;

      var_841_freshNode.roops_core_objects_SinglyLinkedListNode_value = param_arg_602;
      var_841_freshNode.roops_core_objects_SinglyLinkedListNode_next = ((roops.core.objects.SinglyLinkedListNode)(null));
      t_1766 = this.roops_core_objects_SinglyLinkedList_header  ==  null;
      if (t_1766) {
        {
          {
            {
              {
                {
                  this.roops_core_objects_SinglyLinkedList_header = var_841_freshNode;
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
                  boolean t_1764;
                  roops.core.objects.SinglyLinkedListNode var_842_current = ((roops.core.objects.SinglyLinkedListNode)(null));

                  var_842_current = this.roops_core_objects_SinglyLinkedList_header;
                  boolean var_843_ws_171;

                  t_1764 = var_842_current.roops_core_objects_SinglyLinkedListNode_next  ==  null;
                  var_843_ws_171 = ! t_1764;

                  /*@ decreasing \reach(var_842_current, roops.core.objects.SinglyLinkedListNode, roops_core_objects_SinglyLinkedListNode_next).int_size();
                    @*/
                  while (var_843_ws_171) {
                    boolean t_1765;

                    var_842_current = var_842_current.roops_core_objects_SinglyLinkedListNode_next;
                    t_1765 = var_842_current.roops_core_objects_SinglyLinkedListNode_next  ==  null;
                    var_843_ws_171 = ! (t_1765);
                  }
                  var_842_current.roops_core_objects_SinglyLinkedListNode_next = var_841_freshNode;
                }
              }
            }
          }
        }
      }
    }
  }

}
