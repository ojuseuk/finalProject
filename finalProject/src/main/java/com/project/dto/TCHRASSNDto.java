package com.project.dto;

public class TCHRASSNDto {

	private String tchrNo;
	private String clssId;
	private String chrg;
	private String slr;
	private String nm;			// d이름
	private String id;
	private String tchrIntro;
	private String tchrPt;
	private String sbjtChrg;
	private String sbjtNm;
	
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

	public TCHRASSNDto(String tchrNo, String clssId, String chrg, String slr, String nm, String id, String tchrIntro,
			String tchrPt) {
		super();
		this.tchrNo = tchrNo;
		this.clssId = clssId;
		this.chrg = chrg;
		this.slr = slr;
		this.nm = nm;
		this.id = id;
		this.tchrIntro = tchrIntro;
		this.tchrPt = tchrPt;
	}

	public TCHRASSNDto(String tchrNo, String clssId, String chrg, String slr, String nm, String id, String tchrIntro,
			String tchrPt, String sbjtChrg) {
		super();
		this.tchrNo = tchrNo;
		this.clssId = clssId;
		this.chrg = chrg;
		this.slr = slr;
		this.nm = nm;
		this.id = id;
		this.tchrIntro = tchrIntro;
		this.tchrPt = tchrPt;
		this.sbjtChrg = sbjtChrg;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getSbjtChrg() {
		return sbjtChrg;
	}

	public void setSbjtChrg(String sbjtChrg) {
		this.sbjtChrg = sbjtChrg;
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
		builder.append(", id=");
		builder.append(id);
		builder.append(", tchrIntro=");
		builder.append(tchrIntro);
		builder.append(", tchrPt=");
		builder.append(tchrPt);
		builder.append(", sbjtChrg=");
		builder.append(sbjtChrg);
		builder.append(", sbjtNm=");
		builder.append(sbjtNm);
		builder.append("]");
		return builder.toString();
	}





	
}
