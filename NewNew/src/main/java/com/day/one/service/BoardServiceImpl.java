package com.day.one.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.day.one.dao.BoardDao;
import com.day.one.service.BoardService;
import com.day.one.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
 
    @Resource(name="boardDao")
    private BoardDao dao;

	@Override
	public void registerBoard(BoardVO boardVO) {
		
		
	}
}
