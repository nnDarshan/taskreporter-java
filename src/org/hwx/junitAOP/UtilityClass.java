package org.hwx.junitAOP;

public class UtilityClass {

	public static void main(String[] args) {
		UtilityClass util = new UtilityClass();
		System.out.println(util.concatinate("Hello ", "World!"));
		System.out.println(util.multiply(3, 5));
		

	}
	
	public String concatinate(String one, String two) {
		return one + two;
	}
	
	public int multiply(int a, int b) {
		return a*b;
	}
	

}
