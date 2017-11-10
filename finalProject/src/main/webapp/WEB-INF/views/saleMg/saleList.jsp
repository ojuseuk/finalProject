<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>

	<div class="w3-container">
		<h2>Bordered Table</h2>

		<table class="w3-table w3-bordered">
			<tr>
				<th>번호</th>
				<th>년</th>
				<th>월</th>
				<th>일</th>
				<th>비용항목</th>
				<th>금액</th>
			</tr>
			<c:forEach items="${requestScope.list}" var="sale">
				<tr>
					<td>${sale.no}</td>
					<td>${sale.year}</td>
					<td>${sale.month}</td>
					<td>${sale.day}</td>
					<td>${sale.costItem}</td>
					<td>${sale.amount}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
