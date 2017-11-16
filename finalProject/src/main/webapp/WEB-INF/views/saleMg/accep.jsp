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
	<form action="${root}/saleMg/saleMgInsert" method="get">
		<div class="w3-container" >
			<h2>수강료 수납</h2>
	
			<table class="w3-table">
				<tr>
					<td>날짜</td>
					<td>
						<input type="date" name="date">
					</td>
				</tr>
				<tr>
					<td>수강 금액</td>
					<td>
						<input type="text" name="amount">
					</td>
				</tr>
			</table>
		</div>
		<div align="center">
			<input type="submit" value="매출 입력">
		</div>
	</form>
</body>
</html>