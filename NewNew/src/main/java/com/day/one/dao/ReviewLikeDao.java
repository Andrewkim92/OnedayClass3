package com.day.one.dao;

import com.day.one.vo.ReviewLikeVO;

public interface ReviewLikeDao {
	
	public void insert(ReviewLikeVO rLike);
	
	public int checkDup(ReviewLikeVO rLike);
	
	public int delete(ReviewLikeVO rLike);
	
}
