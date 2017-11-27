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
					<td><input type="text" name="id" id="id1" 
						<c:if test="${not empty emp.id}">
							value = ${emp.id}
						</c:if>
						/>
						<input type="button" value="조회"
						onclick="searchUsr('${pageContext.request.contextPath}', document.getElementById('id').value)">
					</td>
					
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="nm" id="nm1" 
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
	</form>
	<input type = "hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type = "hidden" id="root" value='${root}'>

	<script type="text/javascript">
		/* spring-security를 사용할 경우 해아할 header와 token
			만약 getAttribute('content')를 했을경우 ''가 찍힌다면 spring-security의 
			csrf 방어를 할지 안할지의 여부 확인 필요.
		*/
		var token = document.getElementById('_csrf').getAttribute('content');
		var header = document.getElementById('_csrf_header').getAttribute('content');
		var xhttp = new XMLHttpRequest();
		var data;
		
		
		/* 사원번호로 TB_EMP 업데이트 - 동기 방식*/
		function empUpdate(){
			document.getElementById("frmEmp").action = "${pageContext.request.contextPath}/empUpdate";
			document.getElementById("frmEmp").submit();
		}
		
		var root = document.getElementById("root").value;
		var jsonList = document.getElementById("jsonList").value;
		console.log(jsonList);
		jsonList = JSON.parse(jsonList);
		
		/* dataTable 처리 */
		$(document).ready(function(){
			$('#dataTable').DataTable({
				"language": {
					    search: "검색 : " ,
			            "thousands": ","
				},
				"scrollY" : 330,
				"scrollCollapse" : true,
				data : jsonList,
				columns : [ {
					"data" : "id",
					"searchable": false
					}, {
						"data" : "empNo",
						"searchable": false,
						"render" : function(data, type, row, meta){
							data = '<div align="center"><input type="button" value="' + data + '" onclick="empSelect(\''+root+'\', \''+data+'\')"></div>';
							return data;
						}
					}, {
						"data" : "nm",
					}, {
						"data" : "slr",
						"render" : function(data){
							data = '<div align="right">' + data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '</div>';	
							return data;
						}
					}, {
						"data" : "retiredDt"
					}]
			});
		});
 
		
		/* 직원 퇴사 처리 : 퇴사일자 업데이트 */
		function empRetire(root, empNo){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					
					document.getElementById("empNo").value = data.empNo;
					document.getElementById("id1").value = data.id;
					document.getElementById("nm1").value = data.nm;
					document.getElementById("slr").value = data.slr;
					document.getElementById("retiredDt").value = data.retiredDt;
				}
			}
			empNo = document.getElementById("empNo").value;
			id = document.getElementById("id1").value;
			nm1 = document.getElementById("nm").value;
			slr = document.getElementById("slr").value;
			retiredDt = document.getElementById("retiredDt").value;
			
			
			var params = "empNo=" + empNo + "&";
			params += "retiredDt=" + retiredDt;
			alert(empNo + id + nm + slr); 		
			alert(params);	
			xhttp.open("POST", root + "/empRetire", true);
			/* post 사용시에 필수로필요한 Content-Type */
			xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			
			/* spring-security를 사용할 경우 해아할 setRequestHeader */
			/* xhttp.setRequestHeader(header, token); */
			xhttp.send(params);
		}
		
		/* 사용자 ID로 TB_USR 검색 */
		function searchUsr(root,id){
			console.log(root,id);
			
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("nm").value = data.nm;
				}
			}
			xhttp.open("GET", root + "/usrSearch?id=" + id, true);
			xhttp.send();
		}
		
 		function inputNumberFormat(slr) {
		    return String(slr).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		/* 사원번호로 TB_EMP 검색 */
		function empSelect(root, empNo){
			
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					console.log(data);
					data = JSON.parse(data);
					document.getElementById("empNo").value = data.empNo;
					document.getElementById("id1").value = data.id;
					document.getElementById("nm1").value = data.nm;
					document.getElementById("slr").value = inputNumberFormat(data.slr);
					document.getElementById("retiredDt").value = data.retiredDt;
					document.getElementById("empNo").readOnly = true;
					document.getElementById("nm1").readOnly = true;
				}
			}
			xhttp.open("GET", root + "/empSelect?empNo=" + empNo, true);
			xhttp.send();
		}
		

	</script>


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
		<!-- 직원 리스트 DataTable -->
		
<!-- 	<div id="viewEmpList" -->
<!-- 		style="position: absolute; top: 250px; left: 600px; width: 700px; height: 200px; display: inline-block;"> -->

<!-- 		<table align="center" border="1" width="60%" bordercolorlight="black"> -->
<!-- 			<tr> -->
<!-- 				<td bgcolor="#336699"> -->
<!-- 					<p align="center"> -->
<!-- 						<font color="white"><b><span style="font-size: 9pt;">ID</span></b></font> -->
<!-- 					</p> -->
<!-- 				</td> -->
<!-- 				<td bgcolor="#336699"> -->
<!-- 					<p align="center"> -->
<!-- 						<font color="white"><b><span style="font-size: 9pt;">사원번호</span></b></font> -->
<!-- 					</p> -->
<!-- 				</td> -->
<!-- 				<td bgcolor="#336699"> -->
<!-- 					<p align="center"> -->
<!-- 						<font color="white"><b><span style="font-size: 9pt;">이름</span></b></font> -->
<!-- 					</p> -->
<!-- 				</td> -->
<!-- 				<td bgcolor="#336699"> -->
<!-- 					<p align="center"> -->
<!-- 						<font color="white"><b><span style="font-size: 9pt;">급여</span></b></font> -->
<!-- 					</p> -->
<!-- 				</td> -->
<!-- 				<td bgcolor="#336699"> -->
<!-- 					<p align="center"> -->
<!-- 						<font color="white"><b><span style="font-size: 9pt;">퇴사일자</span></b></font> -->
<!-- 					</p> -->
<!-- 				</td> -->
<!-- 			</tr> -->

<%-- 			<c:if test="${empty list || fn:length(list) == 0}"> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="7"> -->
<!-- 						<p align="center"> -->
<!-- 							<b><span style="font-size: 9pt;">등록된 직원이 없습니다.</span></b> -->
<!-- 						</p> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>

<%-- 			<c:forEach items="${requestScope.list}" var="data"> --%>
<!-- 				<tr> -->
<!-- 					<td bgcolor=""> -->
<!-- 						<p align="center"> -->
<%-- 							<span style="font-size: 9pt;">${data.id}</a></span> --%>
<!-- 						</p> -->
<!-- 					</td> -->
<!-- 					<td bgcolor=""> -->
<!-- 						<p align="center"> -->
<!-- 							<span style="font-size: 9pt;">  -->
<%-- 								<input type="button" value=${data.empNo} onclick="empSelect('${pageContext.request.contextPath}', '${data.empNo}')"> --%>
<!-- 							</span> -->
<!-- 						</p> -->
<!-- 					</td> -->
<!-- 					<td bgcolor=""> -->
<!-- 						<p align="center"> -->
<%-- 							<span style="font-size: 9pt;">${data.nm}</a></span> --%>
<!-- 						</p> -->
<!-- 					</td> -->
<!-- 					<td bgcolor=""> -->
<!-- 						<p align="center"> -->
<%-- 							<span style="font-size: 9pt;">${data.slr}</a></span> --%>
<!-- 						</p> -->
<!-- 					</td> -->
<!-- 					<td bgcolor=""> -->
<!-- 						<p align="center"> -->
<%-- 							<span style="font-size: 9pt;">${data.retiredDt}</a></span> --%>
<!-- 						</p> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
<!-- 	</div> -->
	<!-- 리스트 출력 끝-->


<br>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>