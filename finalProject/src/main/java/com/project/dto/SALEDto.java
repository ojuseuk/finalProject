package com.project.dto;

public class SALEDto {

	private int year;
	private int month;
	private int day;
	private String costItem;
	private int no;
	private int amount;
	
	public SALEDto() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 
	 * @Method Name  : SALEDto
	 * @작성일       : 2017. 11. 8. 
	 * @작성자 		 : 오주석
	 * @Method 설명  : 수강료 납부를 하기위해 사용하는 메소드
	 */
	public SALEDto(int year, int month, int day, String costItem, int amount) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.costItem = costItem;
		this.amount = amount;
	}



	public SALEDto(int year, int month, int day, String costItem, int no, int amount) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.costItem = costItem;
		this.no = no;
		this.amount = amount;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getCostItem() {
		return costItem;
	}

	public void setCostItem(String costItem) {
		this.costItem = costItem;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SALEDto [year=");
		builder.append(year);
		builder.append(", month=");
		builder.append(month);
		builder.append(", day=");
		builder.append(day);
		builder.append(", costItem=");
		builder.append(costItem);
		builder.append(", no=");
		builder.append(no);
		builder.append(", amount=");
		builder.append(amount);
		builder.append("]");
		return builder.toString();
	}
	
}
