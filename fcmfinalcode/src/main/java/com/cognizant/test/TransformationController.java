
package com.cognizant.test;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cognizant.test.module.data.ModuleList;
import com.cognizant.test.module.data.Project;
import com.cognizant.test.module.data.TableModel;
import com.cognizant.test.oracle.module.Constraint;

@Controller
public class TransformationController {
	@Autowired
	File_UploadController fileController;
	
	
	@Autowired
	MappingController mappingController;
	
	
	private static ArrayList<String> sourcefield = new ArrayList<String>();
	
	
	private static ArrayList<ArrayList<String>> valuefield = new ArrayList<ArrayList<String>>();
	private static ArrayList<String> tablename = new ArrayList<String>();
	private static ArrayList<String> destinationfield = new ArrayList<String>();
	private static ArrayList<String> destinationtype = new ArrayList<String>();
	private static ArrayList<String> destinationsize = new ArrayList<String>();
	private static ArrayList<String> transformationlogics = new ArrayList<String>();
	private static ArrayList<String> defaultValue = new ArrayList<String>();
	private static ArrayList<String> lookupnamearray = new ArrayList<String>();
	private static ArrayList<String> lookupvaluearray = new ArrayList<String>();
	private static ArrayList<String> LoadActionArray = new ArrayList<String>();
	private static ArrayList<String> lookupdescarray = new ArrayList<String>();
	private static ArrayList<ArrayList<String>> queryValues = new ArrayList<ArrayList<String>>();
	private static ArrayList<String> module_name = new ArrayList<String>();
	private static ArrayList<String> projectname =new ArrayList<String>();
	private static ArrayList<String>defaultvaluesbeforeproceed = new ArrayList<String>();
	private static ArrayList<String>loadActionbeforeproceed = new ArrayList<String>();
	private static ArrayList<String>transformationlogicerror= new ArrayList<String>();
	public static String  databasename; 
	public String primarykey;
	String primarykeycolumnname= "";
	public ArrayList<String>Modules_selectedsummary = new ArrayList<>();
	public ArrayList<Integer>Valuefieldsize = new ArrayList<>();
	

@ExceptionHandler(SQLException.class)
public String abc(Model model) {
	model.addAttribute("flag",1);
	return "status";
	}
	
	
@RequestMapping("/dashboard")
@Transactional(rollbackFor=Exception.class)
public String StatusPage(Model model) throws Exception  {

 JdbcTemplate jdbcTemplate = DatabaseController.jdbctemplate;

ArrayList<String> resultSet=new ArrayList<String>();
ArrayList<Integer> u=new ArrayList<Integer>();
for(int y=0;y<queryValues.size();y++) {
u.clear();
resultSet=queryValues.get(y);

System.out.println("---"+resultSet);

String name=tablename.get(0),sql="";
String action=LoadActionArray.get(0);

DatabaseController databasecontroller = new DatabaseController();
databasename = databasecontroller.selectedDb();

int j=0,k;
for(int i=0;i<tablename.size();i++)
{
if(i==tablename.size()-1)
k=i;
else
k=i+1;
if(tablename.get(k).equals(name)==false||i==tablename.size()-1)
{
	if(action.equals("Insert into FCM")) {
		
		
		sql="Insert into "+name+"(";
		for (int x=j;x<=i;x++)
		{
		if(databasename.contentEquals("option2"))
		{
			
			primarykey = "select C.column_name FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS T"+
					" JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE C ON C.CONSTRAINT_NAME=T.CONSTRAINT_NAME"+
					" WHERE C.TABLE_NAME='" +name+ "'"+
					"and T.CONSTRAINT_TYPE='PRIMARY KEY' ";
					List<Constraint> m = jdbcTemplate.query(primarykey, BeanPropertyRowMapper.newInstance(Constraint.class));
					
					for(Constraint s: m)
					{
					primarykeycolumnname = s.getColumn_name();
					}
					
						
			
		if(destinationfield.get(x).equals(primarykeycolumnname))
			if(!(name.equals("TAH2STAHIT")|| name.equals("TAH2STAMSG")||name.equals("TAH2CIF_STAHIT")))
		continue;
		}
		if(x==i)
		sql=sql+destinationfield.get(x);
		else
		sql=sql+destinationfield.get(x)+",";

		}
		sql=sql+") values(";
		for (int a=j;a<=i;a++)
		{
		if(databasename.contentEquals("option2"))
		{
		if(destinationfield.get(a).equals(primarykeycolumnname))
			if(!(name.equals("TAH2STAHIT")|| name.equals("TAH2STAMSG")||name.equals("TAH2CIF_STAHIT")))
		continue;
		}
		if(destinationtype.get(a).equalsIgnoreCase("varbinary"))
		sql=sql+"CONVERT(VARBINARY,'"+resultSet.get(a)+"',1)";
		else
		sql=sql+"'"+resultSet.get(a)+"'";
		if(a!=i)
		sql=sql+",";
		}
		sql=sql+")";



		System.out.println(sql);
		}
else
{


if(databasename.equals("option1"))
{
primarykey = "SELECT column_name FROM all_cons_columns WHERE constraint_name = (\r\n" +
" SELECT constraint_name FROM user_constraints \r\n" +
" WHERE UPPER(table_name) = UPPER('" +name+ "') AND CONSTRAINT_TYPE = 'P'\r\n" +
")";
}
else if(databasename.equals("option2"))
{
primarykey = "select C.column_name FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS T"+
" JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE C ON C.CONSTRAINT_NAME=T.CONSTRAINT_NAME"+
" WHERE C.TABLE_NAME='" +name+ "'"+
"and T.CONSTRAINT_TYPE='PRIMARY KEY' ";

}

System.out.println("primarykey statement"+primarykey);
List<Constraint> m = jdbcTemplate.query(primarykey, BeanPropertyRowMapper.newInstance(Constraint.class));
String primarykeycolumnname= "";
for(Constraint s: m)
{
primarykeycolumnname = s.getColumn_name();
}
System.out.println(primarykeycolumnname);

sql="Update "+name+" SET ";
for(int x=j+1;x<=i;x++)
if(x==i)
sql=sql+destinationfield.get(x)+"='"+resultSet.get(x)+"'";
else
sql=sql+destinationfield.get(x)+"='"+resultSet.get(x)+"',";

System.out.println("resultset"+ resultSet);
int l=0;
for( l=0; l<destinationfield.size(); l++)
{
if(u.contains(l))
continue;
if(destinationfield.get(l).equals(primarykeycolumnname))
{
u.add(l);
break;
}
}

System.out.println(l);
sql=sql+" where "+destinationfield.get(l)+"="+resultSet.get(l);
System.out.println("UPDATEQUERY"+sql);
}
System.out.println(databasename);

 jdbcTemplate.update(sql);


if(i!=tablename.size()-1) {
name=tablename.get(i+1);
System.out.println(name);
action=LoadActionArray.get(i+1);
}

j=i+1;
}
}
}

return "status";

}


@RequestMapping("/apply_transformation")
public String applyTransformation(Model model)
{

model.addAttribute("sourcefield", sourcefield);
model.addAttribute("tablename",tablename);
model.addAttribute("destinationfield", destinationfield);
model.addAttribute("destinationtype",destinationtype);
model.addAttribute("destinationsize",destinationsize);
model.addAttribute("transformationlogics",transformationlogics );
model.addAttribute("defaultValue",defaultValue);
model.addAttribute("lookupnamearray",lookupnamearray);
model.addAttribute("lookupvaluearray", lookupvaluearray);
model.addAttribute("lookupdescarray",lookupdescarray);

model.addAttribute("defaultvaluesbeforeproceed",defaultvaluesbeforeproceed);
model.addAttribute("loadActionbeforeproceed",loadActionbeforeproceed);

model.addAttribute("transformationlogicerror", transformationlogicerror);
model.addAttribute("LoadActionArray", LoadActionArray);



return "transformationscreen";

}

@RequestMapping(value ="/transformationerror", method = RequestMethod.POST)
@ResponseBody
public List<TableModel> ErrorTransformation(@RequestBody List<TableModel> tabledata, Model model)
{
	transformationlogics.clear();
	transformationlogicerror.clear();
	
	LoadActionArray.clear();
	lookupnamearray.clear();
	lookupvaluearray.clear();
	lookupdescarray.clear();
	
	defaultValue.clear();
	for (TableModel str : tabledata) {
		transformationlogicerror.add(str.transformationLogic);
		LoadActionArray.add(str.loadAction);
		defaultValue.add(str.defaultValues);
		lookupnamearray.add(str.lookupname);
		lookupvaluearray.add(str.lookupvalue);
		lookupdescarray.add(str.lookupdesc);
		transformationlogicerror.remove(null);
		LoadActionArray.remove(null);
		defaultValue.remove(null);
		lookupnamearray.remove(null);
		lookupvaluearray.remove(null);
		lookupdescarray.remove(null);
		
	}
	
	
	return tabledata;
}




@RequestMapping(value = "/backtochangelogics", method = RequestMethod.POST)
@ResponseBody
public List<TableModel> ChangeLogic(@RequestBody List<TableModel> tabledata, Model model) {

	defaultvaluesbeforeproceed.clear();
	loadActionbeforeproceed.clear();
	transformationlogicerror.clear();
	LoadActionArray.clear();
	transformationlogics.clear();
	defaultValue.clear();
	
	
	for (TableModel str : tabledata) {
		
		transformationlogics.add(str.transformationLogic);
		defaultvaluesbeforeproceed.add(str.defaultValues);
		loadActionbeforeproceed.add(str.loadAction);
		defaultvaluesbeforeproceed.remove(null);
		loadActionbeforeproceed.remove(null);
		transformationlogics.remove(null);
		
	}
	
	
	
	
	return tabledata;
}


@RequestMapping("/confirmtransformation")



public String confirmTransformation(Model model)
{

model.addAttribute("sourcefield", sourcefield);
model.addAttribute("tablename",tablename);
model.addAttribute("destinationfield", destinationfield);
model.addAttribute("destinationtype",destinationtype);
model.addAttribute("destinationsize",destinationsize);
model.addAttribute("transformationlogics",transformationlogics);
model.addAttribute("defaultValue",defaultValue);
model.addAttribute("LoadActionArray",LoadActionArray);
return "confirmtransformationscreen";

}




@RequestMapping(value = "/listoftablecolumn", method = RequestMethod.POST)
@ResponseBody
public List<TableModel> createNewStory(@RequestBody List<TableModel> tabledata, Model model) {
	transformationlogics.clear();
	transformationlogicerror.clear();
	defaultvaluesbeforeproceed.clear();
	loadActionbeforeproceed.clear();
	defaultValue.clear();
	LoadActionArray.clear();
	sourcefield.clear();
	tablename.clear();
	valuefield.clear();
	destinationfield.clear();
	destinationtype.clear();
	destinationsize.clear();
	projectname.clear();
	
	
	module_name.clear();

	for (TableModel str : tabledata) {
		sourcefield.add(str.sourceField);
		tablename.add(str.tableName);
		destinationfield.add(str.destinationField);
		destinationtype.add(str.destinationType);
		destinationsize.add(str.destinationSize);

		sourcefield.remove(null);
		tablename.remove(null);
		destinationfield.remove(null);
		destinationtype.remove(null);
		destinationsize.remove(null);
		Modules_selectedsummary.add(str.modulename);
		module_name.add(str.modulename);
		projectname.add(str.projectname);
		module_name.remove(null);
		projectname.remove(null);
		Modules_selectedsummary.remove(null);
	}
	
	
	valuefield = fileController.getValues();
	
	
	System.out.println("valuefield is "+valuefield);
	
	System.out.println("size of value field is"+valuefield.size());
	Valuefieldsize.add(valuefield.size());
	
	return tabledata;
}

@RequestMapping(value = "/transformationlogic", method = RequestMethod.POST)
@ResponseBody
public List<TableModel> Transform(@RequestBody List<TableModel> tabledata) {
	transformationlogics.clear();
	defaultValue.clear();
	lookupnamearray.clear();
	lookupvaluearray.clear();
	lookupdescarray.clear();
	LoadActionArray.clear();
	transformationlogicerror.clear();
	for (TableModel str : tabledata) {
		transformationlogics.add(str.transformationLogic);
		defaultValue.add(str.defaultValues);
		lookupnamearray.add(str.lookupname);
		lookupvaluearray.add(str.lookupvalue);
		LoadActionArray.add(str.loadAction);
		lookupdescarray.add(str.lookupdesc);
		transformationlogics.remove(null);
		defaultValue.remove(null);
		lookupnamearray.remove(null);
		lookupvaluearray.remove(null);
		LoadActionArray.remove(null);
		lookupdescarray.remove(null);
	}
	

	
	iterateLogic();
	return tabledata;
}

public void iterateLogic()  {
	
	JdbcTemplate jdbcTemplate = DatabaseController.jdbctemplate;
	DatabaseController databasecontroller = new DatabaseController();
	databasename = databasecontroller.selectedDb();
	
	String sql="",value="";
ArrayList<String> dataSet=new ArrayList<String>();
ArrayList<String> resultSet=new ArrayList<String>();
queryValues.clear();
System.out.println("valuefield array is"+valuefield);
for (int l = 0; l < valuefield.size(); l++) {
dataSet = valuefield.get(l);
System.out.println("dataset"+dataSet);
for (int i = 0; i < transformationlogics.size(); i++) {
if (transformationlogics.get(i).equalsIgnoreCase("auto generated")) {
	System.out.println("databasename inside autogenerated" +databasename);
	if(tablename.get(i).equals("TAH2CIF_RECORD")&& destinationfield.get(i).equals("CIF_RECORD_ID") && databasename.equals("option2"))
	{
		resultSet.add("1");
	}
	else {
sql = "Select MAX(" + destinationfield.get(i) + ") from " + tablename.get(i);
value = jdbcTemplate.queryForObject(sql, String.class);
if( value == null)
{
	resultSet.add("1");
}
else {
	
value = String.valueOf(Integer.parseInt(value) + l+1);
resultSet.add(value);
}
	}
	}
 else if (transformationlogics.get(i).equalsIgnoreCase("retrieve from query")) {
value = jdbcTemplate.queryForObject(defaultValue.get(i), String.class);
resultSet.add(value);
}
else if (transformationlogics.get(i).equalsIgnoreCase("lookup")) {
	
for (int j = 0; j < lookupnamearray.size(); j++) {
if (lookupnamearray.get(j).equals(defaultValue.get(i))
&& dataSet.get(i).equals(lookupvaluearray.get(j))) {
resultSet.add(lookupdescarray.get(j));
break;
}
} } else if (transformationlogics.get(i).equalsIgnoreCase("User defined value")) {
resultSet.add(defaultValue.get(i));
} else if (transformationlogics.get(i).equalsIgnoreCase("Same as")) 
{ for (int j = 0; j < destinationfield.size(); j++) {
if (defaultValue.get(i).equals(destinationfield.get(j))) {
resultSet.add(resultSet.get(j));
break;
}
} } else if (transformationlogics.get(i).equalsIgnoreCase("maximum()")) {
sql = "Select MAX(" + destinationfield.get(i) + ") from " + tablename.get(i);
value = jdbcTemplate.queryForObject(sql, String.class);
if(value == null)
{
	resultSet.add("0");
}
else {
	
value = String.valueOf(Integer.parseInt(value));
resultSet.add(value);
}

}
else if (transformationlogics.get(i).equalsIgnoreCase("maximum()+1")) {
sql = "Select MAX(" + destinationfield.get(i) + ") from " + tablename.get(i);
value = jdbcTemplate.queryForObject(sql, String.class);
if(value == null)
{
	resultSet.add("1");
}
else {
value = String.valueOf(Integer.parseInt(value) +l+1);
resultSet.add(value);
}

}

else
	
resultSet.add(dataSet.get(i));

}
System.out.println("resultset after iterate method"+resultSet);
queryValues.add(resultSet);
resultSet=new ArrayList<String>();
}

}




/*--------------------------------------------------------------------------*/



@RequestMapping("/closefcm")

public String EndMigration(Model model) {
	
	Modules_selectedsummary.clear();
	Valuefieldsize.clear();
	return "login";

}




@RequestMapping("/redotransformation")
public String navigateOnError(@ModelAttribute("modulelist") ModuleList modulelist,@ModelAttribute("projectid") Project projectid,Model model)
{
	

	String [] str = new String[module_name.size()];
	for(int i=0; i<module_name.size(); i++) {
		str[i]= module_name.get(i);
	}
	StringBuffer sb= new StringBuffer();
	for(int i=0; i<str.length; i++) {
		sb.append(str[i]);
	}
	String modulename ="";
	 modulename = sb.toString();
	
	
	
	
	String [] str1 = new String[projectname.size()];
	for(int i=0; i<projectname.size(); i++) {
		str1[i]= projectname.get(i);
	}
	StringBuffer sb1= new StringBuffer();
	for(int i=0; i<str1.length; i++) {
		sb1.append(str1[i]);
	}

	String project_name ="";
	 project_name = sb1.toString();
		
	return mappingController.connectToOracleDb(modulelist, model, modulename, projectid, project_name);
}
	

public List<String> giveMigrationmodules() {

	return Modules_selectedsummary;
}

public List<Integer> giveValuefield()
{
	return Valuefieldsize;
}

}
