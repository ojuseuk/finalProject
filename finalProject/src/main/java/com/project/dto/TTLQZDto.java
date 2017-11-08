package com.project.dto;

public class TTLQZDto {

	private int id;
	private String sbjtNm;
	private String tchrNm;
	private String tpcNm;
	private String content;
	private String degree;
	private String answer;
	private String imgfle;
	
	public TTLQZDto() {
		// TODO Auto-generated constructor stub
	}

	public TTLQZDto(int id, String sbjtNm, String tchrNm, String tpcNm, String content, String degree, String answer,
			String imgfle) {
		super();
		this.id = id;
		this.sbjtNm = sbjtNm;
		this.tchrNm = tchrNm;
		this.tpcNm = tpcNm;
		this.content = content;
		this.degree = degree;
		this.answer = answer;
		this.imgfle = imgfle;
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

	public String getTchrNm() {
		return tchrNm;
	}

	public void setTchrNm(String tchrNm) {
		this.tchrNm = tchrNm;
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

	public String getImgfle() {
		return imgfle;
	}

	public void setImgfle(String imgfle) {
		this.imgfle = imgfle;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TTLQZDto [id=");
		builder.append(id);
		builder.append(", sbjtNm=");
		builder.append(sbjtNm);
		builder.append(", tchrNm=");
		builder.append(tchrNm);
		builder.append(", tpcNm=");
		builder.append(tpcNm);
		builder.append(", content=");
		builder.append(content);
		builder.append(", degree=");
		builder.append(degree);
		builder.append(", answer=");
		builder.append(answer);
		builder.append(", imgfle=");
		builder.append(imgfle);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
