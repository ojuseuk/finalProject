package com.project.dto;

public class CDDto {

	private String cdTp;
	private String cdId;
	private String cdNm;
	
	public CDDto() {
		// TODO Auto-generated constructor stub
	}

	public CDDto(String cdTp, String cdId, String cdNm) {
		super();
		this.cdTp = cdTp;
		this.cdId = cdId;
		this.cdNm = cdNm;
	}

	public String getCdTp() {
		return cdTp;
	}

	public void setCdTp(String cdTp) {
		this.cdTp = cdTp;
	}

	public String getCdId() {
		return cdId;
	}

	public void setCdId(String cdId) {
		this.cdId = cdId;
	}

	public String getCdNm() {
		return cdNm;
	}

	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CDDto [cdTp=");
		builder.append(cdTp);
		builder.append(", cdId=");
		builder.append(cdId);
		builder.append(", cdNm=");
		builder.append(cdNm);
		builder.append("]");
		return builder.toString();
	}
	
}
