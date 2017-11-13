<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/insertStdt">
		아이디<input type="text" name="id"><br>
		수강생번호<input type="text" name="stdtNo" value="${stdtNo}">(+1)<br>
		학과<input type="text" name="mjrTp"><br>
		대입응시회수<input type="text" name="retryCnt"><br>
		부모님 연락처<input type="text" name="prntPhone">
	</form>
</body>
</html>