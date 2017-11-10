<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("adminId", "adminOjs");
 %>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${root}/saleMg/accep">수강료 수납</a>
	<a href="${root}/saleMg/ltfee">강사료 지급</a>
	<a href="${root}/saleMg/manager">매출 관리</a>
	<a href="${root}/saleMg/mgSale2">차트 연습</a>
</body>
</html>
