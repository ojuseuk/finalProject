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
	
 	<!-- <form action="tchrInsert.do" id="frmTchr" method="post"> -->
  	<form action="tchrInsert.do" id="frmTchr" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
		<fieldset style="width: 40%">
			<legend>사용자 정보</legend>
			<table>
				<tr>
					<td>사용자 ID :</td>
					<td><input type="text" name="id" id="id1" />
  						<input type="button" value="조회"
						onclick="searchUsr('${pageContext.request.contextPath}', document.getElementById('id').value);
								 searchEmpById('${pageContext.request.contextPath}', document.getElementById('id').value);
								 searchTchrById('${pageContext.request.contextPath}', document.getElementById('id').value)">
					</td>
				</tr>  
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="nm" id="nm1" /></td>
				</tr>
			</table>
		</fieldset>

		<fieldset style="width: 40%">
			<legend>직원 정보</legend>
			<table>
				<tr>
					<td>사원번호 :</td>
					<td><input type="text" name="empNo" id="empNo"/>
					</td>
				</tr>  
				<tr>
					<td>급여 :</td>
					<td><input type="text" name="slr" id="slr"/></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset style="width: 55%">				
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
	
	<input type = "hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type = "hidden" id="root" value='${root}'>
	
	<script type="text/javascript">
		var xhttp = new XMLHttpRequest();
		var xhttp2 = new XMLHttpRequest();
		var xhttp3 = new XMLHttpRequest();
		var data;
		resultMsg = document.getElementById("resultMsg").value;
		if(resultMsg != ""){
			alert(resultMsg);
		}
		
		var root = document.getElementById("root").value;
		var jsonList = document.getElementById("jsonList").value;
		console.log(jsonList);
		jsonList = JSON.parse(jsonList);

		/* dataTable 처리 */
		$(document).ready(function(){
			$('#dataTable').DataTable({
				"language": {
					    search: "검색 : " 
				},
//	 			"destroy": true,
				"scrollY" : 400,
				"scrollCollapse" : true,
				data : jsonList,
				columns : [ {
					"data" : "id",
					"searchable": false
					}, {
						"data" : "empNo",
						"searchable": false
					/* <input type="button" value=${data.tchrNo} onclick="tchrSelect('${pageContext.request.contextPath}', '${data.tchrNo}')"></p> */
					}, {
						"data" : "tchrNo",
						"render" : function(data, type, row, meta){
							data = '<div align="center"><input type="button" value="' + data + '" onclick="tchrSelect(\''+root+'\', \''+data+'\')"></div>';
							return data;
						}
					}, {
						"data" : "sbjtChrg"
					}, {
						"data" : "nm"
					}]
			});
		});
		
		
		/* 강사번호로 TB_TCHR 업데이트 */
		function tchrUpdate(){
			document.getElementById("frmTchr").action = "${pageContext.request.contextPath}/tchrUpdate";
			document.getElementById("frmTchr").submit();
		}
		
 		function inputNumberFormat(slr) {
		    return String(slr).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}

		/* 강사번호로 TB_TCHR 검색 */
		function tchrSelect(root, tchrNo){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("tchrNo").value = data.tchrNo;
					document.getElementById("empNo").value = data.empNo;
					document.getElementById("id1").value = data.id;
					document.getElementById("nm1").value = data.nm;
					console.log(data.nm);
 					document.getElementById("slr").value = inputNumberFormat(data.slr); 
					document.getElementById("sbjtChrg").value = data.sbjtChrg;
					document.getElementById("tchrIntro").value = data.tchrIntro;
					
					tag = '<img src="${pageContext.request.contextPath}/imgs/img/';
					tag += data.tchrPt + '" style="width:150px;height:150px;">';
					
					console.log(tag);
					document.getElementById("tchrPhoto").innerHTML = tag;
					
					
					document.getElementById("empNo").readOnly = true;
					document.getElementById("nm1").readOnly = true;
					document.getElementById("slr").readOnly = true;
				}
			}
			xhttp.open("GET", root + "/tchrSelect?tchrNo=" + tchrNo, true);
			xhttp.send();
		}
		
		/* 사용자 ID로 TB_USR 검색 */
		function searchUsr(root,id){
			console.log(root,id);
			
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("nm1").value = data.nm;
				}
			}
			xhttp.open("GET", root + "/usrSearch?id=" + id, true);
			xhttp.send();
		}
		
		/* 사용자 ID로 TB_EMP 검색 */
 		function searchEmpById(root,id){
			console.log(root,id);
			
			xhttp2.onreadystatechange = function(){
				if (xhttp2.readyState == 4 && xhttp2.status == 200) {
					data = xhttp2.responseText;
					data = JSON.parse(data);
					document.getElementById("empNo").value = data.empNo;
				}
			}
			xhttp2.open("GET", root + "/empSearchById?id=" + id, true);
			xhttp2.send();
		}
		
		/* 사용자 ID로 TB_TCHR 검색 */
 		function searchTchrById(root,id){
			console.log(root,id);
			
			xhttp3.onreadystatechange = function(){
				if (xhttp3.readyState == 4 && xhttp3.status == 200) {
					data = xhttp3.responseText;
					data = JSON.parse(data);
					document.getElementById("tchrNo").value = data.tchrNo;
				}
			}
			xhttp3.open("GET", root + "/tchrSearchById?id=" + id, true);
			xhttp3.send();
		}
		
	</script>
	

	
	<!-- 리스트 미리 출력 -->
	<div id="demo" class="card mb-3" style="position:absolute; top:30%; left:750px; width:700px; height:200px; display:inline-block;">
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
		
<!-- 	 <div id="viewTchrList" style="position:absolute; top:260px; left:750px; width:700px; height:200px; display:inline-block;"> -->
			
<!-- 		<table align="center" border="1" width="60%" bordercolorlight="black"> -->
<!-- 			<tr> -->
<!-- 		        <td bgcolor="#336699"> -->
<!-- 		            <p align="center"> -->
<!-- 		            <font color="white"><b><span style="font-size:9pt;">ID</span></b></font></p> -->
<!-- 		        </td> -->
<!-- 		        <td bgcolor="#336699"> -->
<!-- 		            <p align="center"> -->
<!-- 		            <font color="white"><b><span style="font-size:9pt;">사번</span></b></font></p> -->
<!-- 		        </td> -->
<!-- 		        <td bgcolor="#336699"> -->
<!-- 		            <p align="center"> -->
<!-- 		            <font color="white"><b><span style="font-size:9pt;">강사번호</span></b></font></p> -->
<!-- 		        </td> -->
<!-- 		        <td bgcolor="#336699"> -->
<!-- 		            <p align="center"><font color="white"><b><span style="font-size:9pt;">담당과목</span></b></font></p> -->
<!-- 		        </td> -->
<!-- 		        <td bgcolor="#336699"> -->
<!-- 		            <p align="center"><font color="white"><b><span style="font-size:9pt;">이름</span></b></font></p> -->
<!-- 		        </td> -->
<!-- 		    </tr> -->
		    
<%-- 			<c:if test="${empty list || fn:length(list) == 0}"> --%>
<!-- 				<tr> -->
<!-- 			        <td colspan="7"> -->
<!-- 			            <p align="center"><b><span style="font-size:9pt;">등록된 강사가 없습니다.</span></b></p> -->
<!-- 			        </td> -->
<!-- 			    </tr> -->
<%-- 			</c:if> --%>
			
<%-- 			<c:forEach items="${requestScope.list}" var="data"> --%>
<!-- 				    <tr> -->
<!-- 				        <td bgcolor=""> -->
<%-- 				            <p align="center"><span style="font-size:9pt;">${data.id}</span></p> --%>
				            
<!-- 				        </td> -->
<!-- 				        <td bgcolor=""> -->
<%-- 				            <p align="center"><span style="font-size:9pt;">${data.empNo}</span></p> --%>
<!-- 				        </td> -->
<!-- 				        <td bgcolor=""> -->
<!-- 				        	<p align="center"> -->
<%-- 				        	<input type="button" value=${data.tchrNo} onclick="tchrSelect('${pageContext.request.contextPath}', '${data.tchrNo}')"></p> --%>
<!-- 				        </td> -->
<!-- 				        <td bgcolor=""> -->
<%-- 							<p><span style="font-size:9pt;">${data.sbjtChrg}</a></span></p> --%>
<!-- 				        </td> -->
<!-- 				        <td bgcolor=""> -->
<%-- 							<p><span style="font-size:9pt;">${data.nm}</a></span></p> --%>
<!-- 				        </td> -->
<!-- 				    </tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table>	 -->
<!-- </div>  -->
	<!-- 리스트 미리 출력 끝-->
<%-- <jsp:include page="../../../footer.jsp"/>	 --%>
	

	
</body>
</html>