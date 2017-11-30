<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="${root}/js/jquery.min.js"></script>
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container" style="width: 80%; margin: auto;">
		<h2 align="center">문제 생성</h2>

		<form action="${root}/tchrBs/ttlqzInsert">
			<table class="w3-table w3-bordered">
				<tr>
					<td><span class="input-group-addon" style="width:200px">과목명</span></td>
					<td>
						<select class="form-control" style="width:300px" name="sbjtNm" onchange="sbjtNmClick()" id="sbjtNm">
							<option value="선택" id="sbjtDefault">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:200px">강사 번호</span></td>
					<td>
						<select class="form-control" style="width:300px" name="tchrNo" id="tchrNo">
							<option value="선택" id="tchrDefault">선택</option>
							<%-- <c:forEach items="${requestScope.listTchr}" var="tchr">
								<option value="${tchr.tchrNo}">${tchr.tchrNo}</option>
							</c:forEach> --%>
						</select>
					</td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:200px">토픽명</span></td>
					<td>
						<select class="form-control" style="width:300px" name="tpcNm" id="tpcNm" onclick="tpcNmClick()">
							<option value="선택" id="sbjtDefault">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:200px">문제 제목</span></td>
					<td><textarea class="form-control" rows="3" cols="100" name="title"></textarea></td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:200px">문제 내용</span></td>
					<td><textarea class="form-control" rows="10" cols="100" name="content"></textarea></td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:200px">문제 답(골라야 함)</span></td>
					<td><textarea class="form-control" rows="10" cols="100" name="solution"></textarea></td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:200px">문제 난이도</span></td>
					<td>
						<select class="form-control" style="width:300px" name="degree">
							<option value="상">상</option>
							<option value="중">중</option>
							<option value="하">하</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:200px">문제 정답</span></td>
					<td><input class="form-control" type="text" name="answer"></td>
				</tr>
				<tr>
					<td><span class="input-group-addon" style="width:200px">첨부 파일</span></td>
					<td><input class="form-control" type="file" value="파일 첨부" name="imgFile"></td>
				</tr>
			</table>
			<p align="center"><input class="w3-button w3-border" style="background-color: #90909096; width:30%; align:center" type="submit" value="문제 생성"></p>
		</form>
	</div>
	<br><br><br>
	<input type="hidden" value='${requestScope.json}' id="json">
	<input type="hidden" value='${requestScope.jsonTchr}' id="jsonTchr">
	<input type="hidden" value="${requestScope.listTpc.size()}" id="list">
	<script type="text/javascript" src="${root}/js/tchrBs/qzView.js"></script>
</body>
</html>