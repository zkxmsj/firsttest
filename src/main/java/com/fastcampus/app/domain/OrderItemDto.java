package com.fastcampus.app.domain;

public class OrderItemDto {
	private Integer pno;
	private Integer amount;
	private Integer productPrice;
	private Integer totalPrice;
	private String productName;
	
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Override
	public String toString() {
		return "OrderItemDto [pno=" + pno + ", amount=" + amount + ", productPrice=" + productPrice + ", totalPrice="
				+ totalPrice + ", productName=" + productName + "]";
	}
	
	
	
	
	
	
	
}
