
package com.cognizant.test;



import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cognizant.test.module.data.DatabaseInfo;

@Controller

public class DatabaseController {

	String password = "", user = "";
	public static String selected_db;
	
public static JdbcTemplate jdbctemplate;
	
	public static Connection connection;
	

	@ExceptionHandler(SQLException.class)
	public String abc(Model model) {
	return "databasefailpage";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/validatedatabaseconnection")
	public String ValidateConnection(@ModelAttribute("databaseinfo") DatabaseInfo databaseinfo,
			@RequestParam String databasename, @RequestParam String hostName, @RequestParam String userName,
			@RequestParam String dBpassword, @RequestParam String dbName, @RequestParam int dbPortNumber, Model model) throws SQLException {
        user = userName;
        password = dBpassword;
        selected_db =  databasename;
        
        selectedDb();
      
          
  connection =datasource(databasename, hostName, dbPortNumber, user, password, dbName).getConnection();
  if(connection != null)
  {
    return "databasesuccesspage";  
  }
  else {
	  return "databasefailpage";
  }
	  
  
      
        
     
	}

	public String selectedDb() {
		System.out.println("databasename"+selected_db);
		return selected_db;
		
	}

	public DataSource  datasource(String databasename, String hostName, int dbPortNumber,String user, String password, String dbName)  {

		
	
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		
		if(databasename.equals("option1"))
		{
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@"+hostName+":"+dbPortNumber+":FCMDB");
		
       dataSource.setUsername(user);
		dataSource.setPassword(password);
		}
		else if(databasename.equals("option2"))
		{
			dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			dataSource.setUrl("jdbc:sqlserver://"+hostName+";databaseName="+dbName);
			
			
			dataSource.setUsername(user);
			dataSource.setPassword(password);
		}
		jdbctemplate = createJdbcTemplate(dataSource);
		
		
		return dataSource;
	}

	public  JdbcTemplate createJdbcTemplate(DriverManagerDataSource dataSource) {

		return new JdbcTemplate(dataSource);
		
	}
}



		
