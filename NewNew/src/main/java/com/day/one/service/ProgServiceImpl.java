package com.day.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.day.one.dao.ProgDao;
import com.day.one.vo.Criteria;
import com.day.one.vo.ProgVO;

import lombok.Setter;

@Service
//@AllArgsConstructor
public class ProgServiceImpl implements ProgService{

	@Setter(onMethod_ = @Autowired)
	private ProgDao pDao;
	
	@Override
	public ProgVO get(int progSeq) {
		return pDao.read(progSeq);
	}

	@Override
	public List<ProgVO> getList(Criteria cri) {
		return pDao.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return pDao.getTotalCount(cri);
	}
}
