<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:if test="${not empty requestScope.list}">
	<table id="myClssList" border="0" cellpadding="5" cellspacing="2"
		width="100%" bordercolordark="white" bordercolorlight="black">
		<tr>
			<div width="100%" align="center">
				<td><p>
					<b>나의수강목록</b>
				</p></td>
			</div>
		</tr>
		<tr>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>강좌명</b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>강사명</b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>기 간</b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>등록일</b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>강의실</b></font>
				</p></td>
		</tr>
		<c:forEach items="${requestScope.list}" var="data">
			<tr>
				<td bgcolor="">
					<p align="center">${data.clssNm}</p>
				</td>
				<td bgcolor="">
					<p align="center">${data.nm}</p>
				</td>
				<td bgcolor="">
					<p align="center">${data.strtDt}~${data.endDt}</p>
				</td>
				<td bgcolor="">
					<p align="center">${data.paidDt}</p>
				</td>
				<td bgcolor="">
					<p align="center">${data.clssroom}</p>
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>