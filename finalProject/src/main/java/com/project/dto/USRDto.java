package com.project.dto;

public class USRDto {

	private String id;
	private String pw;
	private String nm;
	private String phone;
	private String addr;
	private String email;
	private String usrTp;
	private String pws;
	
	
	public USRDto() {
		// TODO Auto-generated constructor stub
	}


	public USRDto(String id, String pw, String nm, String phone, String addr, String email, String usrTp, String pws) {
		super();
		this.id = id;
		this.pw = pw;
		this.nm = nm;
		this.phone = phone;
		this.addr = addr;
		this.email = email;
		this.usrTp = usrTp;
		this.pws = pws;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
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


	public String getUsrTp() {
		return usrTp;
	}


	public void setUsrTp(String usrTp) {
		this.usrTp = usrTp;
	}


	public String getPws() {
		return pws;
	}


	public void setPws(String pws) {
		this.pws = pws;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("USRDto [id=");
		builder.append(id);
		builder.append(", pw=");
		builder.append(pw);
		builder.append(", nm=");
		builder.append(nm);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", addr=");
		builder.append(addr);
		builder.append(", email=");
		builder.append(email);
		builder.append(", usrTp=");
		builder.append(usrTp);
		builder.append(", pws=");
		builder.append(pws);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
	
}
