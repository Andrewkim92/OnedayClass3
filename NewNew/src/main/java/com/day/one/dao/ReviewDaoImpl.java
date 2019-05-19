package com.day.one.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.day.one.vo.ReviewVO;

@Repository("ReviewDao")
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
	
	@Override
	public void insert(ReviewVO review) {
		sqlSession.insert("insert",review);
	};
	
	@Override
	public List<ReviewVO> listAll(int progSeq){
		return sqlSession.selectList("listAll",progSeq);
	};
	
	@Override
	public int update(ReviewVO review) {
		return 0;
	};
	
	@Override
	public int delete(int progSeq, int userNumber) {
		return 0;
	};
	
}
