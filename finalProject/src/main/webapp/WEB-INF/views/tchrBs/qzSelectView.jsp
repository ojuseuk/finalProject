<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root}/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<jsp:include page="../../../top.jsp"/>
	<h2>문제 생성</h2>
	<input type="hidden" value='${requestScope.jsonTchr}' id="jsonTchr">
	<input type="hidden" value='${requestScope.jsonExam}' id="jsonExam">
	<select id="qzSbjtNm" name="sbjtNm">
		<option value="선택">선택</option>
	</select>
	<button onclick="qzSelect('${root}')">조회</button>
	<div id="test">
	
	</div>
<script src="${root}/js/tchrBs/qzSelectView.js"></script>
</body>
</html>