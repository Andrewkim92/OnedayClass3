package com.day.one.service;

import java.util.List;

import com.day.one.vo.ReviewVO;

public interface ReviewService {
	
	public void register(ReviewVO review);
	
	public List<ReviewVO> getAll(ReviewVO review);
	
	public List<ReviewVO> getMy(int user_userNumber);
	
	public int modify(ReviewVO review);
	
	public int remove(ReviewVO review);
	
	public int count(int program_progSeq);
	
	public float rateAvg(int program_progSeq);
	
	public ReviewVO readOne(ReviewVO review);
	
	public ReviewVO getOne(ReviewVO review);

	public String readUserName(int user_userNumber);
	
	public int likeCount(ReviewVO review);
}
