package com.fastcampus.app.domain;

import lombok.Data;

@Data
public class ProductDto {
	private Integer pno;
	private String productName;
	private Integer productPrice;
	private String productImg;
	private Integer productStock;
	private String category;
	private String productIntro;
	private String uploadPath;
	private String uuid;
	private String fileName;
	
	public Integer getPno() {
		return pno;
	}
	
	
	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public void setPno(Integer pno) {
		this.pno = pno;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public Integer getProductStock() {
		return productStock;
	}
	public void setProductStock(Integer productStock) {
		this.productStock = productStock;
	}
	public String getProductIntro() {
		return productIntro;
	}
	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "ProductDto [pno=" + pno + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productImg=" + productImg + ", productStock=" + productStock + ", Category=" + category
				+ ", productIntro=" + productIntro + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName="
				+ fileName + "]";
	}

	
	
	
	
	
	
	
	
}
