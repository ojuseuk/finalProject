<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% System.out.print("16"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교육 과정 목록</title>
</head>
<body>
	<button onclick="location.href='${pageContext.request.contextPath}/course'">과정 등록</button>
	<button onclick="location.href='${pageContext.request.contextPath}/courseList.do'">과정 목록</button>
	<button onclick="location.href='${pageContext.request.contextPath}/course'">강좌 개설</button>
	<button onclick="location.href='${pageContext.request.contextPath}/course'">반 배치</button>
	
	<br><hr><br>
<h3>등록된 교육 과정 목록</h3>
<!-- cellpadding="5" cellspacing="2"  -->
<table align="center" border="1" width="60%" bordercolorlight="black">
	<tr>
        <td bgcolor="#336699">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">과정 ID</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">과목</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">과정명</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">수업 일수</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">수강료</span></b></font></p>
        </td>
    </tr>
    
	<c:if test="${empty list || fn:length(list) == 0}">
		<tr>
	        <td colspan="5">
	            <p align="center"><b><span style="font-size:9pt;">등록된 교육과정이 없습니다.</span></b></p>
	        </td>
	    </tr>
	</c:if>
	
	<c:forEach items="${requestScope.list}" var="data">
		    <tr>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">${data.crsId}</span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">${data.sbjtNm}</a></span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">${data.crsNm}</a></span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">${data.prd}</a></span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">${data.stdtclssttn}</a></span></p>
		        </td>

		    </tr>
	</c:forEach>
</table>

</body>
</html>