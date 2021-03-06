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
	public List<ReviewVO> listAll(ReviewVO review){
		return sqlSession.selectList("listAll",review);
	};
	
	@Override
	public int count(int program_progSeq) {
		return sqlSession.selectOne("count",program_progSeq);
	}
	
	@Override
	public int update(ReviewVO review) {
		return sqlSession.update("update",review);
	};
	
	@Override
	public int delete(ReviewVO review) {
		return sqlSession.delete("delete",review);
	}

	@Override
	public float rateAvg(int program_progSeq) {
		return sqlSession.selectOne("rateAvg",program_progSeq);
	}

	@Override
	public ReviewVO readOne(ReviewVO review) {
		return sqlSession.selectOne("readOne",review);
	}

	@Override
	public List<ReviewVO> listMy(int user_userNumber) {
		return sqlSession.selectList("listMy",user_userNumber);
	}

	@Override
	public String readName(int user_userNumber) {
		return sqlSession.selectOne("readName",user_userNumber);
	}

	@Override
	public int likeUpdate(ReviewVO review) {
		return sqlSession.update("likeUpdate",review);
	}

	@Override
	public ReviewVO getFirstOne(ReviewVO review) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getFirstOne",review);
	}

	
}
