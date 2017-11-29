<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container" style="width: 80%; margin: auto;">
		<h2>댓글 게시판</h2>
		<form action="${root}/homeP/qnaInsert">
			<input type="hidden" value="${requestScope.qnaDto.no}" name="no">
			<input type="hidden" value="${requestScope.qnaDto.gpNum}" name="gpNum">
			<input type="hidden" value="${requestScope.qnaDto.seqLv}" name="seqLv">
			<input type="hidden" value="${requestScope.qnaDto.seqNum}" name="seqNum">
			<table class="w3-table w3-bordered">
				<tr>
					<td>제목 입력</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>내용 입력</td>
					<td><textarea rows="10" cols="165" name="content"></textarea></td>
				</tr>
			</table>
			<div style="float: right;">
				<input type="submit" value="작성">
			</div>	
		</form>
	</div>

</body>
</html>