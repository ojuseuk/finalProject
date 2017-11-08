package com.project.dto;

public class EXAMTPDto {

	private String examId;
	private String examTitle;
	private String examDt;
	private String examTp;
	
	public EXAMTPDto() {
		// TODO Auto-generated constructor stub
	}

	public EXAMTPDto(String examId, String examTitle, String examDt, String examTp) {
		super();
		this.examId = examId;
		this.examTitle = examTitle;
		this.examDt = examDt;
		this.examTp = examTp;
	}

	public String getExamId() {
		return examId;
	}

	public void setExamId(String examId) {
		this.examId = examId;
	}

	public String getExamTitle() {
		return examTitle;
	}

	public void setExamTitle(String examTitle) {
		this.examTitle = examTitle;
	}

	public String getExamDt() {
		return examDt;
	}

	public void setExamDt(String examDt) {
		this.examDt = examDt;
	}

	public String getExamTp() {
		return examTp;
	}

	public void setExamTp(String examTp) {
		this.examTp = examTp;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EXAMTPDto [examId=");
		builder.append(examId);
		builder.append(", examTitle=");
		builder.append(examTitle);
		builder.append(", examDt=");
		builder.append(examDt);
		builder.append(", examTp=");
		builder.append(examTp);
		builder.append("]");
		return builder.toString();
	}
	
	
}
