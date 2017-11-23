<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<html>
<head>
<title>수강신청목록</title>
</head>
<jsp:include page="../../../top.jsp"/>
<body>
<div style="width: 100%;">
	<div id="demo" class="card mb-3" align="left"
		style="float: left; width: 100%; height: 310px">
		<div class="card-body">
<%-- 			<h2 align="center">${requestScope.json[0].nm}의 정보</h2> --%>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>강좌명</th>
							<th>강사명</th>
							<th>기   간</th>
							<th>수강료</th>
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

			<p align="right">총 결제 금액 : </p>
	<p align="center"><input id="delClss" type="button" value="선택삭제" onclick="deleClss('${root}')"><button>결제</button></p>

<input type="hidden" id="json" value='${requestScope.json}'>
<input type="hidden" id="root" value='${root}'>

<script type="text/javascript">
$('#dataTable').dataTable().fnDestroy();
	var stdtInfo = $("#json").val();
	var root = $("#root").val();
	stdtInfo = JSON.parse(stdtInfo);

	$('#dataTable').DataTable({
		"scrollY" : 250,
		"scrollCollapse" : true,
		data : stdtInfo,
		columns : [ {
			"data" : "clssNm"
		}, {
			"data" : "nm",
		}, {
			"data" : "strtDt",
			"render" : function(data, type, row, meta){
				return data + "~" + row.endDt + "(" + row.prd + "일)";
			}
		}, {
			"data" : "stdtclssttn",
		} ]
	});
	
</script>
<Br><Br><Br><Br><Br><Br><Br><Br><Br><Br>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>