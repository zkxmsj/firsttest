package com.fastcampus.app.domain;

import java.util.Date;

public class ReviewDto {
	private Integer cno;
	private Integer pno;
	private String comment;
	private String commenter;
	private Date reg_date;
	private String Image;
	
	
	public ReviewDto() {}
	public ReviewDto(Integer pno,String comment) {
		this.pno = pno;
		this.comment = comment;
		
	}
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
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
		return "CommentDto [cno=" + cno + ", pno=" + pno + ", comment=" + comment + ", commenter="
				+ commenter + ", reg_date=" + reg_date + "]";
	}
	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	
	
	
}
