package com.fastcampus.app.dao;

import java.util.*;

import com.fastcampus.app.domain.NoticeDto;
import com.fastcampus.app.domain.SearchCondition;
public interface NoticeDao {
    NoticeDto select(int bno);
    int delete(int bno);
    int insert(NoticeDto dto);
    int update(NoticeDto dto);
    int increaseViewCnt(Integer bno);

    List<NoticeDto> selectPage(Map map) ;
    List<NoticeDto> selectAll() ;
    //int deleteAll() throws Exception;
    int count() ;
    int updateCommentCnt(int bno,int cnt);
    int searchResultCnt(SearchCondition sc);
    List<NoticeDto> searchPage(SearchCondition sc);
}
