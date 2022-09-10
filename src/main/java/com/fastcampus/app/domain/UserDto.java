package com.fastcampus.app.domain;

public class UserDto {
	private String userId;
	private String userPwd;
	private String userName;
	private String userEmail;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getuserId() {
		return userId;
	}
	public void setuserId(String userId) {
		this.userId = userId;
	}
	public String getuserPwd() {
		return userPwd;
	}
	public void setuserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getuserName() {
		return userName;
	}
	public void setuserName(String useruserName) {
		this.userName = useruserName;
	}
	public String getuserEmail() {
		return userEmail;
	}
	public void setuserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "UsderDto [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userEmail=" + userEmail + ", userAddr1="
				+ userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3 + "]";
	}
	
	
}
