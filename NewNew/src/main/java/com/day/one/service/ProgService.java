package com.day.one.service;

import java.util.List;

import com.day.one.vo.Criteria;
import com.day.one.vo.ProgVO;

public interface ProgService {
	
	public ProgVO get(int progSeq);
	
	public int insert(ProgVO prog);
	
	//public List<ProgVO> getList(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public List<ProgVO> getListWithPaging(Criteria cri);
}
