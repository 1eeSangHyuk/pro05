package com.matjip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjip.dao.UserDAO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	public String checkUserIdExist(String user_id) {
		System.out.println(("service : "+userDAO.checkUserIdExist(user_id)));
		return userDAO.checkUserIdExist(user_id);
	}
}
