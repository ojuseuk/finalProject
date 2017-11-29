<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 관리</title>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>	
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div style="width: 80%; margin: auto;">
 	<!-- <form action="tchrInsert.do" id="frmTchr" method="post"> -->
 	<div style="width: 50%; float: left">
  	<form action="tchrInsert.do" id="frmTchr" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
		<fieldset style="width: 100%">
			<legend>사용자 정보</legend>
			<table>
				<tr>
					<td>사용자 ID </td>
					<td><input type="text" name="id" id="id2" />
  						<input type="button" value="조회"
						onclick="searchUsr('${pageContext.request.contextPath}', $('#id2').val());
								 searchEmpById('${pageContext.request.contextPath}', $('#id2').val());
								 searchTchrById('${pageContext.request.contextPath}', $('#id2').val());">
					</td>
				</tr>  
				<tr>
					<td>이름 </td>
					<td><input type="text" name="nm" id="nm2" /></td>
				</tr>
			</table>
		</fieldset>

		<fieldset style="width: 100%">
			<legend>직원 정보</legend>
			<table>
				<tr>
					<td>사원번호 </td>
					<td><input type="text" name="empNo" id="empNo"/>
					</td>
				</tr>  
				<tr>
					<td>급여 </td>
					<td><input type="text" name="slr" id="slr"/></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset style="width: 100%">				
			<legend>강사 정보</legend>
			<table>
				<tr>
					<td>강사번호 :</td>
					<td><input type="text" name="tchrNo" id="tchrNo"/>
					</td>
					
				</tr>  
				<tr>
					<td>담당과목 :</td>
					<td><select name="sbjtChrg" id="sbjtChrg">
							<option value="">과목 선택</option>
							<c:forEach items="${requestScope.sbjtList}" var="data">
								<option value=${data.sbjtNm}>${data.sbjtNm}</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr>
					<td>강사 소개 : </td>
					<td><textarea name = "tchrIntro" id="tchrIntro" cols = "50" rows = "7" 
                              placeholder="200자 이내"></textarea></td>
                    </td>
					<td><div id="tchrPhoto"><%-- <img src="${pageContext.request.contextPath}/imgs/img/T0046.jpg" 
						alt="강사사진" style="width:150px;height:150px;"> --%></div>
                    </td>
				</tr>
				<tr>
					<td>사진 : </td>
                    <td><input type="file" name="imgFile"><br> 
                    </td>
				</tr>
			</table>
		</fieldset>
		<br><br>

		<input type="reset" value="화면 초기화"> 
		<input type="submit" value="강사 등록"> 
		<input type="button" value="수정 내용 저장" onclick="tchrUpdate()">
		<input type="button" onclick="javascript:history.back()" value="이전 화면으로">
 		<input type="hidden" id="resultMsg" value="${requestScope.resultMsg}">
	</form>
	</div>
	<input type = "hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type = "hidden" id="root" value='${root}'>
	
	

	<span width="10%"></span>
	<!-- 리스트 미리 출력 -->
	<div id="demo" class="card mb-3" style="top:30%; width:50%; height:200px; display:inline-block;">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>ID</th>
								<th>사번</th>
								<th>강사번호</th>
								<th>담당과목</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>	
	<script src="${root}/js/tchr/tchr.js"></script>

	
</body>
</html>