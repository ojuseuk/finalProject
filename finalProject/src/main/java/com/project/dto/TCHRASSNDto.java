package com.project.dto;

public class TCHRASSNDto {

	private String tchrNo;
	private String clssId;
	private String chrg;
	private String slr;
	private String nm;			// d이름
	
	public TCHRASSNDto() {
		// TODO Auto-generated constructor stub
	}

	public TCHRASSNDto(String tchrNo, String clssId, String chrg, String slr) {
		super();
		this.tchrNo = tchrNo;
		this.clssId = clssId;
		this.chrg = chrg;
		this.slr = slr;
	}

	public String getTchrNo() {
		return tchrNo;
	}

	public void setTchrNo(String tchrNo) {
		this.tchrNo = tchrNo;
	}

	public String getClssId() {
		return clssId;
	}

	public void setClssId(String clssId) {
		this.clssId = clssId;
	}

	public String getChrg() {
		return chrg;
	}

	public void setChrg(String chrg) {
		this.chrg = chrg;
	}

	public String getSlr() {
		return slr;
	}

	public void setSlr(String slr) {
		this.slr = slr;
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
		builder.append("TCHRASSNDto [tchrNo=");
		builder.append(tchrNo);
		builder.append(", clssId=");
		builder.append(clssId);
		builder.append(", chrg=");
		builder.append(chrg);
		builder.append(", slr=");
		builder.append(slr);
		builder.append(", nm=");
		builder.append(nm);
		builder.append("]");
		return builder.toString();
	}

	
}
