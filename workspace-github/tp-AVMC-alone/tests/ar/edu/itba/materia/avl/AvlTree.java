package ar.edu.itba.materia.avl;

import ar.edu.itba.materia.avl.AvlNode;

public class AvlTree {

	public /*@nullable@*/ AvlNode root;
	int size;


	/*@
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); 
	  @		\reach(n.left, AvlNode, left+right).has(n) == false);
	  @
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); 
	  @		\reach(n.right, AvlNode, left+right).has(n) == false);
	  @
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); 
	  @		(\forall AvlNode m; \reach(n.left, AvlNode, left+right).has(m); m.key < n.key));
	  @
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); 
	  @		(\forall AvlNode m; \reach(n.right, AvlNode, left+right).has(m); m.key > n.key));
	  @
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); 
	  @		(n.left != null && n.right != null) ==> (n.left.height - n.right.height <= 1 && n.left.height - n.right.height >= -1));
	  @
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); 
	  @		(n.left != null && n.right == null) ==> n.left.height <= 1);
	  @
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); 
	  @		(n.left == null && n.right != null) ==> n.right.height <= 1);
	  @
	  @	invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); (n.left == null && n.right == null) ==> n.height == 0);
	  @
	  @	invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); (n.left != null && n.right == null) ==> n.height == n.left.height + 1);
	  @
	  @	invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); (n.left == null && n.right != null) ==> n.height == n.right.height + 1);
	  @
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); (n.left != null && n.right != null && n.left.height >= n.right.height)
	  @		==> n.height == n.left.height + 1);
	  @
	  @ invariant (\forall AvlNode n; \reach(root, AvlNode, left+right).has(n); (n.left != null && n.right != null && n.left.height < n.right.height) 
	  @		==> n.height == n.right.height + 1);
	  @
	  @ invariant size == \reach(root, AvlNode, left+right).int_size();
	  @*/




	/*@
	  @ requires true;
	  @ ensures (\forall AvlNode n; \old(\reach(root, AvlNode, left+right).has(n)); n.key >= \result);
	  @ ensures (\exists AvlNode n; \old(\reach(root, AvlNode, left+right).has(n)); n.key == \result);
	  @ signals (Exception e) false;
	  @*/
	public int findMin(){
		AvlNode current = root;
		while (current.left != null){
			current = current.left;
		}

		return current.key;

	}



	public void rotateRight(AvlNode node){
		AvlNode newRoot = node.left;
		node.left = newRoot.right;
		newRoot.right = node;
		if(node.parent == null){
			newRoot.parent = null;
			root = newRoot;
		}else if(node.parent.left.key == node.key){
			node.parent.left = newRoot;
		}else{
			node.parent.right = newRoot;
		}
		newRoot.parent = node.parent;
		node.parent = newRoot;
	}

	public void rotateLeft(AvlNode node){
		AvlNode newRoot = node.right;
		node.right = newRoot.left;
		newRoot.left = node;
		if(node.parent == null){
			newRoot.parent = null;
			root = newRoot;
		} else if(node.parent.left.key == node.key){
			node.parent.left = newRoot;
		} else{
			node.parent.right = newRoot;
		}
		newRoot.parent = node.parent;
		node.parent = newRoot;
	}


	public static int height(AvlNode node){
		if(node == null) return -1;
		return 1 + max(height(node.right), height(node.left));
	}

	public static int max(int i1, int i2){
		if (i1 >= i2){
			return i1;
		} else {
			return i2;
		}
	}


	/*@
	  @ requires true;
	  @ ensures (\forall AvlNode n;
	    	\old(\reach(root, AvlNode, right + left)).has(n) == true;
	        \reach(root, AvlNode, right + left).has(n) == true);
	  @ ensures (\exists AvlNode n;
	   		n.key == value && 
	   		\reach(root, AvlNode, left + right).has(n) == true);
	  @ ensures \old(\reach(root, AvlNode, right + left)).int_size() + 1 ==
	   		\reach(root, AvlNode, right + left).int_size();
	  @*/
	public void insert(int value){
		AvlNode current = root; 
		AvlNode parent = null; 
		AvlNode nodeToInsert = null;
		int comparison;
		if(root == null){
			root = new AvlNode();
			root.key = value;
		} else {
			while(current != null){
				comparison = current.key - value;
				parent = current;
				if(comparison < 0) current = current.right;
				else current = current.left;
			}
			nodeToInsert = new AvlNode();
			nodeToInsert.key = value;
			nodeToInsert.parent = parent;
			if(parent.key < value) parent.right = nodeToInsert;
			else parent.left = nodeToInsert;
			int balanceFactor;
			AvlNode child;
			boolean flag = true;
			while(parent != null && flag){
				balanceFactor = height(parent.left) - height(parent.right);
				if(balanceFactor == 2){
					child = parent.left;
					if(height(child.left) - height(child.right) == -1){
						rotateLeft(child);
					}
					rotateRight(parent);
					flag = false;  // Originalmente usaba break pero taco no lo tiene implementado
				}else if(balanceFactor == -2){
					child = parent.right;
					if(height(child.left) - height(child.right) == 1){
						rotateRight(child);
					}
					rotateLeft(parent);
					flag = false;
				}
				parent = parent.parent;
			}
		}
	}


	/*@ requires n >= 0;
	  @ ensures \result == 0;
	  @*/
	public static int factorial(int n){
		if (n==0)
			return 1;
		else 
			return n * factorial(n-1);
	}


	/*@ requires n > 1;
	  @ ensures \result != 1;
	  @*/
	public static int fibo(int n){
		if (n==0)
			return 0;
		else if (n==1)
			return 1;
		else
			return fibo(n-1) + fibo(n-2);
	}





}
