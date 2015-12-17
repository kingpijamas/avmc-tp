package ar.edu.itba.ayvmc;

public class NodeBTBug {
	public int value;

	public /*@nullable@*/ NodeBTBug left;
	public /*@nullable@*/ NodeBTBug right;
	
	public NodeBTBug(){
		
	}
	public NodeBTBug(int x) {
		value = x;
		left = null;
		right = null;
	}

}
