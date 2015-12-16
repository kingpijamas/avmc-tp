package ar.edu.itba.ayvmc;

// Copyright (C) 2006 United States Government as represented by the
// Administrator of the National Aeronautics and Space Administration
// (NASA).  All Rights Reserved.
// 
// This software is distributed under the NASA Open Source Agreement
// (NOSA), version 1.3.  The NOSA has been approved by the Open Source
// Initiative.  See the file NOSA-1.3-JPF at the top of the distribution
// directory tree for the complete NOSA document.
// 
// THE SUBJECT SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY WARRANTY OF ANY
// KIND, EITHER EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING, BUT NOT
// LIMITED TO, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL CONFORM TO
// SPECIFICATIONS, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
// A PARTICULAR PURPOSE, OR FREEDOM FROM INFRINGEMENT, ANY WARRANTY THAT
// THE SUBJECT SOFTWARE WILL BE ERROR FREE, OR ANY WARRANTY THAT
// DOCUMENTATION, IF PROVIDED, WILL CONFORM TO THE SUBJECT SOFTWARE.
//
//package probsym;

//import gov.nasa.jpf.symbc.probsym.Analyze;


import ar.edu.itba.ayvmc.NodeBTBug;

public class BinTreeBug {

	/*@
      @ invariant (\forall NodeBTBug n;
      @     \reach(root, NodeBTBug, left+right).has(n);
      @     \reach(n.left, NodeBTBug, left+right).has(n) == false);
      @
      @ invariant (\forall NodeBTBug n;
      @     \reach(root, NodeBTBug, left+right).has(n);
      @     \reach(n.right, NodeBTBug, left+right).has(n) == false);
      @
      @ invariant (\forall NodeBTBug n;
      @     \reach(root, NodeBTBug, left+right).has(n);
      @     (\forall NodeBTBug m;
      @         \reach(n.right, NodeBTBug, left+right).has(m);
      @         m.value >= n.value));
      @
      @ invariant (\forall NodeBTBug n;
      @     \reach(root, NodeBTBug, left+right).has(n);
      @     (\forall NodeBTBug m;
      @         \reach(n.left, NodeBTBug, left+right).has(m);
      @         m.value < n.value));
     @*/
	
	public /*@nullable@*/NodeBTBug root;
	
	public int intendedSize = 0;
	
	public BinTreeBug() {
		root = null;
	}

	//----
//	public static void outputTestSequence(int number) {
//	}
//
//	public native boolean checkAbstractState(int which);
//	public native boolean checkAbstractState2(int which, int x);
//
//	
//	public native static int gen_native(int br, NodeBTBug n0, int x, NodeBTBug n1, NodeBTBug n2);
//
//	
//	
//	
//	public static void gen(int br, NodeBTBug n0, int x, NodeBTBug n1, NodeBTBug n2) {
//		//System.out.println(br);
//		//covered(br);		
//		//int c = gen_native(br, n0, x, n1, n2);
//		//if (c != 0)
//		//	outputTestSequence(c);
//	}
//
//	public boolean checkTree() {
//		return checkTree(root,Integer.MIN_VALUE, Integer.MAX_VALUE);
//	}
//	
//	private boolean checkTree(NodeBTBug n, int min, int max) {
//		if (n == null)
//			return true;
//		if (n.value < min || n.value > max)
//			return false;
//		boolean resLeft = checkTree(n.left,min,n.value-1);
//		if(!resLeft)
//			return false;
//		else
//			return checkTree(n.right,n.value+1,max);
//	}
//	

	/*@ requires true;
	  @ ensures \result == \reach(root, NodeBTBug, left+ right).int_size();
	  @*/
	public int getSize() {
		return getTreeSize(root);
	}
	
//	public boolean checkSize() {
//		return getSize() == intendedSize;
//	}
	
	public int getTreeSize(NodeBTBug n) {
		if (n == null)
			return 0;
		if (n.left == null && n.right == null)
			return 1;
		if (n.left == null)
			return 1 + getTreeSize(n.right);
		if (n.right == null)
			return 1 + getTreeSize(n.left);
		return 1 + getTreeSize(n.left) + getTreeSize(n.right);
	}
	
	
//	
	//----
	/*@ requires \reach(root, NodeBTBug, left+right).has(n) == false;
	  @ requires n.left == null && n.right == null && n.value == 0;
	  @ ensures true;
	 @*/
		public void add(int x, NodeBTBug n) {
		NodeBTBug current = root;
		
		

		if (root == null) {
			//gen(0, current, x, null, null);
			root = n;
			root.value = x;
			intendedSize++;
			
		}
		else {
			while (current.value != x) {
				if (x < current.value) {
					if (current.left == null) {
						//gen(1, current, x, null, null);
						current.left = n;
						current.left.value = x;
						intendedSize++;
					} else {
						//gen(2, current, x, null, null);
						current = current.left;
					}
				} else {
					if (current.right == null) {
						//gen(3, current, x, null, null);
						current.right = n;
						current.right.value = x;
						intendedSize++;
					} else {
						//gen(4, current, x, null, null);
						current = current.right;
					}
				}
				
			}
		}
	}

//	public boolean find(int x) {
//		NodeBTBug current = root;
//
//		while (current != null) {
//
//			if (current.value == x) {
//				gen(5, current, x, null, null);
//				return true;
//			}
//
//			if (x < current.value) {
//				gen(6, current, x, null, null);
//				current = current.left;
//			} else {
//				gen(7, current, x, null, null);
//				current = current.right;
//			}
//		}
//		gen(16, current, x, null, null);
//
//		return false;
//	}


	//este remove esta mal porque falla en el caso de que el nodo a borrar tiene los dos hijos, y su hijo derecho solo tiene un hijo derecho 
	//(y no izquierdo), termina quedando un arbol que no es BinTree
	
	/*@ requires( \exists NodeBTBug n; \reach(root, NodeBTBug, left+right).has(n) == true; n.value == x);
	  @ ensures ( \forall NodeBTBug n; \reach(root, NodeBTBug, left+right).has(n) == true; n.value != x);
	 @*/
	public boolean remove(int x) {
		NodeBTBug current = root;
		NodeBTBug parent = null;
		boolean branch = true; //true =left, false =right

		while (current != null) {

			if (current.value == x) {
				NodeBTBug bigson = current;
				while (bigson.left != null || bigson.right != null) {
					parent = bigson;
					if (bigson.right != null) {
						//gen(8, current, x, bigson, parent);
						bigson = bigson.right;
						branch = false;
					} else {
						//gen(9, current, x, bigson, parent);
						bigson = bigson.left;
						branch = true;
					}
				}
				
				// esto es para el caso en que hay un solo nodo en el arbol y se lo quiera eliminar
				if (bigson == root) { // && bigson.left == null && bigson.right == null) {
					//covered(88);
					root = null;
					intendedSize--;
					return true;
				}

				//		System.out.println("Remove: current "+current.value+" parent "+parent.value+" bigson "+bigson.value);
				if (parent != null) {
					if (branch) {
						//gen(10, current, x, bigson, parent);
						parent.left = null;
					} else {
						//gen(11, current, x, bigson, parent);
						parent.right = null;
					}
				}

				if (bigson != current) {
					//gen(12, current, x, bigson, parent);
					current.value = bigson.value;
				} else {
					//gen(13, current, x, bigson, parent);
				}

				
				intendedSize--;
				return true;
			}

			parent = current;
			//	    if (current.value <x ) { // THERE WAS ERROR
			if (current.value > x) {
				//gen(14, current, x, null, parent);
				current = current.left;
				branch = true;
			} else {
				//gen(15, current, x, null, parent);
				current = current.right;
				branch = false;
			}
		}

		//gen(17, current, x, null, parent);
		return false;
	}
//	
//	/* How delte should really work! 
//	 * 
//	 */
//	
//	public boolean delete(int x) 
//	{ 
////  	Algorithm note: There are four cases to consider:
////  	1. The node is a leaf.
////  	2. The node has no left child.
////  	3. The node has no right child.
////  	4. The node has two children.
//		
//		//initialize parent and current to root
//		NodeBTBug current = root;
//		NodeBTBug parent = root;
//		
//		boolean isLeftChild = true;
//		
//		if (current == null)
//			return false;
//		
//		//while loop to search for node to delete
//		while(current.value != x) {
//			//assign parent to current
//			parent = current;
//		 	if(current.value > x) {
//		 		gen(68, null, x, null, null);
//		    	isLeftChild = true; //current is a left child
//		    	current = current.left; //make current's left child the current node
//		    }
//		 	else {
//		 		gen(69, null, x, null, null);
//		    	isLeftChild = false; //current is a right child
//		    	current = current.right; //make current's right child the current node
//		    }
//		 	if(current == null) { //data can't be found, break from loop
//		 		gen(70, null, x, null, null);
//		 		return false;          
//		 	}
//		}   
////  	test for a leaf
//		if(current.left == null && current.right == null) 
//		{
//			if(current == root)  {//tree has a single node, make root null 
//				gen(71, null, x, null, null);
//				root = null;      
//			}
//		 	else if(isLeftChild)  { //current is a left child so make its parent's left null	  
//		 		gen(72, null, x, null, null);
//		 		parent.left = null; 
//		 	}
//		 	else {                            
//		 		gen(73, null, x, null, null);
//		 		parent.right = null; //current is a right child so make its parent's right null  
//		 	}
//		}
////  	test for no right child		
//		else if(current.right == null)	 
//			if(current == root) { //current is root so make root point to current's left	 
//				gen(74, null, x, null, null);
//				root = current.left; //old root gets deleted by garbage collector
//			}
//			else if(isLeftChild) { //current is a left child so make its parent's left point to it's left child
//				gen(75, null, x, null, null);
//				parent.left = current.left;
//			}
//			else { //current is a right child so make its parent's right point to it's left child
//				gen(76, null, x, null, null);
//				parent.right = current.left;
//			}
////  	test for no left child			
//		else if(current.left == null)	 
//			if(current == root) { //current is root so make root point to current's right			 
//				gen(77, null, x, null, null);
//				root = current.right; //old root gets deleted by garbage collector
//			}
//			else if(isLeftChild) { //current is a left child so make its parent's left point to it's right child		 
//				gen(78, null, x, null, null);
//				parent.left = current.right;
//			}
//			else { //current is a right child so make its parent's right point to it's right child
//				gen(79, null, x, null, null);
//				parent.right = current.right;
//			}
////  	there are two children:
////  	retrieve and delete the inorder successor
//		else {
// 
//			NodeBTBug successor = getSuccessor(current); //get successor
//		
//		 	if(current == root) {	 
//		 		gen(80, null, x, null, null);
//		 		root = successor;
//		 	}
//		 	else if(isLeftChild) {
//		 		gen(81, null, x, null, null);
//		    	parent.left= successor; //set node to delete to successor
//		 	}
//		    else {
//		    	gen(82, null, x, null, null);
//		    	parent.right = successor;
//		    }
////		 	attach current's left to successor's left since successor has no left child		
//		 	successor.left = current.left; 
//		 }   
//		intendedSize--;
//		return true;
// 	}
//  
//   //This method searches the successor of a node to be deleted
//   private NodeBTBug getSuccessor(NodeBTBug delNode)
//   {
//		NodeBTBug successorParent = delNode;	 
//		NodeBTBug successor = delNode;	 
//		NodeBTBug current = delNode.right; 
//		
//		while(current != null) { 			
//			successorParent = successor; 
//			successor = current;			 
//			current = current.left;			 
//		}
//		if(successor != delNode.right) { 			
//			successorParent.left = successor.right;	 
//		 	successor.right = delNode.right;		 
//		}
//		return successor; 
//   }
//	
//	
//	public static void runTest(int[] options, int limit) {
//		BinTreeBug b = new BinTreeBug();
//		int round = 0;
//		while (round < limit) {
//			if (options[round] == 1) {
//				b.add(options[limit + round]);
//			}
//			else {
//				b.remove(options[limit + round]); //broken
//				//b.delete(options[limit + round]); //working
//			}						
//			round++;
//		}
//		//if (!b.checkSize())
//		//	b.covered(99);
//		//else if (!b.checkTree())
//		//	b.covered(999);
//		//else 
//		//	b.covered(1000);
//		//assert b.checkSize() : " size = " + b.getSize() + " but should have been " + b.intendedSize;
//		//b.covered(999);
//	}
//	
///*	public static void runTestDriver(int length) {
//		int[] values = new int[length*2];
//		int i = 0;
//		while (i < 2*length) {
//			if (i < length)
//				values[i] = Debug.makeSymbolicInteger("c" + i);
//			else 
//				values[i] = Debug.makeSymbolicInteger("v" + i);
//			i++;
//		}
//	    runTest(values,length);
//	}
//*/	
//	public static void main(String[] args) {
//		//runTestDriver(4);
//		/*
//		BinTree b = new BinTree();
//		
//		b.add(0);
//		System.out.println(b.checkTree() + " " + b);
//		b.add(-10);
//		System.out.println(b.checkTree() + " " + b);
//		b.add(-11);
//		System.out.println(b.checkTree() + " " + b);
//		b.add(-12);
//		System.out.println(b.checkTree() + " " + b);
//		b.add(-13);
//		System.out.println(b.checkTree() + " " + b);
//		
//		System.out.println(b.delete(-11));
//		System.out.println(b.checkTree() + " " + b);
//		
//		System.out.println(b.remove(-12));		
//		assert b.checkSize() : " size = " + b.getSize() + " but should have been " + b.intendedSize;
//		System.out.println("check = " + b.checkSize()  + " " + b);
//		*/
//	}

}
