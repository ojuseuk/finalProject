package com.project.dto;

public class QZDto {

	private String exam_id;
	private int id;
	private int questNo;
	private int questWgt;
	
	public QZDto() {
		// TODO Auto-generated constructor stub
	}

	public QZDto(String exam_id, int id, int questNo, int questWgt) {
		super();
		this.exam_id = exam_id;
		this.id = id;
		this.questNo = questNo;
		this.questWgt = questWgt;
	}

	public String getExam_id() {
		return exam_id;
	}

	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
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
		builder.append("QZDto [exam_id=");
		builder.append(exam_id);
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
