package com.day.one.service;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;


import com.day.one.dao.UserDao;
import com.day.one.vo.UserVO;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {
 
    @Resource(name="UserDao")
    private UserDao dao;

	@Override
	public void insert(UserVO user) {
		dao.insert(user);
	}

	@Override
	public UserVO read(int userNumber) {
		return dao.read(userNumber);
	}

	@Override
	public int delete(int userNumber) {
		return dao.delete(userNumber);
	}

	@Override
	public int update(UserVO user) {
		return dao.update(user);
	}

	@Override
	public int checkIDPwd(UserVO dto) {
		return dao.checkIDPwd(dto);
	}

	@Override
	public UserVO login(UserVO dto) {
		return dao.login(dto);
	}
}
