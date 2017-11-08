package com.project.dto;

public class TPCDto {

	private String tpcNm;
	private String sbjtNm;
	
	public TPCDto() {
		// TODO Auto-generated constructor stub
	}

	public TPCDto(String tpcNm, String sbjtNm) {
		super();
		this.tpcNm = tpcNm;
		this.sbjtNm = sbjtNm;
	}

	public String getTpcNm() {
		return tpcNm;
	}

	public void setTpcNm(String tpcNm) {
		this.tpcNm = tpcNm;
	}

	public String getSbjtNm() {
		return sbjtNm;
	}

	public void setSbjtNm(String sbjtNm) {
		this.sbjtNm = sbjtNm;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TPCDto [tpcNm=");
		builder.append(tpcNm);
		builder.append(", sbjtNm=");
		builder.append(sbjtNm);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
