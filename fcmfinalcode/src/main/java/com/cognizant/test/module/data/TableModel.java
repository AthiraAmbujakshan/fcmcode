package com.cognizant.test.module.data;

public class TableModel {

	public String sourceField;
	public String tableName;
	public String destinationField;
	public String destinationType;
	public String destinationSize;
	public String transformationLogic;
	public String defaultValues;
	public String loadAction;
	public String lookupname;
	public String lookupvalue;
	public String lookupdesc;
	public String valueField;
	public String modulename;
public String projectname;
	
	public TableModel() {
		
	}

	public TableModel(String sourceField, String tableName, String destinationField, String destinationType,
			String destinationSize, String transformationLogic, String defaultValues, String loadAction,
			String lookupname, String lookupvalue, String lookupdesc, String valueField, String modulename,
			String projectname) {
		super();
		this.sourceField = sourceField;
		this.tableName = tableName;
		this.destinationField = destinationField;
		this.destinationType = destinationType;
		this.destinationSize = destinationSize;
		this.transformationLogic = transformationLogic;
		this.defaultValues = defaultValues;
		this.loadAction = loadAction;
		this.lookupname = lookupname;
		this.lookupvalue = lookupvalue;
		this.lookupdesc = lookupdesc;
		this.valueField = valueField;
		this.modulename = modulename;
		this.projectname = projectname;
	}

	public String getSourceField() {
		return sourceField;
	}

	public void setSourceField(String sourceField) {
		this.sourceField = sourceField;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getDestinationField() {
		return destinationField;
	}

	public void setDestinationField(String destinationField) {
		this.destinationField = destinationField;
	}

	public String getDestinationType() {
		return destinationType;
	}

	public void setDestinationType(String destinationType) {
		this.destinationType = destinationType;
	}

	public String getDestinationSize() {
		return destinationSize;
	}

	public void setDestinationSize(String destinationSize) {
		this.destinationSize = destinationSize;
	}

	public String getTransformationLogic() {
		return transformationLogic;
	}

	public void setTransformationLogic(String transformationLogic) {
		this.transformationLogic = transformationLogic;
	}

	public String getDefaultValues() {
		return defaultValues;
	}

	public void setDefaultValues(String defaultValues) {
		this.defaultValues = defaultValues;
	}

	public String getLoadAction() {
		return loadAction;
	}

	public void setLoadAction(String loadAction) {
		this.loadAction = loadAction;
	}

	public String getLookupname() {
		return lookupname;
	}

	public void setLookupname(String lookupname) {
		this.lookupname = lookupname;
	}

	public String getLookupvalue() {
		return lookupvalue;
	}

	public void setLookupvalue(String lookupvalue) {
		this.lookupvalue = lookupvalue;
	}

	public String getLookupdesc() {
		return lookupdesc;
	}

	public void setLookupdesc(String lookupdesc) {
		this.lookupdesc = lookupdesc;
	}

	public String getValueField() {
		return valueField;
	}

	public void setValueField(String valueField) {
		this.valueField = valueField;
	}

	public String getModulename() {
		return modulename;
	}

	public void setModulename(String modulename) {
		this.modulename = modulename;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}	
	
}
