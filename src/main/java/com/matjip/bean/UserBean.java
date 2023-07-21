package com.matjip.bean;

import lombok.Data;

@Data
public class UserBean {
	public String user_id;
	public String user_pw;
	public String user_pw2;			//	추가
	public String user_name; 
	public String user_phone;
	public String user_email;
	public String userIdExist;		//	추가
}
