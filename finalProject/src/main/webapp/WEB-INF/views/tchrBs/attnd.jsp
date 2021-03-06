<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>출석 확인</title>
</head>
<script src="${root}/js/jquery.min.js"></script>
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container" style="width: 80%; margin: auto;">
		<h2 align="center">출석 확인</h2>
		<span class="input-group-addon" style="width:100px; float: left;">클래스</span>
		<select class="form-control" style="width:200px; float: left;" name="clss" id="clss">
			<option value="선택">선택</option>
		</select>
		<button class="w3-button w3-round w3-teal" onclick="clssSearch('${root}')">조회</button>
		<br>
		<br>
		<br>
		<div id="abc">학생 출석 정보가 없습니다.</div>
	</div>
	<br><br>
	<input type="hidden" value='${requestScope.json}' id="json">
	<input type="hidden" value='${requestScope.list.size()}' id="listSize">
	<script src="${root}/js/tchrBs/attnd.js"></script>
</body>
</html>