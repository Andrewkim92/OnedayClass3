package com.day.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.day.one.dao.AdminAnalysisDao;
import com.day.one.vo.ProgVO;

import lombok.Setter;

@Service
public class AdminAnalysisServiceImpl implements AdminAnalysisService {

	@Setter(onMethod_ = @Autowired)
	private AdminAnalysisDao adminDao;
	
	@Override
	public List<ProgVO> getFirstToTenth() {
		return adminDao.getFirstToTenth();
	}
	
}
