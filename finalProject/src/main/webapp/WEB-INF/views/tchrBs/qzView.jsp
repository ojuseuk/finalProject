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
	<div class="w3-container">
		<h2>문제 생성</h2>

		<form action="${root}/tchrBs/qzInsert">
			<table class="w3-table w3-bordered">
				<tr>
					<td>과목명</td>
					<td>
						<select name="sbjtNm" onchange="sbjtNmClick()" id="sbjtNm">
							<option value="선택" id="sbjtDefault">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>강사 번호</td>
					<td>
						<select name="tchrNo">
							<c:forEach items="${requestScope.listTchr}" var="tchr">
								<option value="${tchr.tchrNo}">${tchr.tchrNo}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>토픽명</td>
					<td>
						<select name="tpcNm" id="tpcNm" onclick="tpcNmClick()">
							<option value="선택" id="sbjtDefault">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>문제 내용</td>
					<td><textarea rows="10" cols="50" name="content"></textarea></td>
				</tr>
				<tr>
					<td>문제 난이도</td>
					<td>
						<select name="degree">
							<option value="상">상</option>
							<option value="중">중</option>
							<option value="하">하</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>문제 정답</td>
					<td><textarea rows="5" cols="20" name="answer"></textarea></td>
				</tr>
				<tr>
					<td>첨부 파일</td>
					<td><input type="file" value="파일 첨부" name="imgFile"></td>
				</tr>
			</table>
			<input type="submit" value="문제 생성">
		</form>
	</div>

	<input type="hidden" value='${requestScope.json}' id="json">
	<input type="hidden" value="${requestScope.listTpc.size()}" id="list">
	<script type="text/javascript" src="${root}/js/tchrBs/qzView.js"></script>
	<script type="text/javascript">

	</script>

</body>
</html>