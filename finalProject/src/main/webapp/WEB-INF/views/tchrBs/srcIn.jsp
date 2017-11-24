<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${root}/js/jquery.min.js"></script>
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container">
		<h2>Bordered Table</h2>
		<p>The w3-bordered class adds a bottom border to each table row:</p>
		<form action="${root}/tchrBs/srcInsert">
			<table class="w3-table w3-bordered">
				<tr>
					<td>시험 명</td>
					<td>
						<select name="qzId" id="qzId">
							<option value="선택">선택</option>
						</select>				
					</td>
				</tr>
				<tr>
					<td>수강생 번호</td>
					<td>
						<select name="stdtNo" id="stdtNo">
							<option value="선택">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>과목명</td>
					<td>
						<select name="sbjtNm" id="sbjtNm">
							<option value="선택">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>점수</td>
					<td>
						<input type="number" name="score" max="100" min="0" >
					</td>
				</tr>
			</table>
			<input type="submit" value="성적 입력">
		</form>
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