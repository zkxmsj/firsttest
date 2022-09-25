package com.fastcampus.app.domain;

public class CategoryDto {
	private String category;
	private Integer count;
	

	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}




	public Integer getCount() {
		return count;
	}



	public void setCount(Integer count) {
		this.count = count;
	}



	@Override
	public String toString() {
		return "CategoryDto [category=" + category + ", count=" + count + "]";
	}
	
	
	
	
	
}
