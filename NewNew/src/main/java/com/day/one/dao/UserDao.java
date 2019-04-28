package com.day.one.dao;

import com.day.one.vo.UserVO;

public interface UserDao {

//	@Insert("insert into user (id, password, name, userGrade, phoneNumber, intro, confirm) "
//			+ "values (#{id}, #{password}, #{name}, #{userGrade}, #{phoneNumber}, #{intro}, #{confirm})")
//	@Options(useGeneratedKeys = true, keyProperty = "userNumber")
	public void insert(UserVO user);
	
	public UserVO read(int userNumber);
	
	public int delete(int userNumber);
	
	public int update(UserVO user);

	public int checkIDPwd(UserVO dto);

	public UserVO login(UserVO dto);

	public UserVO getVOById(String id);

	public int updateInfo(UserVO vo);
	
}
