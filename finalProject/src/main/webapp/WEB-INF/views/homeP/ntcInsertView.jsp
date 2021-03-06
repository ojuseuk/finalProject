<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container" style="width: 70%; margin: auto;">
		<h2 align="center">공지사항 등록</h2>
		<form action="${root}/ntcInsert" method="POST"  enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
			<table class="w3-table w3-bordered">
				<tr>
					<td><span class="input-group-addon" style="width:100px">게시글 제목</span></td>
					<td><input class="form-control" type="text" name="title" size="118"></td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:100px">게시글 내용</span></td>
					<td><textarea class="form-control" rows="10" cols="120" name="content"></textarea></td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:100px">첨부파일</span></td>
					<td><input class="form-control" type="file" name="ntcFile"></td>
				</tr>
			</table>
			<br>
			<div style="text-align: center;">
				<input class="w3-button w3-round-large w3-teal" type="submit" value="공지사항 등록">
			</div>
		</form>
	</div>
</body>
</html>