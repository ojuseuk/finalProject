<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("adminId", "adminOjs");
 %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root}/js/jquery.min.js"></script>
</head>
<body>
	<a href="${root}/saleMg/accep">수강료 수납</a>
	<a href="${root}/saleMg/ltfee">강사료 지급</a>
	<a href="${root}/saleMg/manager">매출 관리</a>
	<a href="${root}/tchrBs/qzView">문제 생성 페이지</a>
	<a href="${root}/tchrBs/attnd">출석 확인</a>
	<a href="${root}/tchrBs/srcIn">성적 입력</a>
	<a href="${root}/tchrBs/stSearch">학생 조회</a>
	<a href="${root}/tchrBs/qzSelectView">문제 출제</a>
	<a href="${root}/tchrBs/qzUpdateView">문제 수정</a>
</body>
</html>

