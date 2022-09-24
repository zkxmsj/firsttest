package com.fastcampus.app.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fastcampus.app.dao.NoticeDao;
import com.fastcampus.app.domain.NoticeDto;
import com.fastcampus.app.domain.SearchCondition;

@Service
public class NoticeService {
	@Autowired
	NoticeDao NoticeDao;
	
//	public List<NoticeDto> getBoardList(HashMap hashMap){
//		
//		try {
//			return NoticeDao.selectPage(hashMap);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//	}
	@Transactional(rollbackFor=Exception.class)
	public NoticeDto selectBoard(int bno) {
			NoticeDao.increaseViewCnt(bno);
			return NoticeDao.select(bno);
		}	
		
	public void registBoard(NoticeDto NoticeDto) {
		NoticeDao.insert(NoticeDto);
	}
	public void modifyBoard(NoticeDto NoticeDto) {
			NoticeDao.update(NoticeDto);
	}
	public void deleteBoard(int bno) {
		
			NoticeDao.delete(bno);
		
	}
//	public int getTotal() {
//		try {
//			return NoticeDao.count();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return 0;
//		}
//	}
	public int getTotal(SearchCondition sc) {
		
			return NoticeDao.searchResultCnt(sc);
		
	}
public List<NoticeDto> getBoardList(SearchCondition sc){
		
			return NoticeDao.searchPage(sc);
		
	}
}