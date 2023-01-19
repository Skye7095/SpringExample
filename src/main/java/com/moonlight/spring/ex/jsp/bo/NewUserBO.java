package com.moonlight.spring.ex.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonlight.spring.ex.jsp.dao.NewUserDAO;
import com.moonlight.spring.ex.jsp.model.NewUser;

@Service
public class NewUserBO {
	
	@Autowired
	private NewUserDAO newuserDAO;
	
	public NewUser getLastUser() {
		return newuserDAO.selectLastUser();
	}
	
	public int addUser(
			String name
			, String birthday
			, String email
			, String introduce) {
		
		return newuserDAO.insertUser(name, birthday, email, introduce);
	}
	
	public int addUserByObject(NewUser user) {
		return newuserDAO.insertUserByObject(user);
		
	}
}
