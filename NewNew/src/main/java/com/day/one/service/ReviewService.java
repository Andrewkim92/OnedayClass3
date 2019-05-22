package com.day.one.service;

import java.util.List;

import com.day.one.vo.ReviewVO;

public interface ReviewService {
	
	public void register(ReviewVO review);
	
	public List<ReviewVO> getAll(int progSeq);
	
	public int modify(ReviewVO review);
	
	public int remove(ReviewVO review);
	
	public int count(int progSeq);
}
