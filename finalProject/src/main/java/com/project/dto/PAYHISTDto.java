package com.project.dto;

public class PAYHISTDto {

	private String empNo;
	private String yearMonth;
	private int slr;
	private String paidDt;
	
	public PAYHISTDto() {
		// TODO Auto-generated constructor stub
	}

	public PAYHISTDto(String empNo, String yearMonth, int slr, String paidDt) {
		super();
		this.empNo = empNo;
		this.yearMonth = yearMonth;
		this.slr = slr;
		this.paidDt = paidDt;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	public int getSlr() {
		return slr;
	}

	public void setSlr(int slr) {
		this.slr = slr;
	}

	public String getPaidDt() {
		return paidDt;
	}

	public void setPaidDt(String paidDt) {
		this.paidDt = paidDt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PAYHISTDto [empNo=");
		builder.append(empNo);
		builder.append(", yearMonth=");
		builder.append(yearMonth);
		builder.append(", slr=");
		builder.append(slr);
		builder.append(", paidDt=");
		builder.append(paidDt);
		builder.append("]");
		return builder.toString();
	}
	
}
