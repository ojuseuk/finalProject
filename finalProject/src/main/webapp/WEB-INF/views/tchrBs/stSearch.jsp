<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<style>
.select {
    width: 200px;
    height: 30px;
    padding-left: 10px;
    font-size: 15px;
    color: #424242;
    border: 1px solid #90909096;
    border-radius: 3px;
}
</style>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div style="margin-top: 20px"></div>
<div style="width: 80%; margin: auto;">
	<input type="hidden" value='${requestScope.json }' id="json">
	<h2 align="center">성적 조회</h2>
	<div align="right">
	반 선택 : <select class="select" name="clss" id="clss">
		<option value="선택">선택</option>
	</select>
	<button class="w3-button w3-border" style="background-color: #90909096" onclick="stSearch('${root}')">조회</button>
	</div>
</div>
<br>
<div class="container-fluid" style="width: 80%; margin: auto;">
	<div id="demo" class="card mb-3">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" style="text-align: center;">
					<thead style="background-color: #90909096; align:center">
						<tr>
							<th>학생 번호</th>
							<th>학생 이름</th>
							<th>모의고사 이름</th>
							<th>과목명</th>
							<th>점수</th>
						</tr>
					</thead>
					<tbody style="background-color: white;">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${root}/js/tchrBs/stSearch.js"></script>
</body>
</html>