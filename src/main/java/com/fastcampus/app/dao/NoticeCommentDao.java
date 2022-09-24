package com.fastcampus.app.dao;

import java.util.List;

import com.fastcampus.app.domain.NoticeCommentDto;

public interface NoticeCommentDao {

	int deleteAll(int bno);

	int count(int bno);

	int delete(int cno);

	int insert(NoticeCommentDto NoticeNoticeCommentDto);

	List<NoticeCommentDto> selectAll(int bno);

	int update(NoticeCommentDto NoticeNoticeCommentDto);

}