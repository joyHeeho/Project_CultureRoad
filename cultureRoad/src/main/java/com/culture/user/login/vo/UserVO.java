package com.culture.user.login.vo;

import lombok.Data;

@Data
public class UserVO {
	private int userNo;
	private String userId;
	private String userPw ="";
	private String userName;
	private String userEmail="";
	private String userPhone="";
	private String userBirth;
	private String userType;
	private String userDate;
	private int userDelete;
}
