package com.project.dto;

public class TCHRDto {

	private String tchrNo;
	private String id;
	private String slr;
	private String sbjtChrg;
	private String tchrIntro;
	private String nm;			// 이름
	private int result;
	
	public TCHRDto() {
		// TODO Auto-generated constructor stub
	}

	public TCHRDto(String tchrNo, String id, String slr, String sbjtChrg, String tchrIntro) {
		super();
		this.tchrNo = tchrNo;
		this.id = id;
		this.slr = slr;
		this.sbjtChrg = sbjtChrg;
		this.tchrIntro = tchrIntro;
	}

	public String getTchrNo() {
		return tchrNo;
	}

	public void setTchrNo(String tchrNo) {
		this.tchrNo = tchrNo;
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

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}
	
	

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TCHRDto [tchrNo=");
		builder.append(tchrNo);
		builder.append(", id=");
		builder.append(id);
		builder.append(", slr=");
		builder.append(slr);
		builder.append(", sbjtChrg=");
		builder.append(sbjtChrg);
		builder.append(", thcrIntro=");
		builder.append(tchrIntro);
		builder.append(", nm=");
		builder.append(nm);
		builder.append(", result=");
		builder.append(result);
		builder.append("]");
		return builder.toString();
	}

}
