package com.cognizant.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


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
import com.cognizant.test.module.repo.ModuleListRepository;
import com.cognizant.test.module.service.ModuleListService;
import com.cognizant.test.module.service.ProjectService;


@Controller
public class HomeController {
  
	@Autowired
	ProjectService projectservice;
	
	@Autowired
	ModuleListService moduleservice;
	
	@Autowired
	ModuleListRepository modulerepository;
	
	
	@RequestMapping(method = RequestMethod.POST, value ="/saveproject")
	public String SaveProject ( @ModelAttribute("project") Project project,@RequestParam String projectname, Model model) {
		
		
		
		
		
		
		boolean abc = projectservice.getProjectName(projectname);
		if(abc) {
			String errormsg = "**" + projectname +" already exists";
			model.addAttribute("errormsg", errormsg);
			return "projectnotexistspage";
		}
		else if (projectname.isEmpty()) {
			String errormsg1 = "**  field  cannot be empty";
			model.addAttribute("errormsg1", errormsg1);
			return "projectnotexistspage";
		}
		else {
			projectservice.SaveProject(project);
			
			
			String arrow =">";
			
			model.addAttribute("arrow", arrow);
			
			List<Project>listofproject =projectservice.getAllProject();
			model.addAttribute("listofproject", listofproject);
			
			
			
			
			
			
			return "projectpage";
			
		}
		
		
		
		
		
	}
	
	
	@RequestMapping(method = RequestMethod.POST, value ="/open")
	public String OpenProject ( @ModelAttribute("project") Project project,@RequestParam String dropdown, Model model) {	
	
		
		String selectedproject = dropdown;
		String arrow1 =">";
		model.addAttribute("arrow1",arrow1);
		model.addAttribute("selectedproject",selectedproject);
		String setting ="Setting";
		String moduleheading ="Module";
		String modulearowonopen =">";
		String addmodulelink ="Add Modules";
		model.addAttribute("addmodulelink",addmodulelink);
		model.addAttribute("modulearowonopen",modulearowonopen);
		model.addAttribute("moduleheading",moduleheading);
		model.addAttribute("setting",setting);
		
		
			
		List<Project>listofproject =projectservice.getAllProject();
		model.addAttribute("listofproject", listofproject);
		
		List<ModuleList> modulespresent = modulerepository.findByProjectname(dropdown);
		model.addAttribute("modulespresent", modulespresent);
		
		return "projectpage";
	}
	
	
	@RequestMapping(value = "/addmodules",method = RequestMethod.POST)
	@ResponseBody
	public List<ModuleList> AddModules(@RequestBody List<ModuleList>modules){

	String modulelist =" ";
	String Projectname ="";
	for(ModuleList str : modules) {
	modulelist = modulelist +str.getModulename() +",";
	Projectname =str.getProjectname();
	
	}
	String moduledetail=modulelist.substring(0,modulelist.length()-6);

	moduledetail = moduledetail +"," + Projectname;


	String seperatedmodules[] = moduledetail.split(",");


	for(int i=0; i<seperatedmodules.length-1; i++) {
	ModuleList projectmodules = new ModuleList();
	projectmodules.setModulename(seperatedmodules[i]);
	projectmodules.setProjectname(seperatedmodules[seperatedmodules.length-1]);
	
	moduleservice.SaveModule(projectmodules);
	}

	moduleservice.findprojectByProjectName(Projectname);
	List<ModuleList> modulespresent = modulerepository.findByProjectname(Projectname);
	


	return modulespresent;








	}
	
	

	
	

}

