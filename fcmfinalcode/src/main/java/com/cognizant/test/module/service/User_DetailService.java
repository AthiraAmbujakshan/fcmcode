package com.cognizant.test.module.service;

import java.util.List;

import com.cognizant.test.module.data.UserDetail;



public interface User_DetailService {

	
	List<UserDetail>getAllUser();
	UserDetail SaveUser(UserDetail user);
	UserDetail getUserById(int  id);
	boolean getUserByEmail(String email);
	
}
