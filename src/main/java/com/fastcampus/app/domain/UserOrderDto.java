package com.fastcampus.app.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserOrderDto {
	private Integer orderno;
	private String userId;
	private String orderAddr1;
	private String orderAddr2;
	private String orderAddr3;
	private String orderName;
	private String userName;
	private Integer pno;
	private Integer amount;
	private Integer productPrice;
	private Integer totalPrice;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	private String productName;
	private String state;
	private String review;
	
	public Integer getOrderno() {
		return orderno;
	}
	public void setOrderno(Integer orderno) {
		this.orderno = orderno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderAddr1() {
		return orderAddr1;
	}
	public void setOrderAddr1(String orderAddr1) {
		this.orderAddr1 = orderAddr1;
	}
	public String getOrderAddr2() {
		return orderAddr2;
	}
	public void setOrderAddr2(String orderAddr2) {
		this.orderAddr2 = orderAddr2;
	}
	public String getOrderAddr3() {
		return orderAddr3;
	}
	public void setOrderAddr3(String orderAddr3) {
		this.orderAddr3 = orderAddr3;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	@Override
	public String toString() {
		return "UserOrderDto [orderno=" + orderno + ", userId=" + userId + ", orderAddr1=" + orderAddr1
				+ ", orderAddr2=" + orderAddr2 + ", orderAddr3=" + orderAddr3 + ", orderName=" + orderName
				+ ", userName=" + userName + ", pno=" + pno + ", amount=" + amount + ", productPrice=" + productPrice
				+ ", totalPrice=" + totalPrice + ", reg_date=" + reg_date + ", productName=" + productName + ", state="
				+ state + "]";
	}
	
	
	
	
	
}
