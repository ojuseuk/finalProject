package com.project.dto;

public class ClssInfoDto {
	
	private String id;
	private String nm;
	private String sbjtChrg;
	private String tchrIntro;
	private String tchrPt;
	private String clssNm;
	private String clssId;
	private String strtDt;
	private String endDt;
	private String strtTm;
	private String endTm;
	private int capa;
	private String clssroom;
	private String crsIntro;
	private String crsNm;
	private String stdtclssttn;
	private String paidDt;
	private String prd;
	
	public ClssInfoDto() {}
	
	public ClssInfoDto(String id, String nm, String clssNm, String strtDt, String endDt, String stdtclssttn) {
		super();
		this.id = id;
		this.nm = nm;
		this.clssNm = clssNm;
		this.strtDt = strtDt;
		this.endDt = endDt;
		this.stdtclssttn = stdtclssttn;
	}

	public ClssInfoDto(String id, String nm, String sbjtChrg, String tchrIntro, String tchrPt, String clssNm,
			String clssId, String strtDt, String endDt, String strtTm, String endTm, int capa, String clssroom,
			String crsIntro, String crsNm, String stdtclssttn, String paidDt, String prd) {
		super();
		this.id = id;
		this.nm = nm;
		this.sbjtChrg = sbjtChrg;
		this.tchrIntro = tchrIntro;
		this.tchrPt = tchrPt;
		this.clssNm = clssNm;
		this.clssId = clssId;
		this.strtDt = strtDt;
		this.endDt = endDt;
		this.strtTm = strtTm;
		this.endTm = endTm;
		this.capa = capa;
		this.clssroom = clssroom;
		this.crsIntro = crsIntro;
		this.crsNm = crsNm;
		this.stdtclssttn = stdtclssttn;
		this.paidDt = paidDt;
		this.prd = prd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public String getSbjtChrg() {
		return sbjtChrg;
	}

	public void setSbjtChrg(String sbjtChrg) {
		this.sbjtChrg = sbjtChrg;
	}

	public String getTchrIntro() {
		return tchrIntro;
	}

	public void setTchrIntro(String tchrIntro) {
		this.tchrIntro = tchrIntro;
	}

	public String getTchrPt() {
		return tchrPt;
	}

	public void setTchrPt(String tchrPt) {
		this.tchrPt = tchrPt;
	}

	public String getClssNm() {
		return clssNm;
	}

	public void setClssNm(String clssNm) {
		this.clssNm = clssNm;
	}

	public String getClssId() {
		return clssId;
	}

	public void setClssId(String clssId) {
		this.clssId = clssId;
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

	public String getCrsIntro() {
		return crsIntro;
	}

	public void setCrsIntro(String crsIntro) {
		this.crsIntro = crsIntro;
	}

	public String getCrsNm() {
		return crsNm;
	}

	public void setCrsNm(String crsNm) {
		this.crsNm = crsNm;
	}

	public String getStdtclssttn() {
		return stdtclssttn;
	}

	public void setStdtclssttn(String stdtclssttn) {
		this.stdtclssttn = stdtclssttn;
	}

	public String getPaidDt() {
		return paidDt;
	}

	public void setPaidDt(String paidDt) {
		this.paidDt = paidDt;
	}

	public String getPrd() {
		return prd;
	}

	public void setPrd(String prd) {
		this.prd = prd;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ClssInfoDto [id=");
		builder.append(id);
		builder.append(", nm=");
		builder.append(nm);
		builder.append(", sbjtChrg=");
		builder.append(sbjtChrg);
		builder.append(", tchrIntro=");
		builder.append(tchrIntro);
		builder.append(", tchrPt=");
		builder.append(tchrPt);
		builder.append(", clssNm=");
		builder.append(clssNm);
		builder.append(", clssId=");
		builder.append(clssId);
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
		builder.append(", crsIntro=");
		builder.append(crsIntro);
		builder.append(", crsNm=");
		builder.append(crsNm);
		builder.append(", stdtclssttn=");
		builder.append(stdtclssttn);
		builder.append(", paidDt=");
		builder.append(paidDt);
		builder.append(", prd=");
		builder.append(prd);
		builder.append("]");
		return builder.toString();
	}

	
}
