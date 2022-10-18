package com.cognizant.test.module.repo;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cognizant.test.module.data.ModuleList;

@Repository
public interface ModuleListRepository extends JpaRepository<ModuleList,Integer> {
	
	@Query("select modulename from ModuleList where projectname = ?")

	List<ModuleList>  findByProjectname(String projectname);

}
