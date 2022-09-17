package com.fastcampus.app.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fastcampus.app.dao.BoardDao;
import com.fastcampus.app.domain.BoardDto;
import com.fastcampus.app.domain.SearchCondition;

@Service
public class BoardService {
	@Autowired
	BoardDao boardDao;
	
//	public List<BoardDto> getBoardList(HashMap hashMap){
//		
//		try {
//			return boardDao.selectPage(hashMap);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//	}
	@Transactional(rollbackFor=Exception.class)
	public BoardDto selectBoard(int bno) {
			boardDao.increaseViewCnt(bno);
			return boardDao.select(bno);
		}	
		
	public void registBoard(BoardDto boardDto) {
		boardDao.insert(boardDto);
	}
	public void modifyBoard(BoardDto boardDto) {
			boardDao.update(boardDto);
	}
	public void deleteBoard(int bno) {
		
			boardDao.delete(bno);
		
	}
//	public int getTotal() {
//		try {
//			return boardDao.count();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return 0;
//		}
//	}
	public int getTotal(SearchCondition sc) {
		
			return boardDao.searchResultCnt(sc);
		
	}
public List<BoardDto> getBoardList(SearchCondition sc){
		
			return boardDao.searchPage(sc);
		
	}
}