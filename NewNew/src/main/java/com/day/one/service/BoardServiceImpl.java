package com.day.one.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.day.one.dao.BoardDao;
import com.day.one.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
 
    @Resource(name="boardDao")
    private BoardDao dao;

	@Override
	public String test(int id) {
		return dao.checkId(id);
	}
}
