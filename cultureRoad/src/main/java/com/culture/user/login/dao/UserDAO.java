package com.culture.user.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.culture.user.login.vo.UserVO;

@Mapper
public interface UserDAO {
	public UserVO userLogin(UserVO uvo);
	public int signUp(UserVO uvo);
	public int idChk(UserVO uvo);
	public int updateMyPage(UserVO uvo);
	public int pwChk(UserVO uvo);
	public UserVO myPage(UserVO uvo);
	public int deleteAccount(UserVO uvo);
}
