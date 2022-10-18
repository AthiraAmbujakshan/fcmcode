package com.cognizant.test.module.data;

public class ReportTable {
	
	public String tableInformation;
	public String Noofrowsbeforemigration;
	public String Noofrowsmigrated;
	public String Noofrowsaftermigration;
	
	public ReportTable() {
		
	}

	public ReportTable(String tableInformation, String noofrowsbeforemigration, String noofrowsmigrated,
			String noofrowsaftermigration) {
		super();
		this.tableInformation = tableInformation;
		Noofrowsbeforemigration = noofrowsbeforemigration;
		Noofrowsmigrated = noofrowsmigrated;
		Noofrowsaftermigration = noofrowsaftermigration;
	}

	public String getTableInformation() {
		return tableInformation;
	}

	public void setTableInformation(String tableInformation) {
		this.tableInformation = tableInformation;
	}

	public String getNoofrowsbeforemigration() {
		return Noofrowsbeforemigration;
	}

	public void setNoofrowsbeforemigration(String noofrowsbeforemigration) {
		Noofrowsbeforemigration = noofrowsbeforemigration;
	}

	public String getNoofrowsmigrated() {
		return Noofrowsmigrated;
	}

	public void setNoofrowsmigrated(String noofrowsmigrated) {
		Noofrowsmigrated = noofrowsmigrated;
	}

	public String getNoofrowsaftermigration() {
		return Noofrowsaftermigration;
	}

	public void setNoofrowsaftermigration(String noofrowsaftermigration) {
		Noofrowsaftermigration = noofrowsaftermigration;
	}

	@Override
	public String toString() {
		return "ReportTable [tableInformation=" + tableInformation + ", Noofrowsbeforemigration="
				+ Noofrowsbeforemigration + ", Noofrowsmigrated=" + Noofrowsmigrated + ", Noofrowsaftermigration="
				+ Noofrowsaftermigration + "]";
	}
}
