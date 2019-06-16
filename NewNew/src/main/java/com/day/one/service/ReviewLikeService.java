package com.day.one.service;

import java.util.List;

import com.day.one.vo.ReviewLikeVO;

public interface ReviewLikeService {
	
	public void register(ReviewLikeVO rLike);
	
	public int remove(ReviewLikeVO rLike);
	
	public ReviewLikeVO readOne(ReviewLikeVO rLike);
	
	public int count(ReviewLikeVO rLike);

}
