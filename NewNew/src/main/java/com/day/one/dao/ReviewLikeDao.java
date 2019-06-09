package com.day.one.dao;

import com.day.one.vo.ReviewLikeVO;

public interface ReviewLikeDao {
	
	public void insert(ReviewLikeVO rLike);
	
	public ReviewLikeVO checkDup(ReviewLikeVO rLike);
	
	public int delete(ReviewLikeVO rLike);
	
}
