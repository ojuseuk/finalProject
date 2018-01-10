<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${root}/js/jquery.min.js"></script>
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
<body>
<jsp:include page="../../../top.jsp"/>
<div style="margin-top: 20px"></div>
<div style="width: 80%; margin: auto;">
	<input type="hidden" value='${requestScope.json }' id="json">
	<h2 align="center">성적 조회</h2>
	<select class="select" name="clss" id="clss">
		<option value="선택">선택</option>
	</select>
	<button class="w3-button w3-border" style="background-color: #90909096" onclick="stSearch('${root}')">조회</button>
	<table class="w3-table w3-bordered" id="search">
		<tr id="default">
			<td>학생 번호</td>
			<td>학생 이름</td>
			<td>모의고사 이름</td>
			<td>과목 명</td>
			<td>점수</td>
		</tr>
		<tr id="delete">
			<td colspan="5" style="text-align: center;">학생 정보가 없습니다.</td>
		</tr>		
	</table>
</div>	

<script src="${root}/js/tchrBs/stSearch.js"></script>
</body>
</html>