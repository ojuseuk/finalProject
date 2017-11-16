package com.project.dto;

public class TCHRDto {

	private String tchrNo;
	private String id;
	private String slr;
	private String sbjtChrg;
	private String tchrIntro;
	private String nm;			// 이름
	private int result;			// 급여 지급 여부
	private String empNo;
	private String tchrPt;
	
	
	public TCHRDto() {}

	public TCHRDto(String tchrNo, String sbjtChrg, String tchrIntro) {
		super();
		this.tchrNo = tchrNo;
		this.sbjtChrg = sbjtChrg;
		this.tchrIntro = tchrIntro;
	}

	public TCHRDto(String tchrNo, String id, String slr, String sbjtChrg, String tchrIntro) {
		this.tchrNo = tchrNo;
		this.id = id;
		this.slr = slr;
		this.sbjtChrg = sbjtChrg;
		this.tchrIntro = tchrIntro;
	}
	

	public TCHRDto(String tchrNo, String id, String slr, String sbjtChrg, String tchrIntro, String nm, int result,
			String empNo, String tchrPt) {
		super();
		this.tchrNo = tchrNo;
		this.id = id;
		this.slr = slr;
		this.sbjtChrg = sbjtChrg;
		this.tchrIntro = tchrIntro;
		this.nm = nm;
		this.result = result;
		this.empNo = empNo;
		this.nm = nm;
		this.result = result;
		this.tchrPt = tchrPt;
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
 
	
	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getTchrPt() {
		return tchrPt;
	}

	public void setTchrPt(String tchrPt) {
		this.tchrPt = tchrPt;
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
		builder.append(", tchrIntro=");
		builder.append(tchrIntro);
		builder.append(", nm=");
		builder.append(nm);
		builder.append(", result=");
		builder.append(result);
		builder.append(", empNo=");
		builder.append(empNo);
		builder.append(", tchrPt=");
		builder.append(tchrPt);
		builder.append("]");
		return builder.toString();
	}


}
