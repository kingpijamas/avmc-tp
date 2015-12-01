package roops.core.objects;

//@ model import org.jmlspecs.lang.*;

/** @j2daType
*/
public /*@ nullable_by_default @*/ class NodeCachingLinkedList extends java.lang.Object {

  public roops.core.objects.LinkedListNode roops_core_objects_NodeCachingLinkedList_header;
  public roops.core.objects.LinkedListNode roops_core_objects_NodeCachingLinkedList_firstCachedNode;
  public int roops_core_objects_NodeCachingLinkedList_maximumCacheSize;
  public int roops_core_objects_NodeCachingLinkedList_cacheSize;
  public int roops_core_objects_NodeCachingLinkedList_size;
  public int roops_core_objects_NodeCachingLinkedList_DEFAULT_MAXIMUM_CACHE_SIZE;
  public int roops_core_objects_NodeCachingLinkedList_modCount;
  /*@ invariant this.roops_core_objects_NodeCachingLinkedList_header  !=  null && this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next  !=  null && this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_previous  !=  null && (\forall roops.core.objects.LinkedListNode n; \reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(n))); n  !=  null && n.roops_core_objects_LinkedListNode_previous  !=  null && n.roops_core_objects_LinkedListNode_previous.roops_core_objects_LinkedListNode_next  ==  n && n.roops_core_objects_LinkedListNode_next  !=  null && n.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_previous  ==  n) && this.roops_core_objects_NodeCachingLinkedList_size + 1  ==  \reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).int_size() && this.roops_core_objects_NodeCachingLinkedList_size  >=  0;
    @*/
  /*@ invariant (\forall roops.core.objects.LinkedListNode m; \reach(this.roops_core_objects_NodeCachingLinkedList_firstCachedNode, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(m))); \reach(m.roops_core_objects_LinkedListNode_next, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(m)))  ==  false && m.roops_core_objects_LinkedListNode_previous  ==  null);
    @*/
  /*@ invariant this.roops_core_objects_NodeCachingLinkedList_cacheSize  <=  this.roops_core_objects_NodeCachingLinkedList_maximumCacheSize;
    @*/
  /*@ invariant this.roops_core_objects_NodeCachingLinkedList_DEFAULT_MAXIMUM_CACHE_SIZE  ==  3;
    @*/
  /*@ invariant this.roops_core_objects_NodeCachingLinkedList_cacheSize  ==  \reach(this.roops_core_objects_NodeCachingLinkedList_firstCachedNode, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).int_size();
    @*/

  public NodeCachingLinkedList() {
    this.roops_core_objects_NodeCachingLinkedList_header = ((roops.core.objects.LinkedListNode)(null));
    this.roops_core_objects_NodeCachingLinkedList_firstCachedNode = ((roops.core.objects.LinkedListNode)(null));
    this.roops_core_objects_NodeCachingLinkedList_maximumCacheSize = (byte)0;
    this.roops_core_objects_NodeCachingLinkedList_cacheSize = (byte)0;
    this.roops_core_objects_NodeCachingLinkedList_size = (byte)0;
    this.roops_core_objects_NodeCachingLinkedList_DEFAULT_MAXIMUM_CACHE_SIZE = (byte)0;
    this.roops_core_objects_NodeCachingLinkedList_modCount = (byte)0;
    {
      roops.core.objects.LinkedListNode t_1;

      t_1 = new roops.core.objects.LinkedListNode();
      this.roops_core_objects_NodeCachingLinkedList_header = t_1;
      this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next = this.roops_core_objects_NodeCachingLinkedList_header;
      this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_previous = this.roops_core_objects_NodeCachingLinkedList_header;
      this.roops_core_objects_NodeCachingLinkedList_firstCachedNode = ((roops.core.objects.LinkedListNode)(null));
      this.roops_core_objects_NodeCachingLinkedList_size = 0;
      this.roops_core_objects_NodeCachingLinkedList_cacheSize = 0;
      this.roops_core_objects_NodeCachingLinkedList_DEFAULT_MAXIMUM_CACHE_SIZE = 3;
      this.roops_core_objects_NodeCachingLinkedList_maximumCacheSize = 3;
      this.roops_core_objects_NodeCachingLinkedList_modCount = 0;
    }
  }


  /*@ 
    @ requires index  >=  0 && index  <  this.roops_core_objects_NodeCachingLinkedList_size;
    @ requires this.roops_core_objects_NodeCachingLinkedList_maximumCacheSize  ==  this.roops_core_objects_NodeCachingLinkedList_DEFAULT_MAXIMUM_CACHE_SIZE;
    @ ensures this.roops_core_objects_NodeCachingLinkedList_size  ==  \old(this.roops_core_objects_NodeCachingLinkedList_size) - 1;
    @ ensures \old(this.roops_core_objects_NodeCachingLinkedList_cacheSize)  <  this.roops_core_objects_NodeCachingLinkedList_maximumCacheSize ==> this.roops_core_objects_NodeCachingLinkedList_cacheSize  ==  \old(this.roops_core_objects_NodeCachingLinkedList_cacheSize) + 1;
    @ ensures this.roops_core_objects_NodeCachingLinkedList_modCount  ==  \old(this.roops_core_objects_NodeCachingLinkedList_modCount) + 1;
    @ ensures (index  ==  0 && this.roops_core_objects_NodeCachingLinkedList_size  >  0) ==> \result  ==  \old(this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_value);
    @ ensures (index  ==  1 && this.roops_core_objects_NodeCachingLinkedList_size  >  1) ==> \result  ==  \old(this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_value);
    @ ensures (index  ==  2 && this.roops_core_objects_NodeCachingLinkedList_size  >  2) ==> \result  ==  \old(this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_value);
    @ ensures (\forall roops.core.objects.LinkedListNode n; \reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(n))); \old(\reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next)).has(((java.lang.Object)(n))));
    @ ensures (\exists roops.core.objects.LinkedListNode n; \old(\reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next)).has(((java.lang.Object)(n))); \reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(n)))  ==  false);
    @ ensures (\forall roops.core.objects.LinkedListNode n; \old(\reach(this.roops_core_objects_NodeCachingLinkedList_firstCachedNode, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next)).has(((java.lang.Object)(n))); \reach(this.roops_core_objects_NodeCachingLinkedList_firstCachedNode, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(n))));
    @ ensures (\forall roops.core.objects.LinkedListNode n; \old(\reach(this.roops_core_objects_NodeCachingLinkedList_firstCachedNode, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next)).has(((java.lang.Object)(n))); n.roops_core_objects_LinkedListNode_previous  ==  null);
    @ ensures this.roops_core_objects_NodeCachingLinkedList_maximumCacheSize  ==  this.roops_core_objects_NodeCachingLinkedList_DEFAULT_MAXIMUM_CACHE_SIZE;
    @ signals (java.lang.RuntimeException e) false;
    @*/
  public /*@ nullable @*/ java.lang.Object remove(final int index) {
    int param_index_0;

    param_index_0 = index;
    {
      boolean t_3;
      boolean t_5;
      boolean t_7;
      int t_10;
      boolean t_11;
      boolean t_12;
      roops.core.objects.LinkedListNode var_1_node = ((roops.core.objects.LinkedListNode)(null));

      t_3 = param_index_0  <  0;

      if (t_3) {
        {
          {
            {
              {
                {
                  java.lang.RuntimeException t_2;

                  t_2 = new java.lang.RuntimeException();
                  throw t_2;
                }
              }
            }
          }
        }
      }
      t_5 = param_index_0  ==  this.roops_core_objects_NodeCachingLinkedList_size;

      if (t_5) {
        {
          {
            {
              {
                {
                  java.lang.RuntimeException t_4;

                  t_4 = new java.lang.RuntimeException();
                  throw t_4;
                }
              }
            }
          }
        }
      }
      t_7 = param_index_0  >  this.roops_core_objects_NodeCachingLinkedList_size;

      if (t_7) {
        {
          {
            {
              {
                {
                  java.lang.IndexOutOfBoundsException t_6;

                  t_6 = new java.lang.IndexOutOfBoundsException();
                  throw t_6;
                }
              }
            }
          }
        }
      }
      t_10 = this.roops_core_objects_NodeCachingLinkedList_size / 2;
      t_11 = param_index_0  <  t_10;

      if (t_11) {
        {
          {
            {
              {
                {
                  var_1_node = this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next;
                  {
                    int var_2_currentIndex = 0;
                    boolean var_3_ws_1;

                    var_3_ws_1 = var_2_currentIndex  <  param_index_0;
                    while (var_3_ws_1) {
                      int t_8;

                      var_1_node = var_1_node.roops_core_objects_LinkedListNode_next;
                      t_8 = var_2_currentIndex;
                      var_2_currentIndex = var_2_currentIndex + (byte)1;
                      var_3_ws_1 = var_2_currentIndex  <  param_index_0;
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
                  var_1_node = this.roops_core_objects_NodeCachingLinkedList_header;
                  {
                    int var_4_currentIndex = this.roops_core_objects_NodeCachingLinkedList_size;
                    boolean var_5_ws_2;

                    var_5_ws_2 = var_4_currentIndex  >  param_index_0;
                    while (var_5_ws_2) {
                      int t_9;

                      var_1_node = var_1_node.roops_core_objects_LinkedListNode_previous;
                      t_9 = var_4_currentIndex;
                      var_4_currentIndex = var_4_currentIndex + (byte)-1;
                      var_5_ws_2 = var_4_currentIndex  >  param_index_0;
                    }
                  }
                }
              }
            }
          }
        }
      }
      java.lang.Object var_6_oldValue;

      var_6_oldValue = var_1_node.roops_core_objects_LinkedListNode_value;
      var_1_node.roops_core_objects_LinkedListNode_previous.roops_core_objects_LinkedListNode_next = var_1_node.roops_core_objects_LinkedListNode_next;
      var_1_node.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_previous = var_1_node.roops_core_objects_LinkedListNode_previous;
      this.roops_core_objects_NodeCachingLinkedList_size = this.roops_core_objects_NodeCachingLinkedList_size - 1;
      this.roops_core_objects_NodeCachingLinkedList_modCount = this.roops_core_objects_NodeCachingLinkedList_modCount + 1;
      t_12 = this.roops_core_objects_NodeCachingLinkedList_cacheSize  <  this.roops_core_objects_NodeCachingLinkedList_maximumCacheSize;
      if (t_12) {
        {
          {
            {
              {
                {
                  roops.core.objects.LinkedListNode var_7_nextCachedNode;

                  var_7_nextCachedNode = this.roops_core_objects_NodeCachingLinkedList_firstCachedNode;
                  var_1_node.roops_core_objects_LinkedListNode_previous = this.roops_core_objects_NodeCachingLinkedList_firstCachedNode;
                  var_1_node.roops_core_objects_LinkedListNode_next = var_7_nextCachedNode;
                  var_1_node.roops_core_objects_LinkedListNode_value = null;
                  this.roops_core_objects_NodeCachingLinkedList_firstCachedNode = var_1_node;
                  this.roops_core_objects_NodeCachingLinkedList_cacheSize = this.roops_core_objects_NodeCachingLinkedList_cacheSize - 1;
                }
              }
            }
          }
        }
      }

      return var_6_oldValue;
    }
  }


  /*@ 
    @ requires true;
    @ ensures this.roops_core_objects_NodeCachingLinkedList_size  ==  \old(this.roops_core_objects_NodeCachingLinkedList_size) + 1;
    @ ensures this.roops_core_objects_NodeCachingLinkedList_modCount  ==  \old(this.roops_core_objects_NodeCachingLinkedList_modCount) + 1;
    @ ensures (\forall roops.core.objects.LinkedListNode n; \old(\reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next)).has(((java.lang.Object)(n))); \reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(n))));
    @ ensures (\forall roops.core.objects.LinkedListNode n; \reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(n))) && n  !=  this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next; \old(\reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next)).has(((java.lang.Object)(n))));
    @ ensures (this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_value  ==  o);
    @ ensures \result  ==  true;
    @*/
  public boolean addFirst(java.lang.Object o) {
    java.lang.Object param_o_1;

    param_o_1 = o;
    {
      roops.core.objects.LinkedListNode t_13;
      int t_14;
      int t_15;

      t_13 = new roops.core.objects.LinkedListNode();
      roops.core.objects.LinkedListNode var_8_newNode = t_13;

      var_8_newNode.roops_core_objects_LinkedListNode_value = param_o_1;
      roops.core.objects.LinkedListNode var_9_insertBeforeNode = this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next;

      var_8_newNode.roops_core_objects_LinkedListNode_next = var_9_insertBeforeNode;
      var_8_newNode.roops_core_objects_LinkedListNode_previous = var_9_insertBeforeNode.roops_core_objects_LinkedListNode_previous;
      var_9_insertBeforeNode.roops_core_objects_LinkedListNode_previous.roops_core_objects_LinkedListNode_next.roops_core_objects_LinkedListNode_previous = var_8_newNode;
      var_9_insertBeforeNode.roops_core_objects_LinkedListNode_previous = var_8_newNode;
      t_14 = this.roops_core_objects_NodeCachingLinkedList_size;
      this.roops_core_objects_NodeCachingLinkedList_size = this.roops_core_objects_NodeCachingLinkedList_size + (byte)1;
      t_15 = this.roops_core_objects_NodeCachingLinkedList_modCount;
      this.roops_core_objects_NodeCachingLinkedList_modCount = this.roops_core_objects_NodeCachingLinkedList_modCount + (byte)1;

      return true;
    }
  }


  /*@ 
    @ requires true;
    @ ensures \result  ==  true <==> (\exists roops.core.objects.LinkedListNode n; \reach(this.roops_core_objects_NodeCachingLinkedList_header, roops.core.objects.LinkedListNode, roops_core_objects_LinkedListNode_next).has(((java.lang.Object)(n))) && n  !=  this.roops_core_objects_NodeCachingLinkedList_header; n.roops_core_objects_LinkedListNode_value  ==  arg);
    @*/
  public boolean contains(/*@ nullable @*/ java.lang.Object arg) {
    java.lang.Object param_arg_2;

    param_arg_2 = arg;
    {
      roops.core.objects.LinkedListNode var_10_node = this.roops_core_objects_NodeCachingLinkedList_header.roops_core_objects_LinkedListNode_next;
      boolean var_11_ws_3;

      var_11_ws_3 = var_10_node  !=  this.roops_core_objects_NodeCachingLinkedList_header;
      while (var_11_ws_3) {
        boolean t_16;

        t_16 = var_10_node.roops_core_objects_LinkedListNode_value  ==  param_arg_2;

        if (t_16) {
          {
            {
              {
                {
                  {
                    return true;
                  }
                }
              }
            }
          }
        }
        var_10_node = var_10_node.roops_core_objects_LinkedListNode_next;
        var_11_ws_3 = var_10_node  !=  this.roops_core_objects_NodeCachingLinkedList_header;
      }

      return false;
    }
  }

}
