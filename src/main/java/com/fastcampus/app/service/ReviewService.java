package com.fastcampus.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fastcampus.app.dao.ReviewDao;
import com.fastcampus.app.domain.CommentDto;
import com.fastcampus.app.domain.ReviewDto;
@Service
public class ReviewService {
	@Autowired
	ReviewDao dao;
	
	public List<ReviewDto> selectAll(Integer pno){
		return dao.selectAll(pno);
	}
	@Transactional
	public void insert(ReviewDto dto,int orderno) {
		dao.review(orderno);
		dao.insert(dto);
		
	}
	public int update(ReviewDto dto) {
		return dao.update(dto);
	}
	public int delete(int cno) {
		return dao.delete(cno);
	}
}
