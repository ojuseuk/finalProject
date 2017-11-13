package com.project.dto;

public class ATTNDDto {

	private String dt;
	private String tm;
	private String attndTp;
	private String clssId;
	private String stdtNo;
	
	public ATTNDDto() {
		// TODO Auto-generated constructor stub
	}

	public ATTNDDto(String dt, String tm, String attndTp, String clssId, String stdtNo) {
		super();
		this.dt = dt;
		this.tm = tm;
		this.attndTp = attndTp;
		this.clssId = clssId;
		this.stdtNo = stdtNo;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public String getTm() {
		return tm;
	}

	public void setTm(String tm) {
		this.tm = tm;
	}

	public String getAttndTp() {
		return attndTp;
	}

	public void setAttndTp(String attndTp) {
		this.attndTp = attndTp;
	}

	public String getClssId() {
		return clssId;
	}

	public void setClssId(String clssId) {
		this.clssId = clssId;
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
		builder.append(", tm=");
		builder.append(tm);
		builder.append(", attndTp=");
		builder.append(attndTp);
		builder.append(", clssId=");
		builder.append(clssId);
		builder.append(", stdtNo=");
		builder.append(stdtNo);
		builder.append("]");
		return builder.toString();
	}
	
}
