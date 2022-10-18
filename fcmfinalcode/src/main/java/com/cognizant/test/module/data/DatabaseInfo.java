package com.cognizant.test.module.data;

public class DatabaseInfo {
	
	
	private String databasename;
	private String hostName;
	private String userName;
	private String dBpassword;
	private String dbName;
	private int dbPortNumber;
	
	public DatabaseInfo() {
		
	}

	public DatabaseInfo(String databasename, String hostName, String userName, String dBpassword, String dbName,
			int dbPortNumber) {
		super();
		this.databasename = databasename;
		this.hostName = hostName;
		this.userName = userName;
		this.dBpassword = dBpassword;
		this.dbName = dbName;
		this.dbPortNumber = dbPortNumber;
	}

	public String getDatabasename() {
		return databasename;
	}

	public void setDatabasename(String databasename) {
		this.databasename = databasename;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getdBpassword() {
		return dBpassword;
	}

	public void setdBpassword(String dBpassword) {
		this.dBpassword = dBpassword;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public int getDbPortNumber() {
		return dbPortNumber;
	}

	public void setDbPortNumber(int dbPortNumber) {
		this.dbPortNumber = dbPortNumber;
	}

	
	

}
