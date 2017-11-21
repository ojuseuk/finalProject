package com.project.dto;

public class QNADto {

	private int no;
	private String id;
	private String title;
	private String content;
	private String dt;
	private int gpNum;
	private int seqLv;
	private int seqNum;
	
	public QNADto() {
		// TODO Auto-generated constructor stub
	}

	public QNADto(int no, String id, String title, String content, String dt, int gpNum, int seqLv, int seqNum) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.dt = dt;
		this.gpNum = gpNum;
		this.seqLv = seqLv;
		this.seqNum = seqNum;
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

	public int getGpNum() {
		return gpNum;
	}

	public void setGpNum(int gpNum) {
		this.gpNum = gpNum;
	}

	public int getSeqLv() {
		return seqLv;
	}

	public void setSeqLv(int seqLv) {
		this.seqLv = seqLv;
	}

	public int getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(int seqNum) {
		this.seqNum = seqNum;
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
		builder.append(", gpNum=");
		builder.append(gpNum);
		builder.append(", seqLv=");
		builder.append(seqLv);
		builder.append(", seqNum=");
		builder.append(seqNum);
		builder.append("]");
		return builder.toString();
	}
	
}
