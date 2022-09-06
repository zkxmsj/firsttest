package com.fastcampus.app.dao;

import java.util.*;

import com.fastcampus.app.domain.BoardDto;
import com.fastcampus.app.domain.SearchCondition;
public interface BoardDao {
    BoardDto select(int bno);
    int delete(int bno);
    int insert(BoardDto dto);
    int update(BoardDto dto);
    int increaseViewCnt(Integer bno);

    List<BoardDto> selectPage(Map map) ;
    List<BoardDto> selectAll() ;
    //int deleteAll() throws Exception;
    int count() ;
    int updateCommentCnt(int bno,int cnt);
    int searchResultCnt(SearchCondition sc);
    List<BoardDto> searchPage(SearchCondition sc);
}
