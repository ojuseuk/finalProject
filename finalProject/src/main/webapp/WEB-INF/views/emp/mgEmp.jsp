<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ajax post방식으로 전송해야할경우 JSP파일에 필수로 존재해야함. -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<!-- ajax post방식으로 전송해야할경우 JSP파일에 필수로 존재해야함. -->
<title>인사 관리</title>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
#datatable{
    background-color:#fff;
}
</style>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<br><br>
<div style="width: 80%; margin: auto;">
	<div style="width: 50%; float: left;">
		<form action="empInsert" id="frmEmp" name="frmEmp">
			<fieldset style="width: 100%">
				<legend>사용자 정보</legend>
				<table>
					<tr>
						<td><span class="input-group-addon" style="width:100px">사용자 ID</span></td>
						<td><input class="form-control" style="float: left;" type="text" name="id" id="id2" 
							<c:if test="${not empty emp.id}">
								value = ${emp.id}
							</c:if>
							/></td>
						<td><input class="w3-button w3-round-large w3-teal w3-tiny" type="button" value="조회"
							onclick="searchUsr('${pageContext.request.contextPath}', document.getElementById('id2').value)">
						</td>
						
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">이름</span></td>
						<td><input class="form-control" type="text" name="nm" id="nm2" 
						<c:if test="${not empty emp.nm}">
							value = ${emp.nm}
						</c:if>
						/></td>
					</tr>
				</table>
			</fieldset>				
			<fieldset style="width: 100%">
				<legend>직원 정보</legend>
				<table>
					<tr>
						<td><span class="input-group-addon" style="width:100px">사원번호</span></td>
						<td>
						<input class="form-control" type="text" name="empNo" id="empNo"/>  					
							<c:if test="${not empty emp.empNo}">
								value = ${emp.empNo}
							</c:if>
						</td>
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">급여</span></td>
						<td><input class="form-control" type="text" name="slr" id="slr" 
						<c:if test="${not empty emp.slr}">
							value = ${emp.slr}
						</c:if>
						/></td>
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">퇴사 일자</span></td>
						<td><input class="form-control" style="float: left;" type="date" name="retiredDt" placeholder="퇴사일자"
							id="retiredDt" 
							<c:if test="${not empty emp.retiredDt}">
								value = ${emp.retiredDt}
							</c:if>
							/></td>
						<td><input class="w3-button w3-round-large w3-teal w3-tiny" type="button" value="퇴직처리"
							onclick="empRetire('${pageContext.request.contextPath}', document.getElementById('empNo').value)">
						</td>
					</tr>
				</table>
			</fieldset>
			<br>
			<br> 
			<input class="w3-button w3-round-large w3-teal" type="reset" value="화면 초기화"> 
			<input class="w3-button w3-round-large w3-teal" type="submit" value="직원 등록"> 
			
			<!-- 동기 방식 -->
			<input class="w3-button w3-round-large w3-teal" type="button" value="수정 내용 저장" onclick="empUpdate()">
			<%-- 비동기 처리 시
	 			<input type="button" value="수정 내용 저장" onclick="empUpdate('${pageContext.request.contextPath}', '${data.empNo}')"> 
	 		--%>
			<input class="w3-button w3-round-large w3-teal" type="button" onclick="javascript:history.back()" value="이전 화면으로">
	 		<input type="hidden" id="resultMsg" value="${requestScope.resultMsg}">
	
		</form>
	</div>
	<input type = "hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type = "hidden" id="root" value='${root}'>

	<!-- 리스트 출력 -->
		<!-- 직원 리스트 DataTable -->
	<div id="demo" class="card mb-3" style="width:50%; height:200px; display:inline-block;">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead style="background-color: #90909096">
						<tr>
							<th>ID</th>
							<th>사번</th>
							<th>이름</th>
							<th>급여</th>
							<th>퇴사일자</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<br>
<script src="${root}/js/emp/emp.js"></script>
<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>