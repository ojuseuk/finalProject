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
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container">
		<h2>문제 수정</h2>

		<table class="w3-table w3-bordered">
			<tr>
				<th>문제 ID</th>
				<th>과목명</th>
				<th>토픽명</th>
				<th>문제 제목</th>
			</tr>
			<c:forEach items="${requestScope.list}" var="ttlqz">
				<tr>
					<td><a href="${root}/tchrBs/qzUpdateSearch?id=${ttlqz.id}">${ttlqz.id}</a></td>
					<td>${ttlqz.sbjtNm}</td>
					<td>${ttlqz.tpcNm}</td>
					<td>${ttlqz.title}</td>
				</tr>
				
			</c:forEach>
		</table>
	</div>
</body>
</html>