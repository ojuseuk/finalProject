package com.project.dto;

public class SBJTDto {
	private String sbjtNm;
	private int weight;
	
	public SBJTDto() {
		// TODO Auto-generated constructor stub
	}

	public SBJTDto(String sbjtNm, int weight) {
		super();
		this.sbjtNm = sbjtNm;
		this.weight = weight;
	}

	public String getSbjtNm() {
		return sbjtNm;
	}

	public void setSbjtNm(String sbjtNm) {
		this.sbjtNm = sbjtNm;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SBJTDto [sbjtNm=");
		builder.append(sbjtNm);
		builder.append(", weight=");
		builder.append(weight);
		builder.append("]");
		return builder.toString();
	}

	
	
	
}
