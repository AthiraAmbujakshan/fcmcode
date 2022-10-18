package com.cognizant.test;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cognizant.test.module.data.Project;
import com.cognizant.test.module.data.UserDetail;
import com.cognizant.test.module.repo.UserDetailRepository;
import com.cognizant.test.module.service.ProjectService;
import com.cognizant.test.module.service.UserDetailService;

@Controller
public class UserController {
	
@Autowired
UserDetailRepository userrepository;

	@Autowired
	UserDetailService userservice;
	
	@Autowired
	ProjectService projectservice;
	
	@Autowired
	TransformationController transformationcontroller;
	
	
	@RequestMapping("/login")

	public String returnloginpage()
	{
		return "login";
		
	}
	
	@RequestMapping("/redirect")

	public String returntologinpage()
	{
		return "login";
		
	}
	
	@RequestMapping("/newuser")

	public String newUserRegister()
	{
		
		return "newUser";
		
	}
	
	@RequestMapping("/savenewuser")

	public String SaveNewUser()
	{
		
		return "login";
		
	}
	
	@RequestMapping("/forgetpassword")

	public String changepassword() {

		return "forgetpassword";

	}
	
	
	@RequestMapping(method = RequestMethod.POST, value ="/nextpage")
	public String showProjectList ( @ModelAttribute("user") UserDetail user,@RequestParam String email, @RequestParam String password, Model model) {
      
		
		boolean abc = userservice.getUserByEmail(email);
		if(abc) {
			
			String EnteredPassword = password;
			
			String savedpassword =	userrepository.findUser(email);
			
			
			if(!(EnteredPassword.matches(savedpassword ))) {
				
			String errormsg ="Entered credentials does't match!!";
			
			 model.addAttribute("errormsg", errormsg);
			 return "login";
			}
			 
			else {
				
					return "databasepage";
				
			}
			}
		
		else {
			String errormsgemail ="Entered email id does't exists!!";
		
			 model.addAttribute("errormsgemail", errormsgemail);
			 return "login";
		}
			
		
		}
	

@RequestMapping("/forget_password")
public String ChangePassword(@ModelAttribute("user") UserDetail user, Model model, @RequestParam String email, 
		@RequestParam String pswd1, @RequestParam String pswd2) 
{
	
	
	if(email.isEmpty() && pswd1.isEmpty() && pswd2.isEmpty())
	{
		String errormsg1 ="*Password or Email fields can't be empty";
		model.addAttribute("errormsg_1",errormsg1);
		return "forgetpassword";
	}
	
	
	else if((pswd1.isEmpty() || pswd2.isEmpty()) && email.matches("^(.+)@(.+)$"))
	{
		String errormsg2 ="*Password  fields can't be empty";
		model.addAttribute("errormsg2",errormsg2);
		return "forgetpassword";
	}
	
	else if(email.matches("^(.+)@(.+)$") &&  pswd2.equals(pswd1)) {
		
		
		
		
		
			
			boolean abc = userservice.getUserByEmail(email);
			
			if(abc)
			{
		int id =	userrepository.findId(email);
		

			UserDetail  userdetail = new UserDetail();
			
			userdetail.setEmail(email);
			userdetail.setId(id);
			userdetail.setPassword(pswd1);
			userservice.SaveUser(userdetail);
				
				
			}
			model.addAttribute("email", email);
			model.addAttribute("pswd2", pswd2);
			return "passwordchangesuccesspage";
			}
	
	else 
	{	
		if(email.matches("^(.+)@(.+)$") &&  pswd1 != pswd2) {
			
		String errormsg3 ="**Entered password  does't match";
		model.addAttribute("errormsg3",errormsg3);
		
	     
		
		}
		return "forgetpassword";
	}
	}
	
@RequestMapping("/addnewuser")
public String AddNewUser(@ModelAttribute("user") UserDetail user, Model model, @RequestParam String email, 
		@RequestParam String password, @RequestParam String firstname, @RequestParam String lastname) 
{
	
	if(password.isEmpty())
	{
		String errormsg ="**Password can't be empty!";
		model.addAttribute("errormsg", errormsg);
		return "newUser";
	}
	else 
	{
	if((!(password.isEmpty())) && email.matches("^(.+)@(.+)$")) {
		
		boolean abc = userservice.getUserByEmail(email);
		if(!(abc)) {
			
			userservice.SaveUser(user);
		}
	}
	return "newUserSuccessPage";
}

}



@RequestMapping("/migration")

public String navigatetonextpage(Model model) {
	
	List<Project>listofproject =projectservice.getAllProject();
	model.addAttribute("listofproject", listofproject);
	
	return "projectpage";

}


		




@RequestMapping("/projectpage")

public String ConfigureDatabaseSuccess(Model model)
{
	
	List<Project>listofproject =projectservice.getAllProject();
	model.addAttribute("listofproject", listofproject);
	return "projectpage";
	
}

}
