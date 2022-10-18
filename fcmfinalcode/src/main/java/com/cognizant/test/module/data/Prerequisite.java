package com.cognizant.test.module.data;

public class Prerequiste {

	public String optionid;
	public String option;
	
	public Prerequiste() {
		
	}

	public Prerequiste(String optionid, String option) {
		super();
		this.optionid = optionid;
		this.option = option;
	}

	public String getOptionid() {
		return optionid;
	}

	public void setOptionid(String optionid) {
		this.optionid = optionid;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
}
