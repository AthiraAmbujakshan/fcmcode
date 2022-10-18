package com.cognizant.test.module.service;

import java.util.List;

import com.cognizant.test.module.data.ModuleList;

public interface ModuleListService {

	
	List<ModuleList>getAllModules();
	ModuleList SaveModule(ModuleList module);
	boolean findprojectByProjectName(String projectname);
	
}
