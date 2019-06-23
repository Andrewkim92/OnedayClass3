package com.day.one.dao;

import java.util.List;

import com.day.one.vo.ReviewVO;

public interface ReviewDao {
	
	public void insert(ReviewVO review);
	
	public List<ReviewVO> listAll(ReviewVO review);
	
	public List<ReviewVO> listMy(int user_userNumber);	
	
	public int update(ReviewVO review);
	
	public int delete(ReviewVO review);
	
	public int count(int program_progSeq);
	
	public float rateAvg(int program_progSeq);
	
	public ReviewVO readOne(ReviewVO review);

	public ReviewVO getFirstOne(ReviewVO review);

	public String readName(int user_userNumber);
	
	public int likeUpdate(ReviewVO review);

	
}
