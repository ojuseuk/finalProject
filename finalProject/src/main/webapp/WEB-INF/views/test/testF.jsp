<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <meta http-equiv="Refresh" content="2" url="${root}/testSMS"> --%>
<title>Insert title here</title>
</head>
<body>
	문자발송실패
	<input type="button" value="이전화면" onclick="location.href='${root}/testSMS'">
</body>
</html>