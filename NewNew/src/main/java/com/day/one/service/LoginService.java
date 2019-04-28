package com.day.one.service;

import com.day.one.vo.UserVO;

public interface LoginService {

public void insert(UserVO user);
	
	public UserVO read(int userNumber);
	
	public int delete(int userNumber);
	
	public int update(UserVO user);

	public int checkIDPwd(UserVO dto);

	public UserVO login(UserVO dto);
		
}
