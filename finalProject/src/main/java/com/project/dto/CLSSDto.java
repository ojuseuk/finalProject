package com.project.dto;

public class CLSSDto {

	private String clssId;
	private String crsId;
	private String clssNm;
	private String strtDt;
	private String endDt;
	private String strtTm;
	private String endTm;
	private int capa;
	private String clssroom;
	private String sbjtNm;		// 이후 CRSDto의 멤버들
	private String crsNm;
	
	public CLSSDto() {
		// TODO Auto-generated constructor stub
	}

	public CLSSDto(String clssId, String crsId, String clssNm, String strtDt, String endDt, String strtTm,
			String endTm, int capa, String clssroom) {
		super();
		this.clssId = clssId;
		this.crsId = crsId;
		this.clssNm = clssNm;
		this.strtDt = strtDt;
		this.endDt = endDt;
		this.strtTm = strtTm;
		this.endTm = endTm;
		this.capa = capa;
		this.clssroom = clssroom;
	}
	
	
	public CLSSDto(String clssId, String crsId, String clssNm, String strtDt, String endDt, String strtTm, String endTm,
			int capa, String clssroom, String sbjtNm, String crsNm) {
		super();
		this.clssId = clssId;
		this.crsId = crsId;
		this.clssNm = clssNm;
		this.strtDt = strtDt;
		this.endDt = endDt;
		this.strtTm = strtTm;
		this.endTm = endTm;
		this.capa = capa;
		this.clssroom = clssroom;
		this.sbjtNm = sbjtNm;
		this.crsNm = crsNm;
	}

	public String getClssId() {
		return clssId;
	}

	public void setClssId(String clssId) {
		this.clssId = clssId;
	}

	public String getCrsId() {
		return crsId;
	}

	public void setCrsId(String crsId) {
		this.crsId = crsId;
	}

	public String getClssNm() {
		return clssNm;
	}

	public void setClssNm(String clssNm) {
		this.clssNm = clssNm;
	}

	public String getStrtDt() {
		return strtDt;
	}

	public void setStrtDt(String strtDt) {
		this.strtDt = strtDt;
	}

	public String getEndDt() {
		return endDt;
	}

	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}

	public String getStrtTm() {
		return strtTm;
	}

	public void setStrtTm(String strtTm) {
		this.strtTm = strtTm;
	}

	public String getEndTm() {
		return endTm;
	}

	public void setEndTm(String endTm) {
		this.endTm = endTm;
	}

	public int getCapa() {
		return capa;
	}

	public void setCapa(int capa) {
		this.capa = capa;
	}

	public String getClssroom() {
		return clssroom;
	}

	public void setClssroom(String clssroom) {
		this.clssroom = clssroom;
	}

	public String getSbjtNm() {
		return sbjtNm;
	}

	public void setSbjtNm(String sbjtNm) {
		this.sbjtNm = sbjtNm;
	}

	public String getCrsNm() {
		return crsNm;
	}

	public void setCrsNm(String crsNm) {
		this.crsNm = crsNm;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CLSSDto [clssId=");
		builder.append(clssId);
		builder.append(", crsId=");
		builder.append(crsId);
		builder.append(", clssNm=");
		builder.append(clssNm);
		builder.append(", strtDt=");
		builder.append(strtDt);
		builder.append(", endDt=");
		builder.append(endDt);
		builder.append(", strtTm=");
		builder.append(strtTm);
		builder.append(", endTm=");
		builder.append(endTm);
		builder.append(", capa=");
		builder.append(capa);
		builder.append(", clssroom=");
		builder.append(clssroom);
		builder.append(", sbjtNm=");
		builder.append(sbjtNm);
		builder.append(", crsNm=");
		builder.append(crsNm);
		builder.append("]");
		return builder.toString();
	}

	
	
	
	
}
