package com.project.dto;

public class TTLQZDto {

	private int id;
	private String sbjtNm;
	private String tchrNo;
	private String tpcNm;
	private String title;
	private String content;
	private String solution;
	private String degree;
	private String answer;
	private String imgfile;
	
	public TTLQZDto() {
		// TODO Auto-generated constructor stub
	}

	public TTLQZDto(int id, String sbjtNm, String tchrNo, String tpcNm, String title, String content, String solution,
			String degree, String answer, String imgfile) {
		super();
		this.id = id;
		this.sbjtNm = sbjtNm;
		this.tchrNo = tchrNo;
		this.tpcNm = tpcNm;
		this.title = title;
		this.content = content;
		this.solution = solution;
		this.degree = degree;
		this.answer = answer;
		this.imgfile = imgfile;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSbjtNm() {
		return sbjtNm;
	}

	public void setSbjtNm(String sbjtNm) {
		this.sbjtNm = sbjtNm;
	}

	public String getTchrNo() {
		return tchrNo;
	}

	public void setTchrNo(String tchrNo) {
		this.tchrNo = tchrNo;
	}

	public String getTpcNm() {
		return tpcNm;
	}

	public void setTpcNm(String tpcNm) {
		this.tpcNm = tpcNm;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getImgfile() {
		return imgfile;
	}

	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TTLQZDto [id=");
		builder.append(id);
		builder.append(", sbjtNm=");
		builder.append(sbjtNm);
		builder.append(", tchrNo=");
		builder.append(tchrNo);
		builder.append(", tpcNm=");
		builder.append(tpcNm);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", solution=");
		builder.append(solution);
		builder.append(", degree=");
		builder.append(degree);
		builder.append(", answer=");
		builder.append(answer);
		builder.append(", imgfile=");
		builder.append(imgfile);
		builder.append("]");
		return builder.toString();
	}

}
