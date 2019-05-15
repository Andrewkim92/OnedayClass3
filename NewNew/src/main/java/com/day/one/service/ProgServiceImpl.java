package com.day.one.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.day.one.dao.ProgDao;
import com.day.one.vo.ProgVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ProgServiceImpl implements ProgService{

	@Setter(onMethod_ = @Autowired)
	private ProgDao pDao;
	
	@Override
	public void register(ProgVO prog) {
		// TODO Auto-generated method stub
		pDao.insert(prog);
	}

	@Override
	public ProgVO get(int userNumber) {
		// TODO Auto-generated method stub
		return pDao.read(userNumber);
	}

	@Override
	public int modify(ProgVO prog) {
		// TODO Auto-generated method stub
		return pDao.update(prog);
	}

	@Override
	public int remove(int userNumber) {
		// TODO Auto-generated method stub
		return pDao.delete(userNumber);
	}

}
