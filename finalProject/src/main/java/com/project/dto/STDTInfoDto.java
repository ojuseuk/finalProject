package com.project.dto;

public class STDTInfoDto {
	
	private String id;
	private String nm;
	private String phone;
	private String addr;
	private String email;
	private String stdtNo;
	private int retryCnt;
	private String mjrTp;
	private String prntPhone;
	private String clssNm;
	private String clssId;;
	private String paidDt;
	private String repaidDt;
	private String crsId;
	
	public STDTInfoDto() {}

	public STDTInfoDto(String id, String nm, String phone, String addr, String email, String stdtNo, int retryCnt,
			String mjrTp, String prntPhone, String clssNm, String clssId, String paidDt, String repaidDt,
			String crsId) {
		super();
		this.id = id;
		this.nm = nm;
		this.phone = phone;
		this.addr = addr;
		this.email = email;
		this.stdtNo = stdtNo;
		this.retryCnt = retryCnt;
		this.mjrTp = mjrTp;
		this.prntPhone = prntPhone;
		this.clssNm = clssNm;
		this.clssId = clssId;
		this.paidDt = paidDt;
		this.repaidDt = repaidDt;
		this.crsId = crsId;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStdtNo() {
		return stdtNo;
	}

	public void setStdtNo(String stdtNo) {
		this.stdtNo = stdtNo;
	}

	public int getRetryCnt() {
		return retryCnt;
	}

	public void setRetryCnt(int retryCnt) {
		this.retryCnt = retryCnt;
	}

	public String getMjrTp() {
		return mjrTp;
	}

	public void setMjrTp(String mjrTp) {
		this.mjrTp = mjrTp;
	}

	public String getPrntPhone() {
		return prntPhone;
	}

	public void setPrntPhone(String prntPhone) {
		this.prntPhone = prntPhone;
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

	public String getPaidDt() {
		return paidDt;
	}

	public void setPaidDt(String paidDt) {
		this.paidDt = paidDt;
	}

	public String getRepaidDt() {
		return repaidDt;
	}

	public void setRepaidDt(String repaidDt) {
		this.repaidDt = repaidDt;
	}

	public String getCrsId() {
		return crsId;
	}

	public void setCrsId(String crsId) {
		this.crsId = crsId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("STDTInfoDto [id=");
		builder.append(id);
		builder.append(", nm=");
		builder.append(nm);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", addr=");
		builder.append(addr);
		builder.append(", email=");
		builder.append(email);
		builder.append(", stdtNo=");
		builder.append(stdtNo);
		builder.append(", retryCnt=");
		builder.append(retryCnt);
		builder.append(", mjrTp=");
		builder.append(mjrTp);
		builder.append(", prntPhone=");
		builder.append(prntPhone);
		builder.append(", clssNm=");
		builder.append(clssNm);
		builder.append(", clssId=");
		builder.append(clssId);
		builder.append(", paidDt=");
		builder.append(paidDt);
		builder.append(", repaidDt=");
		builder.append(repaidDt);
		builder.append(", crsId=");
		builder.append(crsId);
		builder.append("]");
		return builder.toString();
	}
}
