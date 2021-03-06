<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>과정 관리</title>
<style>
#datatable{
    background-color:#fff;
}
p {
	margin-top: 0px;
	margin-bottom: 0px;
}
</style>
<script src="${root}/js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div style="margin-top: 20px"></div>
<div style="width: 80%; margin: auto;">
	<div style="width: 50%; float: left;">
	 	<form id="frmCrs" action="courseInsert">
			<fieldset style="width: 100%">
				<legend>교육 과정</legend>
				<table>
					<tr>
						<td><span class="input-group-addon" style="width:100px">구&nbsp;분</span></td>
						<td>
							<input type="radio" name="crsTp" id="crsTp_1" value="종합" onclick="crsTpRadio('종합')"/> 종합
							<input type="radio" name="crsTp" id="crsTp_2" value="특강" onclick="crsTpRadio('특강')"/> 단과
						</td>
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">과정  ID</span></td>
						<td><input class="form-control" type="text" name="crsId" id="crsId"/></td>
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">과&nbsp;목</span></td>
	  					<td>
							<select class="form-control" name="sbjtNm" id="sbjtNm">
								<option value="">과목 선택</option>
								<c:forEach items="${requestScope.sbjtList}" var="data">
									<option value=${data.sbjtNm}>${data.sbjtNm}</option>
								</c:forEach>
							</select>
						</td>
					</tr>  
					<tr>
						<td><span class="input-group-addon" style="width:100px">과정명</span></td>
						<td><input class="form-control" type="text" name="crsNm" id="crsNm"/></td>
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">기간</span></td>
						<td><input class="form-control" type="number" name="prd" id="prd"/></td>
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">일 수업시간</span></td>
						<td><input class="form-control" style="width:350px; float: left;" type="number" name="dayClssTm" id="dayClssTm"/>
						&nbsp;&nbsp;&nbsp;&nbsp;시간/일</td>
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">수강료</span></td>
						<td><input class="form-control" type="text" name="stdtclssttn" id="stdtclssttn" placeholder="원"/></td>
					</tr>
					<tr>
						<td><span class="input-group-addon" style="width:100px">과정 소개</span></td>
						<td><textarea class="form-control" name="crsIntro" id="crsIntro" cols=	"50" rows = "7" 
	                              placeholder="200자 이내"></textarea></td>
					</tr>
				</table>
			</fieldset><br><br>
			<input class="w3-button w3-round w3-teal" type="reset" value="화면 초기화"> 
	 		<input class="w3-button w3-round w3-teal" type="submit" value="과정 등록"> 
			<input class="w3-button w3-round w3-teal" type="button" value="수정 내용 저장" onclick="courseUpdate()">
			<input class="w3-button w3-round w3-teal" type="button" onclick="javascript:history.back()" value="이전 화면으로"><br>
		</form>
	</div>
	<input type="hidden" id="resultMsg" value="${resultMsg}">
	<input type = "hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type = "hidden" id="root" value='${root}'>
		
		<!-- 과정 리스트 DataTable -->
	<div id="demo" class="card mb-3" style="width:50%; height:200px; display:inline-block;">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead style="background-color: #90909096">
						<tr>
							<th>과정 ID</th>
							<th>과목</th>
							<th>과정명</th>
							<th>수업일수</th>
							<th>수강료</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>	<!-- 과정 리스트 DataTable -->

	
	
	
<script src="${root}/js/course/course.js"></script>
	
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>