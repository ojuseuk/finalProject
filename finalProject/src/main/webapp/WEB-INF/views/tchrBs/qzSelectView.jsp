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
<script src="${root}/js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../../top.jsp"/>

<div style="margin-top: 20px"></div>
<div style="width: 80%; margin: auto;">
	<h2 align="center">시험 출제</h2>
		<input type="hidden" value='${requestScope.jsonTchr}' id="jsonTchr">
		<input type="hidden" value='${requestScope.jsonExam}' id="jsonExam">
	<select class="form-control" style="width:200px; float: left;" id="qzSbjtNm" name="sbjtNm">
		<option value="선택">선택</option>
	</select>
		<button class="w3-button w3-round-large w3-teal" onclick="qzSelect('${root}')">조회</button>
	<div id="test"></div>
</div>
<script src="${root}/js/tchrBs/qzSelectView.js"></script>
</body>
</html>