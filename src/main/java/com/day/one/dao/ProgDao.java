package com.day.one.dao;

import java.util.List;

import com.day.one.vo.Criteria;
import com.day.one.vo.ProgVO;

public interface ProgDao {
	//get
	public ProgVO read(int progSeq);
	
	//list
	//public List<ProgVO> getList(Criteria cri);
	
	//총 프로그램 수
	public int getTotalCount();
	
	public List<ProgVO> getListWithPaging(Criteria cri);
}
