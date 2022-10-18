package com.cognizant.test.module.repo;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cognizant.test.module.data.UserDetail;

@Repository
public interface UserDetailRepository extends JpaRepository<UserDetail,Integer>{

	Optional<UserDetail> findById(int id);

	Optional<UserDetail> findByEmail(String email);
	
	
	@Query("select password from UserDetail where email = ?")	
	String findUser(String email);

	
	
@Query("select id from UserDetail where email =?")
int  findId(String email);
}
