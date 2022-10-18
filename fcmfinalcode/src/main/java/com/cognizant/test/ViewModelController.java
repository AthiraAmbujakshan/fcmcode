package com.cognizant.test;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.dom4j.DocumentException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cognizant.test.module.data.ModuleList;
import com.cognizant.test.module.data.Project;
import com.cognizant.test.module.data.ReportTable;
import com.cognizant.test.oracle.module.Module;

@Controller
public class ViewModelController {

	private static ArrayList<String> table1 = new ArrayList<String>();
	private static ArrayList<String> table2 = new ArrayList<String>();
	private static ArrayList<String> table3 = new ArrayList<String>();
	private static ArrayList<String> table4 = new ArrayList<String>();
	List<Module> finalList = new ArrayList<Module>();
	private static ArrayList<ReportTable> summarylist = new ArrayList<ReportTable>();
	public static String  databasename; 
	public String sql, sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8,sql9;
 	

	@RequestMapping(method = RequestMethod.GET, value = "/users/export/excel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=Model_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		ExcelExporter exporter = new ExcelExporter(finalList);

		exporter.export(response);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/users/export/pdf")
	public void exportToPDF(HttpServletResponse response, @ModelAttribute("modulelist") ModuleList modulelist,
			@RequestParam String modulename) throws DocumentException, IOException {

		response.setContentType("application/pdf");

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=Datamodel" + ".pdf";
		response.setHeader(headerKey, headerValue);

		PdfExporter exporter = new PdfExporter(finalList, modulename);
		exporter.export(response);

	}

	@RequestMapping(method = RequestMethod.GET, value = "/fetch")

	public String connectToOracleDb(@ModelAttribute("modulelist") ModuleList modulelist, Model model,
			@RequestParam String modulename, @ModelAttribute("projectname") Project projectname,
			@RequestParam String projectid) {
		model.addAttribute("projectid", projectid);
		model.addAttribute("modulename", modulename);
		
		
		JdbcTemplate jdbcTemplate = DatabaseController.jdbctemplate;
		
		DatabaseController databasecontroller = new DatabaseController();
	databasename =	databasecontroller.selectedDb();
	

		if (modulename.trim().equals("Historical Profile Batch Alert")) {
			finalList.clear();
   if(databasename.equals("option1"))
   {
			 sql = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,DATA_LENGTH, DATA_DEFAULT,COLUMN_ID, NULLABLE \r\n"
					+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'FRA_STAT_HIT'";
  
			 sql1 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
						+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'FRA_STAT_ITEM'";
   
   }
   else if(databasename.equals("option2"))
   {
	    sql = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE  AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'FRA_STAT_ITEM'";
	    sql1 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME)AS DATA_LENGTH,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE, ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'FRA_STAT_HIT'";
   }
			List<Module> modulestable1 = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Module.class));
			finalList.addAll(modulestable1);

			

			List<Module> modulestable2 = jdbcTemplate.query(sql1, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable2);

		}

		else if (modulename.trim().equals("Historical CIF Alert")) {
			finalList.clear();
			 if(databasename.equals("option1"))
			   {
				  sql = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,DATA_LENGTH, DATA_DEFAULT,COLUMN_ID, NULLABLE \r\n"
						 + "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'TAH2CIF_STAHIT'";
			   
			   }
			   else if(databasename.equals("option2"))
			   {
				   sql = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'TAH2CIF_STAHIT'";
			   }
			List<Module> modulestable1 = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable1);
		}

		else if (modulename.trim().equals("Historical Online Alert")) {
			finalList.clear();
			if(databasename.equals("option1"))
			{
		 sql = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,DATA_LENGTH, DATA_DEFAULT,COLUMN_ID, NULLABLE \r\n"
					+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'TAH2STAMSG'";
		 sql1 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
					+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'TAH2STAHIT'";
			}
			else if(databasename.equals("option2"))
			{
			sql = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'TAH2STAMSG'";
			sql1 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'TAH2STAHIT'";



			}	
			List<Module> modulestable1 = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable1);
			

			List<Module> modulestable2 = jdbcTemplate.query(sql1, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable2);
		}

		else if (modulename.trim().equals("Historical Cases")) {
			finalList.clear();
			if(databasename.equals("option1"))
			{
			sql = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,DATA_LENGTH, DATA_DEFAULT,COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE'";



			sql1 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_ACCOUNT_LINK'";



			sql2 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_CASE_LINK'";



			sql3 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_CIF_MESSAGE_LINK'";



			sql4 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_CIF_RECORD_LINK'";



			sql5 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_CIF_STAMESSAGE_LINK'";



			sql6 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_GROUP_LINK'";



			sql7 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_MRSMSG_LINK'";



			sql8 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_OPERATION_LINK'";



			sql9 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH,DATA_DEFAULT, COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CASE_STAMSG_LINK'";
			}
			else if(databasename.equals("option2"))
			{
			sql = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE'";
			sql1 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_ACCOUNT_LINK'";
			sql2 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_CASE_LINK'";
			sql3 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_CIF_MESSAGE_LINK'";
			sql4 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_CIF_RECORD_LINK'";
			sql5 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_CIF_STAMESSAGE_LINK'";
			sql6 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_GROUP_LINK'";
			sql7 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_MRSMSG_LINK'";
			sql8 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_OPERATION_LINK'";
			sql9 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CASE_STAMSG_LINK'";



			}



			List<Module> modulestable1 = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable1);

			
			List<Module> modulestable2 = jdbcTemplate.query(sql1, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable2);

			
			List<Module> modulestable3 = jdbcTemplate.query(sql2, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable3);

			

			List<Module> modulestable4 = jdbcTemplate.query(sql3, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable4);

			

			List<Module> modulestable5 = jdbcTemplate.query(sql4, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable5);

			

			List<Module> modulestable6 = jdbcTemplate.query(sql5, BeanPropertyRowMapper.newInstance(Module.class));
			finalList.addAll(modulestable6);

			
			List<Module> modulestable7 = jdbcTemplate.query(sql6, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable7);

			
			List<Module> modulestable8 = jdbcTemplate.query(sql7, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable8);

			
			List<Module> modulestable9 = jdbcTemplate.query(sql8, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable9);

			

			List<Module> modulestable10 = jdbcTemplate.query(sql9, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable10);

		}

		else if (modulename.trim().equals("Customer Questionnaire")) {
			finalList.clear();
			if(databasename.equals("option1"))
			{
			sql = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,DATA_LENGTH, DATA_DEFAULT,COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'TAH2CIF_RECORD'";



			sql1 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,DATA_LENGTH, DATA_DEFAULT,COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_CIF_FIELD'";



			sql2 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,DATA_LENGTH, DATA_DEFAULT,COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_RISK_CALCULATION'";



			sql3 = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,DATA_LENGTH, DATA_DEFAULT,COLUMN_ID, NULLABLE \r\n"
			+ "FROM USER_TAB_COLUMNS\r\n" + "WHERE table_name = 'ING_STORE_ITM'";
			}
			else if(databasename.equals("option2"))
			{
			sql = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'TAH2CIF_RECORD'";
			sql1 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_CIF_FIELD'";
			sql2 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_RISK_CALCULATION'";
			sql3 = "select TABLE_NAME,COLUMN_NAME, DATA_TYPE,DATALENGTH(COLUMN_NAME) AS DATA_LENGTH ,COLUMN_DEFAULT AS DATA_DEFAULT,IS_NULLABLE AS NULLABLE,ORDINAL_POSITION AS COLUMN_ID from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ING_STORE_ITM'";
			}


			List<Module> modulestable1 = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable1);

			
			List<Module> modulestable2 = jdbcTemplate.query(sql1, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable2);

			
			List<Module> modulestable3 = jdbcTemplate.query(sql2, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable3);

			
			List<Module> modulestable4 = jdbcTemplate.query(sql3, BeanPropertyRowMapper.newInstance(Module.class));

			finalList.addAll(modulestable4);
		}

		model.addAttribute("finalList", finalList);
		return "viewdatamodel";

	}

	@RequestMapping(value = "/summarytableinfo", method = RequestMethod.POST)
	@ResponseBody
	public List<ReportTable> summarytable(HttpServletResponse response, @RequestBody List<ReportTable> tabledata)
			throws DocumentException, IOException {
		table1.clear();
		table2.clear();
		table3.clear();
		table4.clear();
		summarylist.clear();
		for (ReportTable str : tabledata) {
			table1.add(str.tableInformation);
			table2.add(str.Noofrowsbeforemigration);
			table3.add(str.Noofrowsmigrated);
			table4.add(str.Noofrowsaftermigration);
			table1.remove(null);
			table2.remove(null);
			table3.remove(null);
			table4.remove(null);

		}

		for (int i = 0; i < table1.size(); i++) {
			ReportTable obj = new ReportTable(table1.get(i), table2.get(i), table3.get(i), table4.get(i));
			summarylist.add(obj);
		}
		
		return tabledata;
	}

	@RequestMapping("/export/table/excel")
	public void exportReportSummaryToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=ReportSummary_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		ExcelReportSummaryExporter exporter = new ExcelReportSummaryExporter(summarylist);

		exporter.export(response);
	}

	@RequestMapping("/export/table/pdf")
	public void exportReportSummsaryToPDF(HttpServletResponse response) throws DocumentException, IOException {
		response.setContentType("application/pdf");
		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=ReportSummary" + ".pdf";
		response.setHeader(headerKey, headerValue);

		PDFReportSummaryExporter exporter = new PDFReportSummaryExporter(summarylist);
		exporter.export(response);

	}
}
