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
</head>
<body>
<jsp:include page="../../../top.jsp"/>
	<form action="empInsert" id="frmEmp" name="frmEmp">
		<fieldset style="width: 40%">
			<legend>사용자 정보</legend>
			<table>
				<tr>
					<td>사용자 ID :</td>
					<td><input type="text" name="id" id="id2" 
						<c:if test="${not empty emp.id}">
							value = ${emp.id}
						</c:if>
						/>
						<input type="button" value="조회"
						onclick="searchUsr('${pageContext.request.contextPath}', document.getElementById('id2').value)">
					</td>
					
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="nm" id="nm2" 
					<c:if test="${not empty emp.nm}">
						value = ${emp.nm}
					</c:if>
					/></td>
				</tr>
			</table>
		</fieldset>				
		<fieldset style="width: 40%">
			<legend>직원 정보</legend>
			<table>
				<tr>
					<td>사원번호 :</td>
					<td><input type="text" name="empNo" id="empNo"  					
					<c:if test="${not empty emp.empNo}">
						value = ${emp.empNo}
					</c:if>
					/></td>

				</tr>
				<tr>
					<td>급여 :</td>
					<td><input type="text" name="slr" id="slr" 
					<c:if test="${not empty emp.slr}">
						value = ${emp.slr}
					</c:if>
					/></td>
				</tr>
				<tr>
					<td>퇴사 일자 :</td>
					<td><input type="date" name="retiredDt" placeholder="퇴사일자"
						id="retiredDt" 
						<c:if test="${not empty emp.retiredDt}">
							value = ${emp.retiredDt}
						</c:if>
						/>
						<input type="button" value="퇴직처리"
						onclick="empRetire('${pageContext.request.contextPath}', document.getElementById('empNo').value)">
					</td>
				</tr>
			</table>
		</fieldset>
		<br>
		<br> 
		<input type="reset" value="화면 초기화"> 
		<input type="submit" value="직원 등록"> 
		
		<!-- 동기 방식 -->
		<input type="button" value="수정 내용 저장" onclick="empUpdate()">
		<%-- 비동기 처리 시
 			<input type="button" value="수정 내용 저장" onclick="empUpdate('${pageContext.request.contextPath}', '${data.empNo}')"> 
 		--%>
		<input type="button" onclick="javascript:history.back()" value="이전 화면으로">
 		<input type="hidden" id="resultMsg" value="${requestScope.resultMsg}">

	</form>
	<input type = "hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type = "hidden" id="root" value='${root}'>




	<!-- 리스트 출력 -->
		<!-- 직원 리스트 DataTable -->
		<div id="demo" class="card mb-3" style="position:absolute; top:45%; left:750px; width:700px; height:200px; display:inline-block;">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<thead>
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

<br>

	<script src="${root}/js/emp/emp.js"></script>

<jsp:include page="../../../footer.jsp"/>
</body>
</html>