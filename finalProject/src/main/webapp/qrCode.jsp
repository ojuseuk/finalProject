<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

// 	request.setAttribute("clss", "ab");

	String clss = request.getParameter("clss");
	String phone = request.getParameter("phone");
	String attnd = request.getParameter("attnd");
	System.out.print(clss);
	System.out.print(phone);
	System.out.print(attnd);
	System.out.println();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js" ></script>
</head>
<body>
	<input type="hidden" value="${requestScope.url}" name="url" id="url">
	<c:set var="url2" value="/qrCode?phone=${requestScope.phone}&attnd=${requestScope.attnd}&clss=${requestScope.clss}"/>
	<input type="text" value="${url2}">
	${url2}
	<c:redirect url="${url2}"/>

	<script type="text/javascript">
		$(document).ready(function(){
			alert("aaa");
			alert($('#url').val());
		})
	</script>
</body>
</html>