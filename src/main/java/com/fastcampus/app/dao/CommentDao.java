package com.fastcampus.app.dao;

import java.util.List;

import com.fastcampus.app.domain.CommentDto;

public interface CommentDao {

	int deleteAll(int bno);

	int count(int bno);

	int delete(int cno,String commenter);

	int insert(CommentDto commentDto);

	List<CommentDto> selectAll(int bno);

	int update(CommentDto commentDto);

}