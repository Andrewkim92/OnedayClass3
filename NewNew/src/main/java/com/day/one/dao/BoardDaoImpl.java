package com.day.one.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;

//	private static final String namespace="org."
	
	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
	
	@Override
	public String checkId(int id) {
		return sqlSession.selectOne("checkId", id);
	}
}
