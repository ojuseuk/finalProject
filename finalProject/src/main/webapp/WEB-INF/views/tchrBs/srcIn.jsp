<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
.select {
    width: 200px;
    height: 30px;
    padding-left: 10px;
    font-size: 15px;
    color: #424242;
    border: 1px solid #90909096;
    border-radius: 3px;
}
</style>
</head>
<script src="${root}/js/jquery.min.js"></script>
<body>
<jsp:include page="../../../top.jsp"/>
<div style="width: 80%; margin: auto;">
	<div class="w3-container">
		<h2 align="center">성적 입력</h2>

		<form action="${root}/tchrBs/srcInsert" style="text-align:center">
			<table class="w3-table w3-bordered" >
				<tr>
					<td style="text-align:right">시험 명</td>
					<td style="text-align:center">
						<select class="select" name="examId" id="qzId">
							<option value="선택">선택</option>
						</select>				
					</td>
				</tr>
				<tr>
					<td style="text-align:right">수강생 번호</td>
					<td style="text-align:center">
						<select class="select" name="stdtNo" id="stdtNo">
							<option value="선택">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="text-align:right">과목명</td>
					<td style="text-align:center">
						<select class="select" name="sbjtNm" id="sbjtNm">
							<option value="선택">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="text-align:right">점수</td>
					<td style="text-align:center">
						<input type="number" name="score" max="100" min="0" style="width: 200px">
					</td>
				</tr>
			</table>
			<input class="w3-button w3-border" style="background-color: #90909096; width: 20%" type="submit" value="성적 입력">
		</form>
	</div>
</div>
	<input type="hidden" value='${requestScope.examTp}' id="examTp">
	<input type="hidden" value='${requestScope.sbjt}' id="sbjt">
	<input type="hidden" value='${requestScope.stdt}' id="stdt">
	
	<script type="text/javascript">
		var stdt = $('#stdt').val();
		var sbjt = $('#sbjt').val();
		var examTp = $('#examTp').val();
		
		stdt = JSON.parse(stdt);
		sbjt = JSON.parse(sbjt);
		examTp = JSON.parse(examTp);
		
		for (var i = 0; i < examTp.length; i++) {
			$("#qzId option:eq(0)").after(
					"<option value='" + examTp[i].EXAM_ID + "'>" + examTp[i].EXAM_TITLE + "</option>");
		}
		
		for (var i = 0; i < stdt.length; i++) {
			$("#stdtNo option:eq(0)").after(
					"<option value='" + stdt[i].STDT_NO + "'>" + stdt[i].STDT_NO + '('+ stdt[i].NM +')'+ "</option>");
		}
		
		for (var i = 0; i < sbjt.length; i++) {
			$("#sbjtNm option:eq(0)").after(
					"<option value='" + sbjt[i].SBJT_NM + "'>" + sbjt[i].SBJT_NM + "</option>");
		}
	</script>
</body>
</html>