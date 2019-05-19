package com.day.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.day.one.dao.ReviewDao;
import com.day.one.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewDao rDao;
	
	@Override
	public void register(ReviewVO review) {
		// TODO Auto-generated method stub
		rDao.insert(review);
	}

	@Override
	public List<ReviewVO> getAll(int progSeq) {
		// TODO Auto-generated method stub
		return rDao.listAll(progSeq);
	}

	@Override
	public int modify(ReviewVO review) {
		// TODO Auto-generated method stub
		return rDao.update(review);
	}

	@Override
	public int remove(int progSeq, int userNumber) {
		// TODO Auto-generated method stub
		return rDao.delete(progSeq, userNumber);
	}

}
