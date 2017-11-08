package com.project.dto;

public class QNADto {

	private int no;
	private String id;
	private String title;
	private String content;
	private String dt;
	private int prntNo;
	
	public QNADto() {
		// TODO Auto-generated constructor stub
	}

	public QNADto(int no, String id, String title, String content, String dt, int prntNo) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.dt = dt;
		this.prntNo = prntNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public int getPrntNo() {
		return prntNo;
	}

	public void setPrntNo(int prntNo) {
		this.prntNo = prntNo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("QNADto [no=");
		builder.append(no);
		builder.append(", id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", dt=");
		builder.append(dt);
		builder.append(", prntNo=");
		builder.append(prntNo);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
