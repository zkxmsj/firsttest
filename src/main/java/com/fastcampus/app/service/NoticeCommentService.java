package com.fastcampus.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fastcampus.app.dao.BoardDao;
import com.fastcampus.app.dao.CommentDao;
import com.fastcampus.app.dao.NoticeCommentDao;
import com.fastcampus.app.dao.NoticeDao;
import com.fastcampus.app.domain.CommentDto;
import com.fastcampus.app.domain.NoticeCommentDto;

@Service
public class NoticeCommentService {
	@Autowired
	NoticeDao noticeDao;
	@Autowired
	NoticeCommentDao commentDao;
	
	@Transactional(rollbackFor = Exception.class)
	public int removeCnt(int cno,int bno,String commenter) {
		int rowCnt = noticeDao.updateCommentCnt(bno,-1);
		rowCnt = commentDao.delete(cno);
		return rowCnt;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int write(NoticeCommentDto commentDto) {
		noticeDao.updateCommentCnt(commentDto.getBno(), 1);
		return commentDao.insert(commentDto);
	}
	
	public List<NoticeCommentDto> getList(int bno){
		return commentDao.selectAll(bno);
	}
	
	public int update(NoticeCommentDto dto) {
		return commentDao.update(dto);
	}
}
