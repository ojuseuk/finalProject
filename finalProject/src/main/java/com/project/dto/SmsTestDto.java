package com.project.dto;

public class SmsTestDto {
	private String content;
	
	public SmsTestDto() {
	}

	public SmsTestDto(String content) {
		super();
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SmsTestDto [content=");
		builder.append(content);
		builder.append("]");
		return builder.toString();
	}
	
	
}
