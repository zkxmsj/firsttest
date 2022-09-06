 package com.fastcampus.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fastcampus.app.domain.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao{

		@Autowired
		private SqlSession session;
		private String namespace = "com.fastcampus.app.CommentDao.";
		
		@Override
		public int deleteAll(int bno){
			return session.delete(namespace+"deleteAll",bno);
		}
		@Override
		public int count(int bno) {
			return session.selectOne(namespace+"count", bno);
		}
		 public int delete(int cno) {
		        Map map = new HashMap();
		          return session.delete(namespace+"delete", cno);
		    } 
		@Override
		public int insert(CommentDto commentDto) {
			return session.insert(namespace+"insert", commentDto);
		}
		@Override
		public List<CommentDto> selectAll(int bno) {
			return session.selectList(namespace+"selectAll",bno );
		}
		@Override
		public int update(CommentDto commentDto) {
			return session.update(namespace+"update", commentDto);
		}
}