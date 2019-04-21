package com.day.one.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.day.one.vo.UserVO;

@Repository("UserDao")
public class UserDaoImpl implements UserDao{

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
	
	@Override
	public void insert(UserVO user) {
		sqlSession.insert("insert", user);
		
	}

	@Override
	public UserVO read(int userNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int userNumber) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(UserVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkIDPwd(UserVO dto) {
		return sqlSession.selectOne("checkIDPwd", dto);
	}

	@Override
	public UserVO login(UserVO dto) {
		return sqlSession.selectOne("login", dto);
	}

}
