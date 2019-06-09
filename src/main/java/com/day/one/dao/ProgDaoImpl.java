package com.day.one.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.day.one.vo.Criteria;
import com.day.one.vo.ProgVO;

@Repository("ProgDao")
public class ProgDaoImpl implements ProgDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ProgVO read(int progSeq) {
		return sqlSession.selectOne("read",progSeq);
	}

	/*
	 * @Override public List<ProgVO> getList(Criteria cri) { return null; }
	 */

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("getTotalCount");
	}

	@Override
	public List<ProgVO> getListWithPaging(Criteria cri) {
		
		return sqlSession.selectOne("getListWithPaging",cri);
	}
}
