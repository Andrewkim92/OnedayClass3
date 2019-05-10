package com.day.one.dao;

import com.day.one.vo.ProgVO;

public interface ProgDao {

	public void insert(ProgVO prog);
	
	public ProgVO read(int userNumber);
	
	public int update(ProgVO prog);
	
	public int delete(int userNumber);
	
}
