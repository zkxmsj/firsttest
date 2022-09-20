package com.fastcampus.app.dao;

import java.util.List;

import com.fastcampus.app.domain.ReviewDto;

public interface ReviewDao {
	public List<ReviewDto> selectAll(Integer pno);
	public int insert(ReviewDto dto);
	public int review(int orderno);
}
