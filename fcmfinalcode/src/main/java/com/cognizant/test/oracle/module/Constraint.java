package com.cognizant.test.oracle.module;

public class Constraint {
	
	private String column_name;
	
	
	public Constraint(){
		
	}


	public Constraint(String column_name) {
		super();
		this.column_name = column_name;
	}


	public String getColumn_name() {
		return column_name;
	}


	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}


	@Override
	public String toString() {
		return "Constraint [column_name=" + column_name + "]";
	}
	
}
