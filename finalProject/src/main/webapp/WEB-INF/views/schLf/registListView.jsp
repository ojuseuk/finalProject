<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<html>
<head>
<title>수강신청목록</title>
</head>
<body>
<input type="hidden" id="json" value='${requestScope.json}'>
<input type="hidden" id="json" value='${requestScope.fee}'>
<input type="hidden" id="root" value='${root}'>
<c:if test="${not empty requestScope.json}" >
	<div style="width: 100%;">
	<div id="demo" class="card mb-3" align="left"
		style="float: left; width: 100%; height: 200px">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<tr align="center">
						<td>강좌명</td>
						<td>강사명</td>
						<td>기   간</td>
						<td>수강료</td>
						<td>삭제</td>
					</tr>
					<c:forEach items="${requestScope.json}" var="data">
							<tr align="center">
								<td>${data.clssNm}</td>
								<td>${data.nm}</td>
								<td>${data.strtDt} ~ ${data.endDt}</td>
								<td>${data.stdtclssttn}원</td>
								<td align="center">x</td>
							</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</c:if>
</body>
</html>