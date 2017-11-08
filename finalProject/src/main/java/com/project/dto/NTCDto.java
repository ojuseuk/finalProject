package com.project.dto;

public class NTCDto {

	private int no;
	private String empNo;
	private String title;
	private String content;
	private String attchFile;
	private String dt;
	
	public NTCDto() {
		// TODO Auto-generated constructor stub
	}

	public NTCDto(int no, String empNo, String title, String content, String attchFile, String dt) {
		super();
		this.no = no;
		this.empNo = empNo;
		this.title = title;
		this.content = content;
		this.attchFile = attchFile;
		this.dt = dt;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
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

	public String getAttchFile() {
		return attchFile;
	}

	public void setAttchFile(String attchFile) {
		this.attchFile = attchFile;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NTCDto [no=");
		builder.append(no);
		builder.append(", empNo=");
		builder.append(empNo);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", attchFile=");
		builder.append(attchFile);
		builder.append(", dt=");
		builder.append(dt);
		builder.append("]");
		return builder.toString();
	}
	
}
