package com.anhong.project.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.anhong.project.vo.Board;

public interface BoardDao {
	public void loginInsert(Board board) throws DataAccessException;
	public void update(Board board) throws DataAccessException;
	public void delete(int bno) throws DataAccessException;
	public Board read(int bno) throws DataAccessException;
	public int boardCount() throws DataAccessException;
	public List<Board> listAll() throws DataAccessException;
}
