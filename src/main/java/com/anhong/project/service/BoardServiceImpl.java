package com.anhong.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anhong.project.dao.BoardDao;
import com.anhong.project.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao boardDao;

	@Override
	public void loginInsert(Board board) throws Exception {
		boardDao.loginInsert(board);
	}

	@Override
	public void update(Board board) throws Exception {
		boardDao.update(board);
	}
	

	@Override
	public void delete(int bno) throws Exception {
		boardDao.delete(bno);
	}

	@Override
	public Board read(int bno) throws Exception {
		return boardDao.read(bno);
	}

	@Override
	public int boardCount() throws Exception {
		return boardDao.boardCount();
	}


	@Override
	public List<Board> listAll() throws Exception {
		return boardDao.listAll();
	}
	
	
}
