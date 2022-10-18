package com.cognizant.test.module.service;

import java.util.List;

import com.cognizant.test.module.data.Project;
public interface ProjectService {

	
	List<Project>getAllProject();
	Project SaveProject(Project project);
	boolean getProjectName(String projectname);
	
}
