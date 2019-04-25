package com.day.one.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.day.one.vo.BoardVO;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	@Override
	public void i_insert(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void a_insert(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void r_insert(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO i_read(int seq_class) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO a_read(int seq_class) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO r_read(int seq_class) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int i_delete(int seq_class) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int a_delete(int seq_class) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int r_delete(int seq_class) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int i_update(BoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int a_update(BoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int r_update(BoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
