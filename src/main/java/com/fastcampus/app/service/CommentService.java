package com.fastcampus.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fastcampus.app.dao.BoardDao;
import com.fastcampus.app.dao.CommentDao;
import com.fastcampus.app.domain.CommentDto;

@Service
public class CommentService {
	@Autowired
	BoardDao boardDao;
	@Autowired
	CommentDao commentDao;
	
	@Transactional(rollbackFor = Exception.class)
	public int removeCnt(int cno,int bno,String commenter) {
		int rowCnt = boardDao.updateCommentCnt(bno,-1);
		System.out.println(rowCnt);
		rowCnt = commentDao.delete(cno,commenter);
		System.out.println(rowCnt);
		return rowCnt;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int write(CommentDto commentDto) {
		boardDao.updateCommentCnt(commentDto.getBno(), 1);
		return commentDao.insert(commentDto);
	}
	
	public List<CommentDto> getList(int bno){
		return commentDao.selectAll(bno);
	}
}
