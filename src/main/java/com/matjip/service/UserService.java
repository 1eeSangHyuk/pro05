package com.matjip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjip.dao.UserDAO;
import com.matjip.dto.UserDTO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	public String checkUserIdExist(String user_id) {
		String user_name = userDAO.checkUserIdExist(user_id);
		if (user_name != null) {
			System.out.println(("service : "+user_name));
		}
		return user_name;
	}
	
	public void testInsert(UserDTO userDTO) {
		for (int i = 1; i<=100; i++) {
			if(i==1) {
				userDTO.setUser_id("admin");
				userDTO.setUser_pw("1234");
				userDTO.setUser_name("관리자");
				userDTO.setUser_phone("010"+randomPhoneGen());
				userDTO.setUser_email("admin@gmail.com");
				userDAO.testInsert(userDTO);
			} else if(1<i && i<41) {
				userDTO.setUser_id("enter"+i);
				userDTO.setUser_pw("1234");
				userDTO.setUser_name("사업자"+i);
				userDTO.setUser_phone("010"+randomPhoneGen());
				userDTO.setUser_email("enter"+i+"@gmail.com");
				userDAO.testInsert(userDTO);
			} else {
				userDTO.setUser_id("user"+i);
				userDTO.setUser_pw("1234");
				userDTO.setUser_name("일반사용자"+i);
				userDTO.setUser_phone("010"+randomPhoneGen());
				userDTO.setUser_email("user"+i+"@gmail.com");
				userDAO.testInsert(userDTO);
			}
		}
	}
	
	public String randomPhoneGen() {
		String p = "";
		for (int j=0;j<8;j++) {
			int i = (int) (Math.random()*10);
			p+=i;
		}
		return p;
	}
}
