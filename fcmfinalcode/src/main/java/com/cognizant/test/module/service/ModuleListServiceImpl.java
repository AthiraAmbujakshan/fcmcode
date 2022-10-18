package com.cognizant.test.module.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cognizant.test.module.data.ModuleList;
import com.cognizant.test.module.repo.ModuleListRepository;
@Service
@Transactional
public class ModuleListServiceImpl implements ModuleListService{
	
	@Autowired
	ModuleListRepository modulerepository;

	public List<ModuleList> getAllModules() {
		
		return modulerepository.findAll();
	}

	public ModuleList SaveModule(ModuleList projectmodules) {
		
		
		return modulerepository.save(projectmodules);
		
	}

	public boolean findprojectByProjectName(String projectname) {
		
		
		List<ModuleList>modulespresent = modulerepository.findByProjectname(projectname);
		
		System.out.println(modulespresent);
		
		return true;
		
		
		
	}
	
}
