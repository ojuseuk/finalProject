package com.project.dto;

public class SmsContentDto {
	private String content;
	private String phone;
	
	public SmsContentDto() {}

	public SmsContentDto(String content, String phone) {
		super();
		this.content = content;
		this.phone = phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SmsContentDto [content=");
		builder.append(content);
		builder.append(", phone=");
		builder.append(phone);
		builder.append("]");
		return builder.toString();
	}
}
