<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<div class="w3-container">
		<h2>공지사항 수정</h2>
		<form action="${root}/ntcUpdate" method="POST"  enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
			<input type="hidden" name="empNo" value="${requestScope.ntcDto.no}">
			<table class="w3-table w3-bordered">
				<tr>
					<td>게시글 제목</td>
					<td><input type="text" name="title" value="${requestScope.ntcDto.title}" size="100"></td>
				</tr>
				<tr>
					<td>게시글 내용</td>
				<td><textarea rows="10" cols="90" name="content">${requestScope.ntcDto.content}</textarea></td>
				</tr>
				<tr>
					<td>기본파일</td>
					<td>${requestScope.ntcDto.attchFile}</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="ntcFile"></td>
				</tr>
			</table>
			<input type="submit" value="공지사항 수정">
		</form>
	</div>
</body>
</html>