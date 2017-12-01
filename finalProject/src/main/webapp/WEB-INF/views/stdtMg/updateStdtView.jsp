<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<html>
<head>
</head>
<title>수강생정보수정</title>

<jsp:include page="../../../top.jsp"/>

<body>
<div style="width: 80%; margin: auto;">
	<div id="demo" class="card mb-3" align="left"
		style="float: left; width: 100%; height: 310px">
		<div class="card-body">
			<h3 align="center">${requestScope.json[0].nm}의 정보</h3>
			<div class="table-responsive">
				<form action="${root}/updateStdt" method="POST">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>아이디</th>
							<th>번   호</th>
							<th>이   름</th>
							<th>주   소</th>
							<th>이메일</th>
							<th>부모님번호</th>
							<th>수강강좌</th>
							<th>대입응시횟수</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<p id="updateForm" align="center">
				<input class="w3-button w3-round w3-teal " id="updateBtn" type="button" value="수정">
				</p>
				</form>
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="json" value='${requestScope.json}'>
<input type="hidden" id="root" value='${root}'>

<script src="${root}/js/stdtMg/updateStdt.js"></script>
<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>