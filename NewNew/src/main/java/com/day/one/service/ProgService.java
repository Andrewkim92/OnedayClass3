package com.day.one.service;

import com.day.one.vo.ProgVO;

public interface ProgService {
	
	public void register(ProgVO prog);
	
	public ProgVO get(int userNumber);
	
	public int modify(ProgVO prog);
	
	public int remove(int userNumber);

}
