package com.company.controller;

public class AA {

	public static void main(String[] args) {
		StringBuffer a = new StringBuffer("A");
		StringBuffer b = new StringBuffer("B");
		operate(a,b);
		System.out.println(a + "," + b);
	}

	private static void operate(StringBuffer x, StringBuffer y) {
		x.append(y);
	}

}
