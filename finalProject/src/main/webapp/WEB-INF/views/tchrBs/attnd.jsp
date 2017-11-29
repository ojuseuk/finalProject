<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출석 확인</title>
<style>
.select {
    width: 150px;
    height: 30px;
    padding-left: 10px;
    font-size: 15px;
    color: #424242;
    border: 1px solid #90909096;
    border-radius: 3px;
}
</style>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${root}/js/jquery.min.js"></script>
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container" style="width: 80%; margin: auto;">
		<h2 align="center">출석 확인</h2>

		<select class="select" name="clss" id="clss">
			<option value="선택">선택</option>
		</select>
		<button class="w3-button w3-border" style="background-color: #90909096" onclick="clssSearch('${root}')">조회</button>

		<br>
		<br>
		<br>
		<div id="abc">학생 출석 정보가 없습니다.</div>
	</div>

	<input type="hidden" value='${requestScope.json}' id="json">
	<input type="hidden" value='${requestScope.list.size()}' id="listSize">
	<script src="${root}/js/tchrBs/attnd.js"></script>
</body>
</html>