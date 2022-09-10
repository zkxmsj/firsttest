package com.fastcampus.app.domain;

import java.util.List;

public class OrderDto {
	private Integer orderno;
	private String userId;
	private String orderAddr1;
	private String orderAddr2;
	private String orderAddr3;
	private String orderName;
	private List<OrderItemDto> orders;
	
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
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
	public List<OrderItemDto> getOrders() {
		return orders;
	}
	public void setOrders(List<OrderItemDto> orders) {
		this.orders = orders;
	}
	@Override
	public String toString() {
		return "OrderDto [orderno=" + orderno + ", userId=" + userId + ", orderAddr1=" + orderAddr1 + ", orderAddr2="
				+ orderAddr2 + ", orderAddr3=" + orderAddr3 + ", orderName=" + orderName + ", orders=" + orders + "]";
	}

	
	
}
