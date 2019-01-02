package com.anhong.project.service;

import java.util.List;

import com.anhong.project.vo.Board;

public interface BoardService {
	public void loginInsert(Board board) throws Exception;
	public void update(Board board) throws Exception;
	public void delete(int bno) throws Exception;
	public Board read(int bno) throws Exception;
	public int boardCount() throws Exception;
	public List<Board> listAll() throws Exception;
}
