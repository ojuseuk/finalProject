package com.project.dto;

public class STDTCLSSDto {

	private String clssId;
	private String id;
	private String slr;
	private String retiredDt;
	
	public STDTCLSSDto() {
		// TODO Auto-generated constructor stub
	}

	public STDTCLSSDto(String clssId, String id, String slr, String retiredDt) {
		super();
		this.clssId = clssId;
		this.id = id;
		this.slr = slr;
		this.retiredDt = retiredDt;
	}

	public String getClssId() {
		return clssId;
	}

	public void setClssId(String clssId) {
		this.clssId = clssId;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("STDTCLSSDto [clssId=");
		builder.append(clssId);
		builder.append(", id=");
		builder.append(id);
		builder.append(", slr=");
		builder.append(slr);
		builder.append(", retiredDt=");
		builder.append(retiredDt);
		builder.append("]");
		return builder.toString();
	}
	
}
