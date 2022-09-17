package com.fastcampus.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fastcampus.app.domain.BoardDto;
import com.fastcampus.app.domain.SearchCondition;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	private String namespace = "com.fastcampus.app.BoardDao.";
	
	@Override
	public BoardDto select(int bno){
		return session.selectOne(namespace+"select",bno);
	}

	@Override
	public int delete(int bno){
		
		return session.delete(namespace+"delete",bno);
	}

	@Override
	public int insert(BoardDto dto) {
		return session.insert(namespace+"insert",dto);
	}

	@Override
	public int update(BoardDto dto) {
		// TODO Auto-generated method stub
		return session.update(namespace+"update",dto);
	}

	@Override
	public int increaseViewCnt(Integer bno) {
		// TODO Auto-generated method stub
		return session.update(namespace+"increaseViewCnt",bno);
	}

	@Override
	public List<BoardDto> selectAll() {
		return session.selectList(namespace+"selectAll");
	}

	@Override
	public List<BoardDto> selectPage(Map map){
		return session.selectList(namespace+"selectPage",map);
	}

	@Override
	public int count() {
		return session.selectOne(namespace+"count");
	}
	@Override
	public List<BoardDto> searchPage(SearchCondition sc){
		return session.selectList(namespace+"searchSelectPage",sc);
	}

	@Override
	public int searchResultCnt(SearchCondition sc){
		return session.selectOne(namespace+"searchResultCnt",sc);
	}

	@Override
	public int updateCommentCnt(int bno,int cnt) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("cnt",cnt);
		map.put("bno",bno);
		return session.update(namespace+"updateCommentCnt", map);
	}

}
