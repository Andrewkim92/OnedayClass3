package com.day.one.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.day.one.vo.ReviewLikeVO;
import com.day.one.vo.ReviewVO;

@Repository("ReviewLikeDao")
public class ReviewLikeDaoImpl implements ReviewLikeDao {
	
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
	
	@Override
	public void insert(ReviewLikeVO rLike) {
		sqlSession.insert("insert",rLike);
	}

	@Override
	public int checkDup(ReviewLikeVO rLike) {
		return sqlSession.selectOne("checkDup",rLike);
	}

	@Override
	public int delete(ReviewLikeVO rLike) {
		return sqlSession.delete("delete",rLike);
	}
	

}
