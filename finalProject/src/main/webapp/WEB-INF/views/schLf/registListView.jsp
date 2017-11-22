<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청목록</title>
<jsp:include page="../../../top.jsp"/>
<div>
	<c:if test="${not empty requestScope.list}">
			<table id="appClssList" border="0" cellpadding="5" cellspacing="2"
				width="100%" bordercolordark="white" bordercolorlight="black">
				<tr>
					<div width="100%" align="center">
						<td><p>
								<b>수강신청목록</b>
							</p></td>
					</div>
				</tr>
				<tr>
					<td bgcolor="#336699"><p align="center">
							<font color="white"><b>선 택</b></font>
						</p></td>
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
							<font color="white"><b>수강료</b></font>
						</p></td>
				</tr>
				<c:forEach items="${requestScope.list}" var="data">
					<tr>
						<td><p align="center">
							<input id="delCheck" type="checkbox" value="${data.clssId}">
							</p></td>
						<td bgcolor="">
							<p align="center">${data.clssNm}</p>
						</td>
						<td bgcolor="">
							<p align="center">${data.nm}</p>
						</td>
						<td bgcolor="">
							<p align="center">${data.strtDt}~ ${data.endDt}</p>
						</td>
						<td bgcolor="">
							<p align="center">${data.stdtclssttn}</p>
						</td>
					</tr>
				</c:forEach>
			</table>
			<p align="right">총 결제 금액 : ${requestScope.fee}</p>
	<p align="center"><input id="delClss" type="button" value="선택삭제" onclick="deleClss('${root}')"><button>결제</button></p>
</c:if>
</div>
<Br><Br><Br><Br><Br><Br><Br><Br><Br><Br>
<jsp:include page="../../../footer.jsp"/>