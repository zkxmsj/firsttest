package com.fastcampus.app.domain;

public class SearchCondition {
	Integer pageNum=1;
	Integer size=10;
	String keyword="";
	String option="";
	
	
	
	public SearchCondition() {}
	public SearchCondition(Integer pageNum,Integer size,String keyword, String option) {
		super();
		this.size = size;
		this.pageNum = pageNum;
		this.keyword = keyword;
		this.option = option;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public Integer getOffset() {
        return (pageNum-1)*size;
    }
	@Override
	public String toString() {
		return "SearchCondition [pageNum=" + pageNum + ", size=" + size + ", keyword=" + keyword + ", option=" + option
				+ "]";
	}
	
	
	
}
