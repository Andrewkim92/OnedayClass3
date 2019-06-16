package com.day.one.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.day.one.vo.ProgVO;

@Repository("ProgDao")
public class AdminAnalysisDaoImpl implements AdminAnalysisDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProgVO> getFirstToTenth() {
		return sqlSession.selectList("getFirstToTenth");
	}
	
}
