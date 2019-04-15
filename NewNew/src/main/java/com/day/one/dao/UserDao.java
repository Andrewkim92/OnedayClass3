package com.day.one.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

import com.day.one.vo.UserVO;



public interface UserDao {

//	@Insert("insert into user (id, password, name, userGrade, phoneNumber, intro, confirm) "
//			+ "values (#{id}, #{password}, #{name}, #{userGrade}, #{phoneNumber}, #{intro}, #{confirm})")
//	@Options(useGeneratedKeys = true, keyProperty = "userNumber")
	public void insert(UserVO user);
	
	public UserVO read(int userNumber);
	
	public int delete(int userNumber);
	
	public int update(UserVO user);
	
}
