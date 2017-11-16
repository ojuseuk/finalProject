package com.project.dto;

public class EMPDto {

	private String empNo;
	private String id;
	private String slr;
	private String retiredDt;
	private String nm;
	
	public EMPDto() {
		// TODO Auto-generated constructor stub
	}

	public EMPDto(String empNo, String id, String slr, String retiredDt) {
		super();
		this.empNo = empNo;
		this.id = id;
		this.slr = slr;
		this.retiredDt = retiredDt;
	}

	public EMPDto(String empNo, String id, String slr, String retiredDt, String nm) {
		super();
		this.empNo = empNo;
		this.id = id;
		this.slr = slr;
		this.retiredDt = retiredDt;
		this.nm = nm;
	}

	public EMPDto(String empNo, String id, String slr) {
		super();
		this.empNo = empNo;
		this.id = id;
		this.slr = slr;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSlr() {
		return slr;
	}

	public void setSlr(String slr) {
		this.slr = slr;
	}

	public String getRetiredDt() {
		return retiredDt;
	}

	public void setRetiredDt(String retiredDt) {
		this.retiredDt = retiredDt;
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
		builder.append("EMPDto [empNo=");
		builder.append(empNo);
		builder.append(", id=");
		builder.append(id);
		builder.append(", slr=");
		builder.append(slr);
		builder.append(", retiredDt=");
		builder.append(retiredDt);
		builder.append(", nm=");
		builder.append(nm);
		builder.append("]");
		return builder.toString();
	}


	
	
}
