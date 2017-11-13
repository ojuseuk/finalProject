<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	${requestScope.list} --%>
미지급 인원
	<table border="1">
		<tr>
			<td>
			이름
			</td>
			<td>
			월급
			</td>
		</tr>
		<c:forEach items="${requestScope.list}" var="tchr">
			<c:if test="${tchr.result == 1}">
				<tr>
					<td>
					${tchr.nm}
					</td>
					<td>
					${tchr.slr}
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>

지급 인원

	<table border="1">
		<tr>
			<td>
			이름
			</td>
			<td>
			월급
			</td>
		</tr>
		<c:forEach items="${requestScope.list}" var="tchr">
			<c:if test="${tchr.result == 2}">
				<tr>
					<td>
					${tchr.nm}
					</td>
					<td>
					${tchr.slr}
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>