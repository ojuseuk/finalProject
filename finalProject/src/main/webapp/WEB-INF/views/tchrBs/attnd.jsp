<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${root}/js/jquery.min.js"></script>
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container">
		<h2>강사 업무 - 출석 확인</h2>

		<select name="clss" id="clss">
			<option value="선택">선택</option>
		</select>
		<button onclick="clssSearch('${root}')">조회</button>

		<div id="default">
			<table class="w3-table w3-bordered">
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
				</tr>
				<tr>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
				</tr>
				<tr>
					<td>abc</td>
					<td>abc</td>
					<td>abc</td>
					<td>abc</td>
					<td>abc</td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<br>
		<div id="abc">학생 출석 정보가 없습니다.</div>
	</div>

	<input type="hidden" value='${requestScope.json}' id="json">
	<input type="hidden" value='${requestScope.list.size()}' id="listSize">
	<script src="${root}/js/tchrBs/attnd.js"></script>
</body>
</html>