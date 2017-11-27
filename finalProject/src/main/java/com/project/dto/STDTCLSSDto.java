package com.project.dto;

public class STDTCLSSDto {

	private String clssId;
	private String stdtNo;
	private String repaidDt;
	private String paidDt;
	
	
	public STDTCLSSDto(String clssId, String stdtNo, String paidDt) {
		super();
		this.clssId = clssId;
		this.stdtNo = stdtNo;
		this.paidDt = paidDt;
	}

	public STDTCLSSDto(String clssId, String stdtNo, String repaidDt, String paidDt) {
		super();
		this.clssId = clssId;
		this.stdtNo = stdtNo;
		this.repaidDt = repaidDt;
		this.paidDt = paidDt;
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

	public String getRepaidDt() {
		return repaidDt;
	}

	public void setRepaidDt(String repaidDt) {
		this.repaidDt = repaidDt;
	}

	public String getPaidDt() {
		return paidDt;
	}

	public void setPaidDt(String paidDt) {
		this.paidDt = paidDt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("STDTCLSSDto [clssId=");
		builder.append(clssId);
		builder.append(", stdtNo=");
		builder.append(stdtNo);
		builder.append(", repaidDt=");
		builder.append(repaidDt);
		builder.append(", paidDt=");
		builder.append(paidDt);
		builder.append("]");
		return builder.toString();
	}
}
