<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
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
		<form action="${root}/homeP/qnaUpdate">
			<input type="hidden" value="${requestScope.qnaDto.no}" name="no">
			<input type="hidden" value="${requestScope.qnaDto.gpNum}" name="gpNum">
			<input type="hidden" value="${requestScope.qnaDto.seqLv}" name="seqLv">
			<input type="hidden" value="${requestScope.qnaDto.seqNum}" name="seqNum">
			<table class="w3-table w3-bordered">
				<tr>
					<td>제목 입력</td>
					<td><input type="text" name="title" value="${requestScope.qnaDto.title}"></td>
				</tr>
				<tr>
					<td>내용 입력</td>
					<td><textarea rows="10" cols="40" name="content">${requestScope.qnaDto.content}</textarea></td>
				</tr>
			</table>
			<input class="w3-button w3-round-large w3-teal" type="submit" value="작성">	
		</form>
	</div>

</body>
</html>