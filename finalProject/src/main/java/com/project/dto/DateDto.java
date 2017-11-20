package com.project.dto;

public class DateDto {
	private String id;
	private String strtDt;
	private String endDt;
	
	public DateDto() {
		// TODO Auto-generated constructor stub
	}

	public DateDto(String id, String strtDt, String endDt) {
		super();
		this.id = id;
		this.strtDt = strtDt;
		this.endDt = endDt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStrtDt() {
		return strtDt;
	}

	public void setStrtDt(String strtDt) {
		this.strtDt = strtDt;
	}

	public String getEndDt() {
		return endDt;
	}

	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("DateDto [id=");
		builder.append(id);
		builder.append(", strtDt=");
		builder.append(strtDt);
		builder.append(", endDt=");
		builder.append(endDt);
		builder.append("]");
		return builder.toString();
	}
	
}
