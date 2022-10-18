package com.cognizant.test.module.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.test.module.data.Project;
import com.cognizant.test.module.repo.Project_Repository;




@Service


public class ProjectServiceImpl implements ProjectService {

	@Autowired
	Project_Repository projectrepository;
	public List<Project> getAllProject() {
		
		return projectrepository.findAll();
	}

	public Project SaveProject(Project project) {
		
		return projectrepository.save(project);
	}

	public boolean getProjectName(String projectname) {
		Optional <Project>optional = projectrepository.findProjectName(projectname);
		boolean pro;
		
		
		pro = optional.isPresent();
		
		if(pro) {
		System.out.println("project name exists");
		
		
		}
		return pro;
	}
		
		
		
	
	}


