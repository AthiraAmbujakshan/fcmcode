package com.cognizant.test.module.data;



@Entity
@Table(name="projects_modules")
public class ModuleList {

	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private int id;
	private String modulename;
	private String projectname;
	
	
	public ModuleList() {
		
	}


	public ModuleList(int id, String modulename, String projectname) {
		super();
		this.id = id;
		this.modulename = modulename;
		this.projectname = projectname;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getModulename() {
		return modulename;
	}


	public void setModulename(String modulename) {
		this.modulename = modulename;
	}


	public String getProjectname() {
		return projectname;
	}


	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
}
