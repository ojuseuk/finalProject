package com.project.dto;

public class SCRDto {

	private String examId;
	private String stdtNo;
	private String sbjtNm;
	private int score;
	private String examTitle;
	
	public SCRDto() {
		// TODO Auto-generated constructor stub
	}

	public SCRDto(String examId, String stdtNo, String sbjtNm, int score) {
		super();
		this.examId = examId;
		this.stdtNo = stdtNo;
		this.sbjtNm = sbjtNm;
		this.score = score;
	}

	public SCRDto(String examId, String stdtNo, String sbjtNm, int score, String examTitle) {
		super();
		this.examId = examId;
		this.stdtNo = stdtNo;
		this.sbjtNm = sbjtNm;
		this.score = score;
		this.examTitle = examTitle;
	}

	public String getExamId() {
		return examId;
	}

	public void setExamId(String examId) {
		this.examId = examId;
	}

	public String getStdtNo() {
		return stdtNo;
	}

	public void setStdtNo(String stdtNo) {
		this.stdtNo = stdtNo;
	}

	public String getSbjtNm() {
		return sbjtNm;
	}

	public void setSbjtNm(String sbjtNm) {
		this.sbjtNm = sbjtNm;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getExamTitle() {
		return examTitle;
	}

	public void setExamTitle(String examTitle) {
		this.examTitle = examTitle;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SCRDto [examId=");
		builder.append(examId);
		builder.append(", stdtNo=");
		builder.append(stdtNo);
		builder.append(", sbjtNm=");
		builder.append(sbjtNm);
		builder.append(", score=");
		builder.append(score);
		builder.append(", examTitle=");
		builder.append(examTitle);
		builder.append("]");
		return builder.toString();
	}
}

