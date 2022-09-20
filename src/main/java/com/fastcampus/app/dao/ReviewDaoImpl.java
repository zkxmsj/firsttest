 package com.fastcampus.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fastcampus.app.domain.CommentDto;
import com.fastcampus.app.domain.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{

		@Autowired
		private SqlSession session;
		private String namespace = "com.fastcampus.app.ReviewDao.";
		



		@Override
		public List<ReviewDto> selectAll(Integer pno) {
			// TODO Auto-generated method stub
			return session.selectList(namespace+"selectAll",pno );
		}




		@Override
		public int insert(ReviewDto dto) {
			// TODO Auto-generated method stub
			return session.insert(namespace+"insert", dto);
		}




		@Override
		public int review(int orderno) {
			// TODO Auto-generated method stub
			return session.update(namespace+"review",orderno);
		}
}