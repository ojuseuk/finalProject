<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/stdtAllList">
		<input type="submit" value="수강생조회">
	</form>
		<input type="button" value="수강생등록" onclick="location.href='${pageContext.request.contextPath}/selectStdtNo'"><br>
		<input type="button" value="문자 발송" onclick="location.href='${pageContext.request.contextPath}/testSMS'"><br>
		<input type="button" value="수강 신청" onclick="location.href='${pageContext.request.contextPath}/viewResist'"><br>
</body>
</html>