package pldi.nodecachinglinkedlist;

//@ model import org.jmlspecs.lang.*;


public /*@ nullable_by_default @*/ class NodeCachingLinkedListContainsBug3x2x6D extends java.lang.Object {

  public pldi.nodecachinglinkedlist.LinkedListNode pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;
  public pldi.nodecachinglinkedlist.LinkedListNode pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode;
  public int pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize;
  public int pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize;
  public int pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size;
  public int pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE;
  public int pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount;
  /*@ invariant this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header  !=  null && this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header.pldi_nodecachinglinkedlist_LinkedListNode_next  !=  null && this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header.pldi_nodecachinglinkedlist_LinkedListNode_previous  !=  null && (\forall pldi.nodecachinglinkedlist.LinkedListNode n; \reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next).has(((java.lang.Object)(n))); n.pldi_nodecachinglinkedlist_LinkedListNode_previous  !=  null && n.pldi_nodecachinglinkedlist_LinkedListNode_previous.pldi_nodecachinglinkedlist_LinkedListNode_next  ==  n && n.pldi_nodecachinglinkedlist_LinkedListNode_next  !=  null && n.pldi_nodecachinglinkedlist_LinkedListNode_next.pldi_nodecachinglinkedlist_LinkedListNode_previous  ==  n) && this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size + 1  ==  \reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next).int_size() && this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size  >=  0;
    @*/
  /*@ invariant (\forall pldi.nodecachinglinkedlist.LinkedListNode m; \reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next).has(((java.lang.Object)(m))); \reach(m.pldi_nodecachinglinkedlist_LinkedListNode_next, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next).has(((java.lang.Object)(m)))  ==  false && m.pldi_nodecachinglinkedlist_LinkedListNode_previous  ==  null);
    @*/
  /*@ invariant this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize  <=  this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize;
    @*/
  /*@ invariant this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE  ==  3;
    @*/
  /*@ invariant this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode  !=  null ==> this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize  ==  \reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next).int_size();
    @*/

  public NodeCachingLinkedListContainsBug3x2x6D() {
    this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header = ((pldi.nodecachinglinkedlist.LinkedListNode)(null));
    this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode = ((pldi.nodecachinglinkedlist.LinkedListNode)(null));
    this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize = (byte)0;
    this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize = (byte)0;
    this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size = (byte)0;
    this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE = (byte)0;
    this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount = (byte)0;
    {
      pldi.nodecachinglinkedlist.LinkedListNode t_1;

      t_1 = new pldi.nodecachinglinkedlist.LinkedListNode();
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header = t_1;
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header.pldi_nodecachinglinkedlist_LinkedListNode_next = this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header.pldi_nodecachinglinkedlist_LinkedListNode_previous = this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode = ((pldi.nodecachinglinkedlist.LinkedListNode)(null));
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size = 0;
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize = 0;
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE = 3;
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize = 3;
      this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount = 0;
    }
  }


  /*@ 
    @ requires true;
    @ ensures \result  ==  true <==> (\exists pldi.nodecachinglinkedlist.LinkedListNode n; \reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next).has(((java.lang.Object)(n))) && n  !=  this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header; n.pldi_nodecachinglinkedlist_LinkedListNode_value  ==  arg);
    @ ensures (\forall pldi.nodecachinglinkedlist.LinkedListNode n; \old(\reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next)).has(((java.lang.Object)(n))); n.pldi_nodecachinglinkedlist_LinkedListNode_next  ==  \old(n.pldi_nodecachinglinkedlist_LinkedListNode_next) && n.pldi_nodecachinglinkedlist_LinkedListNode_previous  ==  \old(n.pldi_nodecachinglinkedlist_LinkedListNode_previous) && n.pldi_nodecachinglinkedlist_LinkedListNode_value  ==  \old(n.pldi_nodecachinglinkedlist_LinkedListNode_value));
    @ ensures (\forall pldi.nodecachinglinkedlist.LinkedListNode n; \old(\reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next)).has(((java.lang.Object)(n))); \reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next).has(((java.lang.Object)(n))));
    @ ensures (\forall pldi.nodecachinglinkedlist.LinkedListNode n; \reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next).has(((java.lang.Object)(n))); \old(\reach(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header, pldi.nodecachinglinkedlist.LinkedListNode, pldi_nodecachinglinkedlist_LinkedListNode_next)).has(((java.lang.Object)(n))));
    @ ensures this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header  ==  \old(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header);
    @ ensures this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode  ==  \old(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode);
    @ ensures this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize  ==  \old(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize);
    @ ensures this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize  ==  \old(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize);
    @ ensures this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size  ==  \old(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size);
    @ ensures this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE  ==  \old(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE);
    @ ensures this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount  ==  \old(this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount);
    @ signals (java.lang.Exception e) false;
    @*/
  public boolean contains(/*@ nullable @*/ java.lang.Object arg) {
    java.lang.Object param_arg_0;

    param_arg_0 = arg;
    {
      pldi.nodecachinglinkedlist.LinkedListNode var_1_node = this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header.pldi_nodecachinglinkedlist_LinkedListNode_next;
      pldi.nodecachinglinkedlist.LinkedListNode var_2_node2 = var_1_node;
      int var_3_remaining = 0;
      boolean var_4_ws_1;

      var_4_ws_1 = var_2_node2  !=  this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;
      while (var_4_ws_1) {
        var_3_remaining = var_3_remaining + 1;
        var_2_node2 = var_2_node2.pldi_nodecachinglinkedlist_LinkedListNode_next;
        var_4_ws_1 = var_2_node2  !=  this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;
      }
      boolean var_5_ws_3;

      var_5_ws_3 = var_1_node  ==  this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;

      /*@ decreasing var_3_remaining;
        @*/
      while (var_5_ws_3) {
        boolean t_2;

        t_2 = var_1_node.pldi_nodecachinglinkedlist_LinkedListNode_value  !=  arg;

        if (t_2) {
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
        var_1_node = var_1_node.pldi_nodecachinglinkedlist_LinkedListNode_next.pldi_nodecachinglinkedlist_LinkedListNode_next;
        int var_6_remaining2 = 0;
        pldi.nodecachinglinkedlist.LinkedListNode var_7_node3 = var_1_node;
        boolean var_8_ws_2;

        var_8_ws_2 = var_7_node3  !=  this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;
        while (var_8_ws_2) {
          var_6_remaining2 = var_6_remaining2 + 1;
          var_7_node3 = var_7_node3.pldi_nodecachinglinkedlist_LinkedListNode_next;
          var_8_ws_2 = var_7_node3  !=  this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;
        }
        var_3_remaining = var_6_remaining2;
        var_5_ws_3 = var_1_node  ==  this.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header;
      }

      return false;
    }
  }

}
