package com.project.dto;

public class STDTDto {

	private String stdtNo;
	private String id;
	private int retryCnt;
	private String mjrTp;
	private String prntPhone;
	private String nm;
	
	public STDTDto() {}

	public STDTDto(String stdtNo, String id) {
		super();
		this.stdtNo = stdtNo;
		this.id = id;
	}

	public STDTDto(String stdtNo, String id, int retryCnt, String mjrTp, String prntPhone, String nm) {
		super();
		this.stdtNo = stdtNo;
		this.id = id;
		this.retryCnt = retryCnt;
		this.mjrTp = mjrTp;
		this.prntPhone = prntPhone;
		this.nm = nm;
	}

	public String getStdtNo() {
		return stdtNo;
	}

	public void setStdtNo(String stdtNo) {
		this.stdtNo = stdtNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRetryCnt() {
		return retryCnt;
	}

	public void setRetryCnt(int retryCnt) {
		this.retryCnt = retryCnt;
	}

	public String getMjrTp() {
		return mjrTp;
	}

	public void setMjrTp(String mjrTp) {
		this.mjrTp = mjrTp;
	}

	public String getPrntPhone() {
		return prntPhone;
	}

	public void setPrntPhone(String prntPhone) {
		this.prntPhone = prntPhone;
	}
	
	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("STDTDto [stdtNo=");
		builder.append(stdtNo);
		builder.append(", id=");
		builder.append(id);
		builder.append(", retryCnt=");
		builder.append(retryCnt);
		builder.append(", mjrTp=");
		builder.append(mjrTp);
		builder.append(", prntPhone=");
		builder.append(prntPhone);
		builder.append(", nm=");
		builder.append(nm);
		builder.append("]");
		return builder.toString();
	}
}
