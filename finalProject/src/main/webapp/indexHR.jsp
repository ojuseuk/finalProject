<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/stdt">
<!-- 		<input type="text" name="test1"> -->
<!-- 		<input type="text" name="test2"> -->
		<input type="submit" value="테스트">
	</form>
	<br><hr><br>
	<button onclick="location.href='${pageContext.request.contextPath}/emp'">직원 관리</button>
	<button onclick="location.href='${pageContext.request.contextPath}/mgTchr'">강사 관리</button>
	
		<br><hr><br>
	<button onclick="location.href='${pageContext.request.contextPath}/course'">과정 관리</button>
	<button onclick="location.href='/course">직원 관리</button>
	<button onclick="location.href='/course">강사 관리</button>
</body>
</html>