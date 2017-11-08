package com.project.dto;

public class CRSDto {
	
	private String crsId;
	private String crsNm;
	private int prd;
	private String stdtclssttn;
	private int dayClssTm;
	private String crsTp;
	private String crsIntro;
	private String sbjtNm;
	
	public CRSDto() {
		// TODO Auto-generated constructor stub
	}

	public CRSDto(String crsId, String crsNm, int prd, String stdtclssttn, int dayClssTm, String crsTp, String crsIntro,
			String sbjtNm) {
		super();
		this.crsId = crsId;
		this.crsNm = crsNm;
		this.prd = prd;
		this.stdtclssttn = stdtclssttn;
		this.dayClssTm = dayClssTm;
		this.crsTp = crsTp;
		this.crsIntro = crsIntro;
		this.sbjtNm = sbjtNm;
	}

	public String getCrsId() {
		return crsId;
	}

	public void setCrsId(String crsId) {
		this.crsId = crsId;
	}

	public String getCrsNm() {
		return crsNm;
	}

	public void setCrsNm(String crsNm) {
		this.crsNm = crsNm;
	}

	public int getPrd() {
		return prd;
	}

	public void setPrd(int prd) {
		this.prd = prd;
	}

	public String getStdtclssttn() {
		return stdtclssttn;
	}

	public void setStdtclssttn(String stdtclssttn) {
		this.stdtclssttn = stdtclssttn;
	}

	public int getDayClssTm() {
		return dayClssTm;
	}

	public void setDayClssTm(int dayClssTm) {
		this.dayClssTm = dayClssTm;
	}

	public String getCrsTp() {
		return crsTp;
	}

	public void setCrsTp(String crsTp) {
		this.crsTp = crsTp;
	}

	public String getCrsIntro() {
		return crsIntro;
	}

	public void setCrsIntro(String crsIntro) {
		this.crsIntro = crsIntro;
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
		builder.append("CRSDto [crsId=");
		builder.append(crsId);
		builder.append(", crsNm=");
		builder.append(crsNm);
		builder.append(", prd=");
		builder.append(prd);
		builder.append(", stdtclssttn=");
		builder.append(stdtclssttn);
		builder.append(", dayClssTm=");
		builder.append(dayClssTm);
		builder.append(", crsTp=");
		builder.append(crsTp);
		builder.append(", crsIntro=");
		builder.append(crsIntro);
		builder.append(", sbjtNm=");
		builder.append(sbjtNm);
		builder.append("]");
		return builder.toString();
	}

	
	
}
