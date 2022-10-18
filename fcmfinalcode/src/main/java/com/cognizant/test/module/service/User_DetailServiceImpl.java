package com.cognizant.test.module.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cognizant.test.module.data.UserDetail;
import com.cognizant.test.module.repo.UserDetailRepository;





@Service
@Transactional
public class User_DetailServiceImpl  implements User_DetailService {
	
	
	@Autowired
	UserDetailRepository userrepository;

	public List<UserDetail> getAllUser() {
		
		return userrepository.findAll();
	}

	public UserDetail SaveUser(UserDetail user) {
		
		return userrepository.save(user);
	}

	public UserDetail getUserById(int id) {
		Optional <UserDetail>optional = userrepository.findById(id);
		UserDetail pro;
		
		
		pro = optional.get();
		
		return pro;

}

	public boolean getUserByEmail(String email) {
		Optional <UserDetail>optional = userrepository.findByEmail(email);
		boolean pro;
		
		
		pro = optional.isPresent();
		
		if(pro) {
		System.out.println(pro);
		System.out.println("-----");
	System.out.println(userrepository.findUser(email));
		userrepository.findId(email);
		
		}
		return pro;
	}


}
