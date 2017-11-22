<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
	href="${root}/styles/vendor/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<div style="width: 100%;">
	<div id="demo" class="card mb-3" align="left"
		style="float: left; width: 100%; height: 310px">
		<div class="card-body">
			<h2 align="center">${requestScope.json[0].nm}의 정보</h2>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>이   름</th>
							<th>아이디</th>
							<th>학생번호</th>
							<th>주   소</th>
							<th>이메일</th>
							<th>부모님번호</th>
							<th>수강과정</th>
							<th>대입응시횟수</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<p align="center"><input id="updateBtn" type="button" value="수정">
				<input id="saveBtn" type="button" value="저장"></p>
			</div>
		</div>
	</div>
</div>
<input type="hidden" id="json" value='${requestScope.json}'>
<input type="hidden" id="root" value='${root}'>
<script type="text/javascript">
	var stdtInfo = $("#json").val();
	var root = $("#root").val();
	stdtInfo = JSON.parse(stdtInfo);

	$('#dataTable').DataTable({
		"scrollY" : 250,
		"scrollCollapse" : true,
		data : stdtInfo,
		columns : [ {
			"data" : "nm"
		}, {
			"data" : "id",
		}, {
			"data" : "stdtNo"
		}, {
			"data" : "addr",
		}, {
			"data" : "email",
		}, {
			"data" : "prntPhone",
		}, {
			"data" : "clssNm",
		}, {
			"data" : "retryCnt",
		}, {
			"data" : "paidDt",
		} ]
	});
	
	$("#updateBtn").click(function(){
		
	});
</script>
</html>