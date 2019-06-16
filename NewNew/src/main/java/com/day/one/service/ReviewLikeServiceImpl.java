package com.day.one.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.day.one.dao.ReviewLikeDao;
import com.day.one.vo.ReviewLikeVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReviewLikeServiceImpl implements ReviewLikeService {

	@Setter(onMethod_ = @Autowired)
	private ReviewLikeDao rlDao;

	@Override
	public void register(ReviewLikeVO rLike) {
		rlDao.insert(rLike);
	}

	@Override
	public int remove(ReviewLikeVO rLike) {
		// TODO Auto-generated method stub
		return rlDao.delete(rLike);
	}

	@Override
	public ReviewLikeVO readOne(ReviewLikeVO rLike) {
		return rlDao.checkDup(rLike);
	}

	@Override
	public int count(ReviewLikeVO rLike) {
		return rlDao.count(rLike);
	}
	

}
