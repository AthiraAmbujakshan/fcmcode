package com.cognizant.test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cognizant.test.module.data.Prerequiste;
import com.cognizant.test.module.data.Project;
import com.cognizant.test.module.service.ProjectService;

@Controller
public class PrerequisteController {
	private static ArrayList<Integer> rows= new ArrayList<Integer>();
	private static ArrayList<Integer> rowsaftermigration= new ArrayList<Integer>();
	
	private static ArrayList<String> values=new ArrayList<String>();
	private static List<String> dbValues=new ArrayList<String>();
	private static ArrayList<String> Optionids = new ArrayList<String>();
	private static ArrayList<String>Option = new ArrayList<String>();
	private static ArrayList<String>Optionidsnotindb = new ArrayList<String>();
	private static ArrayList<String>Optionidsindb = new ArrayList<String>();
	private static int flag;
	private static ArrayList<Integer>Indexes = new ArrayList<Integer>();
	
	public static JdbcTemplate jdbcTemplate;
	
	@Autowired
	ProjectService projectservice;
	
	@Autowired
	TransformationController transformationcontroller;
	
	@Autowired
	FileUploadController fileController;
	
	@RequestMapping("/prerequiste")
	public String PrerequisteScreen() {
		
		return "prerequisitescreen";
	}
	
	@RequestMapping("/proceedtoprojectscreen")
	public String proceedtoProjectScreen(Model model) {
		
		List<Project>listofproject =projectservice.getAllProject();
			model.addAttribute("listofproject", listofproject);
			
		
			rows = getDetails();
			
		return "projectpage";
	}
	
	@RequestMapping("/proceedtovalidation")
	public String proceedtoValidate() {
		
		
			
			
		return "validatescreen";
	}
	
	@RequestMapping(value ="/validateallids", method = RequestMethod.POST)
	@ResponseBody
	public List<Prerequiste> ValidateallIds(@RequestBody List<Prerequiste> tabledata)
	{
		Option.clear();
		Optionids.clear();
		Optionidsnotindb.clear();
		Optionidsindb.clear();
		values.clear();
		dbValues.clear();
		
		
		
		
		
	for(Prerequiste str: tabledata)
	{
		Option.add(str.option);
		Optionids.add(str.optionid);
		Option.remove(null);
		Optionids.remove(null);
		
	}
	
	
	int c=0;
	String db="", field ="", s="", sql="";
	

	if(Option.get(0).equalsIgnoreCase("CUSTOMER")) {
	db="TAH2CIF_RECORD";
	field="CUST_ID";
	}
	else if(Option.get(0).equalsIgnoreCase("ACCOUNT")) {
	db="PRO_ACCOUNT";
	field="ACCOUNT_CODE";
	}
	else if(Option.get(0).equalsIgnoreCase("TRANSACTION")) {
	db="PRO_OPERATION";
	field="SOURCE_APP_REF";
	}
	else if(Option.get(0).equalsIgnoreCase("CASETYPE"))
	{
		db="ING_CASE_TYPE";
		field ="CASE_TYPE_NAME";
	}
	
	String str = Optionids.get(0).trim();
	
	for(int i=0;i<str.length();i++)
	{
	if(str.charAt(i)==',')
	{
	s=str.substring(c,i);
	c=i+1;
	values.add(s);
	}
	else if(i==str.length()-1)
	{
	s=str.substring(c);
	values.add(s);
	}

	s="";
	}
	sql="Select "+field+" from "+db;
	jdbcTemplate = DatabaseController.jdbctemplate;
		dbValues=jdbcTemplate.queryForList(sql, String.class);
	
	if(values.isEmpty())
	{
		flag = -2;
	}
	
	else if(dbValues.containsAll(values))
	{
		Optionidsindb.clear();
	flag=1;
	for(int k=0; k<values.size(); k++)
	{
		Optionidsindb.add(values.get(k));
	}
	}
	
	else {
		Optionidsnotindb.clear();
		Optionidsindb.clear();
		flag = -1;
		for(int k=0; k<values.size(); k++)
		{
			
			if(!(dbValues.contains(values.get(k))))
			{
				Optionidsnotindb.add(values.get(k));
				
			}
			if(dbValues.contains(values.get(k)))
				{
				Optionidsindb.add(values.get(k));
				
				}
		
	}
		
	}
		
	return tabledata;
	}

	@RequestMapping("/validatedid")
	public String AfterValidatingIds(Model model)
	{
		model.addAttribute("flag",flag);
		model.addAttribute("Optionidsnotindb", Optionidsnotindb);
		model.addAttribute("Option", Option);
		model.addAttribute("Optionidsindb",Optionidsindb);
		return "validatescreen";
	}
	
	
	String tables[][] = new String[][] { { "TAH2STAHIT", "TAH2STAMSG" }, { "TAH2CIF_STAHIT" },
		{ "FRA_STAT_HIT", "FRA_STAT_ITEM" },
		{ "ING_CASE", "ING_CASE_ACCOUNT_LINK", "ING_CASE_CASE_LINK", "ING_CASE_CIF_MESSAGE_LINK",
				"ING_CASE_CIF_RECORD_LINK", "ING_CASE_CIF_STAMESSAGE_LINK", "ING_CASE_GROUP_LINK",
				"ING_CASE_MRSMSG_LINK", "ING_CASE_OPERATION_LINK", "ING_CASE_STAMSG_LINK" },
		{ "ING_CIF_FIELD", "ING_RISK_CALCULATION", "ING_STORE_ITM", "TAH2CIF_RECORD" } };

public ArrayList<Integer> getDetails() {
	jdbcTemplate = DatabaseController.jdbctemplate;

	ArrayList<Integer> rows = new ArrayList<Integer>();
	String sql;
	int c = 0, k = 0;
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < tables[i].length; j++) {
			sql = "select count(*) from " + tables[i][j];
			k = jdbcTemplate.queryForObject(sql, Integer.class);
			c = c + k;
		}
		rows.add(i, c);
		c = 0;
	}
	return rows;
}
	
	
@RequestMapping("/reportsummary")
public String SummaryPage(Model model) {
	Indexes.clear();
	
 List<String> module_selected  =	transformationcontroller.giveMigrationmodules();
   System.out.println("modules in summary"+module_selected);
   System.out.println("size of modules_selected array"+module_selected.size());
   
   List<Integer>valuefieldsize = transformationcontroller.giveValuefield();
   System.out.println("size of array"+valuefieldsize);
  
   
   for(int i=0; i<module_selected.size()-1; i++)
   {
	   for(int j=i+1; j<=module_selected.size()-1; j++)
	   {
		   if(module_selected.get(i).equals(module_selected.get(j)))
				   {
			   if(!(Indexes.contains(j)))
			   {
			   Indexes.add(j);
			   }
				   }
	   }
   }
   System.out.println("indexes array is "+Indexes);
   
   Collections.reverse(Indexes);
   for(Integer index: Indexes)
   {
	   valuefieldsize.remove((int)index);
   }

   System.out.println("valuefield after removing elements"+valuefieldsize);
   
   List<String> newList = new ArrayList<String>();
   
   
   for (String element : module_selected) {

       
       if (!newList.contains(element)) {

           newList.add(element);
       }
   }

   
   System.out.println("newlist is"+newList);
   
  model.addAttribute("valuefieldsize", valuefieldsize);
  model.addAttribute("module_selected",newList);
	
	model.addAttribute("rows", rows);
	
	
	rowsaftermigration= getDetails();
	
	
	model.addAttribute("rowsaftermigration",rowsaftermigration);
	return "reportsummarypage";

}	
	
}
