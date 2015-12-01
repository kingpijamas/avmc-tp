package pldi.nodecachinglinkedlist;

//@ model import org.jmlspecs.lang.*;


public class LinkedListNode extends java.lang.Object {

  public /*@ nullable @*/ pldi.nodecachinglinkedlist.LinkedListNode pldi_nodecachinglinkedlist_LinkedListNode_previous;
  public /*@ nullable @*/ pldi.nodecachinglinkedlist.LinkedListNode pldi_nodecachinglinkedlist_LinkedListNode_next;
  public /*@ nullable @*/ java.lang.Object pldi_nodecachinglinkedlist_LinkedListNode_value;

  public LinkedListNode() {
    this.pldi_nodecachinglinkedlist_LinkedListNode_previous = ((pldi.nodecachinglinkedlist.LinkedListNode)(null));
    this.pldi_nodecachinglinkedlist_LinkedListNode_next = ((pldi.nodecachinglinkedlist.LinkedListNode)(null));
    this.pldi_nodecachinglinkedlist_LinkedListNode_value = ((java.lang.Object)(null));
    {
    }
  }

}
