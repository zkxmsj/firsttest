package com.fastcampus.app.domain;

import java.util.Date;

public class CommentDto {
	private Integer cno;
	private Integer bno;
	private Integer pcno;
	private String comment;
	private String commenter;
	private Date reg_date;
	
	
	public CommentDto() {}
	public CommentDto(Integer bno,String comment) {
		this.bno = bno;
		this.comment = comment;
		
	}
	public CommentDto(Integer bno, Integer pcno, String comment, String commenter) {
		super();
		this.bno = bno;
		this.pcno = pcno;
		this.comment = comment;
		this.commenter = commenter;
	}
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Integer getPcno() {
		return pcno;
	}
	public void setPcno(Integer pcno) {
		this.pcno = pcno;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "CommentDto [cno=" + cno + ", bno=" + bno + ", pcno=" + pcno + ", comment=" + comment + ", commenter="
				+ commenter + ", reg_date=" + reg_date + "]";
	}
	
	
	
}
