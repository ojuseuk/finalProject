<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/select.min.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<script	src="https://cdn.datatables.net/select/1.2.3/js/dataTables.select.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="crs" class="card mb-3" align="left"
			style="width: 100%; height: 475px">
			<div class="card-body">
				<h2 align="center">강좌 목록</h2>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<tr>
							<td> 결제 성공</td>
						</tr>
						<tr>
							<td><input type="button" value="수강과정조회" onclick="location.href='${root}/myClssList'"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
</body>
</html>