<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강좌 관리</title>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>	
<style type="text/css">
.select {
    width: 198px;
    height: 30px;
    padding-left: 10px;
    font-size: 15px;
    color: #424242;
    border: 1px solid #90909096;
    border-radius: 3px;
}
</style>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div style="margin-top: 20px"></div>
<div style="width: 90%; margin: auto;">
<div style="width: 45%; float: left">
 	<form action="clssInsert.do" id="frmClss">
		<fieldset style="width: 100%">
			<legend>교육 과정</legend>
			<table>
				<tr>
					<td width="18%">과목명 </td>
					<td><select class="select" name="sbjtNm" id="sbjtNm" required onchange="crsSelect('${root}', this.value);
																			 tchrSelectBySbjtNm('${root}', this.value)">
							<option value="">과목 선택</option>
							<c:forEach items="${requestScope.sbjtList}" var="data">
								<option value=${data.sbjtNm}>${data.sbjtNm}</option>
							</c:forEach>
						</select></td>
				</tr>  
				<tr>
					<td width="18%">과정명 </td>
					<td><select class="select" name="crsId" id="crsId">
							<option value="">과정 선택</option>
						</select>
					</td>
					<td align="right"><input class="w3-button w3-border" style="background-color: #90909096" type="button" value="해당 과정 강좌 리스트 " onclick="clssSelectByCourse('${root}', document.getElementById('crsId').value)">
					</td>
					
				</tr>
			</table>
		</fieldset>
		<fieldset style="width: 100%">
			<legend>강좌 정보</legend>
			<table >
				<tr>
					<td width="18%">강좌 ID </td>
					<td><input type="text" name="clssId" id="clssId"/></td>
				</tr>
				<tr>
					<td>강좌명 </td>
					<td><input type="text" name="clssNm" id="clssNm" size="50"/></td>
				</tr>
				<tr>
					<td>강좌 기간 </td>
					<td><input type="date" name="strtDt" placeholder="시작일자" id="strtDt"/>부터
					    <input type="date" name="endDt" placeholder="종료일자" id="endDt"/>까지</td>
				</tr>
				<tr>
					<td>수업시간 </td>
					<td><input type="time" name="strtTm" placeholder="시작시각" id="strtTm"/>
					    <input type="time" name="endTm" placeholder="종료시각" id="endTm"/></td>
				</tr>
				<tr>
					<td>수강인원 </td>
					<td><input type="number" name="capa" id="capa"/></td>
				</tr>
				<tr>
					<td>강의실 </td>
					<td><input type="text" name="clssroom" id="clssroom"/></td>
				</tr>
			</table>
		</fieldset><br>
		<input class="w3-button w3-border" style="background-color: #90909096" type="reset" value="화면 초기화"> 
 		<input class="w3-button w3-border" style="background-color: #90909096" type="submit" value="강좌 개설"> 
		<input class="w3-button w3-border" style="background-color: #90909096" type="button" value="수정 내용 저장" onclick="clssUpdate()">
		<input class="w3-button w3-border" style="background-color: #90909096" type="button" value="강사 배정" onclick="tchrShow()">
		<input class="w3-button w3-border" style="background-color: #90909096" type="button" onclick="javascript:history.back()" value="이전 화면으로"><br>
		<br>
		<div>
		<fieldset style="width: 80%" id="fsTchr" hidden>				
			<legend>강사 정보</legend>
			<table style="float:left; height:250px">
				<tr>
					<td width="20%">강사명</td>
					<td>
						<select class="select" name="tchrNo" id="tchrNo" onchange="tchrSelect('${pageContext.request.contextPath}', this.value)">
							<option value="">강사 선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>강의료 </td>
					<td><input type="number" name="slr" id="slr">  
				</tr>
				<tr>
					<td>강사 소개 </td>
					<td><textarea name = "tchrIntro" id="tchrIntro" cols = "40" rows = "7" 
                              placeholder="200자 이내"></textarea></td>
					<td><div id="tchrPhoto"></div> </td>
				</tr>
				<tr>
					<td colspan="3">
						<input class="w3-button w3-border" style="background-color: #90909096" type="button" value="화면초기화" id="btnClear">
						<input class="w3-button w3-border" style="background-color: #90909096" type="button" value="저장" onclick="assgnTchr('${pageContext.request.contextPath}')">
						<input class="w3-button w3-border" style="background-color: #90909096" type="button" value="닫기" onclick="tchrClose()">
					</td>
				</tr>
			</table>
			
			<!-- 강사 리스트 DataTable -->  
			<div id="divDtTchr" class="card mb-3" style="position:absolute; left:47%; width:50%; top:800px; display:inline-block;">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dtTchr">
							<thead style="background-color: #90909096">
								<tr>
									<th>강사번호</th>
									<th>강사명</th>
									<th>과목</th>
								</tr>
							</thead>
							<tbody style="background-color: white;">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 강사 리스트 DataTable -->	
		</fieldset>
		</div>
	</form>
	</div>
	<input type="hidden" id="resultMsg" value="${requestScope.resultMsg}">
	<input type="hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type="hidden" id="root" value='${root}'>

		<!-- 강좌 리스트 DataTable -->
		<div id="demo" class="card mb-3" style="position:absolute; left:47%; width:50%; height:200px; display:inline-block;">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<thead style="background-color: #90909096">
							<tr>
								<th>강좌 ID</th>
								<th>과목</th>
								<th>과정명</th>
								<th>강좌명</th>
								<th>개강일</th>
								<th>수강인원</th>
								<th>강의실</th>
							</tr>
						</thead>
						<tbody style="background-color: white;">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>	<!-- 과정 리스트 DataTable -->
		
	<script src="${root}/js/course/clss.js"></script>
	
<%-- <jsp:include page="../../../footer.jsp"/>	 --%>
</body>
</html>