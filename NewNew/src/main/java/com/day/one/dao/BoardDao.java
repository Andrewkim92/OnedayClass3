package com.day.one.dao;

import com.day.one.vo.BoardVO;

public interface BoardDao {

	// info 테이블
	public void i_insert(BoardVO board);
	// applicant 테이블
	public void a_insert(BoardVO board);
	// review 테이블
	public void r_insert(BoardVO board);
	
	public BoardVO i_read(int seq_class);
	
	public BoardVO a_read(int seq_class);
	
	public BoardVO r_read(int seq_class);
	
	public int i_delete(int seq_class);
	
	public int a_delete(int seq_class);
	
	public int r_delete(int seq_class);
	
	public int i_update(BoardVO board);
	
	public int a_update(BoardVO board);
	
	public int r_update(BoardVO board);
	
}
