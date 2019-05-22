package com.day.one.dao;

import java.util.List;

import com.day.one.vo.ReviewVO;

public interface ReviewDao {
	
	public void insert(ReviewVO review);
	
	public List<ReviewVO> listAll(int progSeq);
	
	public int update(ReviewVO review);
	
	public int delete(ReviewVO review);
	
	public int count(int progSeq);
	
}
