package com.cognizant.test.module.data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="projectsinfo")
public class Projects {

	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private int id;
	private String projectname;
	
	public Project() {
		
		
	}

	public Project(int id, String projectname) {
		super();
		this.id = id;
		this.projectname = projectname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

}
