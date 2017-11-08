package com.project.dto;

public class SCRDto {

	private String qzId;
	private String stdtNo;
	private String sbjtNm;
	private int score;
	
	public SCRDto() {
		// TODO Auto-generated constructor stub
	}

	public SCRDto(String qzId, String stdtNo, String sbjtNm, int score) {
		super();
		this.qzId = qzId;
		this.stdtNo = stdtNo;
		this.sbjtNm = sbjtNm;
		this.score = score;
	}

	public String getQzId() {
		return qzId;
	}

	public void setQzId(String qzId) {
		this.qzId = qzId;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SCRDto [qzId=");
		builder.append(qzId);
		builder.append(", stdtNo=");
		builder.append(stdtNo);
		builder.append(", sbjtNm=");
		builder.append(sbjtNm);
		builder.append(", score=");
		builder.append(score);
		builder.append("]");
		return builder.toString();
	}

	
	
}

