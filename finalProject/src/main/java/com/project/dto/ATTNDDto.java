package com.project.dto;

public class ATTNDDto {

	private String dt;
	private String attndTp;
	private String stdtNo;
	
	public ATTNDDto() {
		// TODO Auto-generated constructor stub
	}

	public ATTNDDto(String dt, String attndTp, String stdtNo) {
		super();
		this.dt = dt;
		this.attndTp = attndTp;
		this.stdtNo = stdtNo;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public String getAttndTp() {
		return attndTp;
	}

	public void setAttndTp(String attndTp) {
		this.attndTp = attndTp;
	}

	public String getStdtNo() {
		return stdtNo;
	}

	public void setStdtNo(String stdtNo) {
		this.stdtNo = stdtNo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ATTNDDto [dt=");
		builder.append(dt);
		builder.append(", attndTp=");
		builder.append(attndTp);
		builder.append(", stdtNo=");
		builder.append(stdtNo);
		builder.append("]");
		return builder.toString();
	}
	
}
