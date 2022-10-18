package com.cognizant.test.oracle.module;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FRA_STAT_HIT")
public class Module {

	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private int COLUMN_ID;
	private String TABLE_NAME;
	private String COLUMN_NAME;
	private String DATA_TYPE;
	private String DATA_LENGTH;
	private String NULLABLE;
	private String DATA_DEFAULT;
  private String COMMENTS;

	public Module() {

	}

	

	



	

	public Module(int cOLUMN_ID, String tABLE_NAME, String cOLUMN_NAME, String dATA_TYPE, String dATA_LENGTH,
			String nULLABLE, String dATA_DEFAULT, String cOMMENTS) {
		super();
		COLUMN_ID = cOLUMN_ID;
		TABLE_NAME = tABLE_NAME;
		COLUMN_NAME = cOLUMN_NAME;
		DATA_TYPE = dATA_TYPE;
		DATA_LENGTH = dATA_LENGTH;
		NULLABLE = nULLABLE;
		DATA_DEFAULT = dATA_DEFAULT;
		COMMENTS = cOMMENTS;
	}









	public int getCOLUMN_ID() {
		return COLUMN_ID;
	}

	public void setCOLUMN_ID(int cOLUMN_ID) {
		COLUMN_ID = cOLUMN_ID;
	}

	public String getCOLUMN_NAME() {
		return COLUMN_NAME;
	}

	public void setCOLUMN_NAME(String cOLUMN_NAME) {
		COLUMN_NAME = cOLUMN_NAME;
	}

	public String getDATA_TYPE() {
		return DATA_TYPE;
	}

	public void setDATA_TYPE(String dATA_TYPE) {
		DATA_TYPE = dATA_TYPE;
	}

	public String getNULLABLE() {
		return NULLABLE;
	}

	public void setNULLABLE(String nULLABLE) {
		NULLABLE = nULLABLE;
	}

	public String getDATA_DEFAULT() {
		return DATA_DEFAULT;
	}

	public void setDATA_DEFAULT(String dATA_DEFAULT) {
		DATA_DEFAULT = dATA_DEFAULT;
	}

	public String getCOMMENTS() {
		return COMMENTS;
	}

	public void setCOMMENTS(String cOMMENTS) {
		COMMENTS = cOMMENTS;
	}

	public String getTABLE_NAME() {
		return TABLE_NAME;
	}

	public void setTABLE_NAME(String tABLE_NAME) {
		TABLE_NAME = tABLE_NAME;
	}



	public String getDATA_LENGTH() {
		return DATA_LENGTH;
	}









	public void setDATA_LENGTH(String dATA_LENGTH) {
		DATA_LENGTH = dATA_LENGTH;
	}









	@Override
	public String toString() {
		return "Module [COLUMN_ID=" + COLUMN_ID + ", TABLE_NAME=" + TABLE_NAME + ", COLUMN_NAME=" + COLUMN_NAME
				+ ", DATA_TYPE=" + DATA_TYPE + ", DATA_LENGTH=" + DATA_LENGTH + ", NULLABLE=" + NULLABLE
				+ ", DATA_DEFAULT=" + DATA_DEFAULT + ", COMMENTS=" + COMMENTS + "]";
	}









	

	

	

}
