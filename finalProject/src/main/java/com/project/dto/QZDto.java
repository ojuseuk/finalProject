package com.project.dto;

public class QZDto {

	private String examId;
	private int id;
	private int questNo;
	private int questWgt;
	
	public QZDto() {
		// TODO Auto-generated constructor stub
	}

	public QZDto(String examId, int id, int questNo, int questWgt) {
		super();
		this.examId = examId;
		this.id = id;
		this.questNo = questNo;
		this.questWgt = questWgt;
	}

	public String getExamId() {
		return examId;
	}

	public void setExamId(String examId) {
		this.examId = examId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuestNo() {
		return questNo;
	}

	public void setQuestNo(int questNo) {
		this.questNo = questNo;
	}

	public int getQuestWgt() {
		return questWgt;
	}

	public void setQuestWgt(int questWgt) {
		this.questWgt = questWgt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("QZDto [examId=");
		builder.append(examId);
		builder.append(", id=");
		builder.append(id);
		builder.append(", questNo=");
		builder.append(questNo);
		builder.append(", questWgt=");
		builder.append(questWgt);
		builder.append("]");
		return builder.toString();
	}
	
}
