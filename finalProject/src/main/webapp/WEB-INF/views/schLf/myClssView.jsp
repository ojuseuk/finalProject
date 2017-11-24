<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-x.y.z.js"></script>
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<html>
<head>
<title>나의수강목록</title>
</head>

<jsp:include page="../../../top.jsp"/>
<body>
<c:if test="${not empty requestScope.json}">
<div style="width: 100%;">
	<div id="demo" class="card mb-3" align="left"
		style="float: left; width: 100%; height: 310px">
		<div class="card-body">
			<h2 align="center">나의 수강 정보</h2>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>강좌명</th>
							<th>강사명</th>
							<th>기   간</th>
							<th>등록일</th>
							<th>강의실</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</c:if>
<input type="hidden" id="json" value='${requestScope.json}'>
<input type="hidden" id="root" value='${root}'>
<script type="text/javascript">
	var clssInfo = $("#json").val();
	var root = $("#root").val();
	clssInfo = JSON.parse(clssInfo);

	$('#dataTable').DataTable({
		"scrollY" : 250,
		"scrollCollapse" : true,
		data : clssInfo,
		columns : [ {
			"data" : "clssNm"
		}, {
			"data" : "nm"
		}, {
			"data" : "strtDt",
			"render" : function(data, type, row, meta){
				return data + "~" + row.endDt;
			}
		}, {
			"data" : "paidDt"
		}, {
			"data" : "clssroom"
		} ]
	});
</script>
<!-- <Br><Br><Br><Br><Br><Br><Br><Br><Br><Br> -->
<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>