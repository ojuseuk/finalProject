<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정 관리</title>
<style>
p {
	margin-top: 0px;
	margin-bottom: 0px;
}
</style>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>	
</head>
<body>
<jsp:include page="../../../top.jsp"/>
 	<form action="courseInsert">
<!-- 	<form> -->
		<fieldset style="width: 40%">
			<legend>교육 과정</legend>
			<table>
				<tr>
					<td>구분 :</td>
					<td>
						<input type="radio" name="crsTp" id="crsTp_1" value="종합" onclick="crsTpRadio('종합')"/> 종합
						<input type="radio" name="crsTp" id="crsTp_2" value="특강" onclick="crsTpRadio('특강')"/> 특강
					</td>
				</tr>
				<tr>
					<td>과정 ID :</td>
					<td><input type="text" name="crsId" id="crsId"/></td>
				</tr>
				<tr>
					<td>과목 :</td>
  					<td>
						<select name="sbjtNm" id="sbjtNm">
							<option value="">과목 선택</option>
							<c:forEach items="${requestScope.sbjtList}" var="data">
								<option value=${data.sbjtNm}>${data.sbjtNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>  
				<tr>
					<td>과정명 :</td>
					<td><input type="text" name="crsNm" id="crsNm"/></td>
				</tr>
				<tr>
					<td>기간 : </td>
					<td><input type="number" name="prd" id="prd"/></td>
				</tr>
				<tr>
					<td>일 수업시간 :</td>
					<td><input type="number" name="dayClssTm" id="dayClssTm"/>시간/일</td>
				</tr>
				<tr>
					<td>수강료 :</td>
					<td><input type="text" name="stdtclssttn" id="stdtclssttn"/>원</td>
				</tr>
				<tr>
					<td>과정 소개 :</td>
					<td><textarea name = "crsIntro" id="crsIntro" cols = "50" rows = "7" 
                              placeholder="200자 이내"></textarea></td>
				</tr>
			</table>
		</fieldset><br><br>
 		<input type="submit" value="과정 등록"> 
		<input type="button"  onclick="javascript:history.back()" value="등록 취소" >
	</form>

	<input type = "hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type = "hidden" id="root" value='${root}'>
		
		<!-- 과정 리스트 DataTable -->
		<div id="demo" class="card mb-3" style="position:absolute; top:45%; left:750px; width:700px; height:200px; display:inline-block;">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<thead >
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
		<!-- 과정 리스트 DataTable -->

	
	
	
	<script type="text/javascript">
	
	var root = document.getElementById("root").value;
	var jsonList = document.getElementById("jsonList").value;
	console.log(jsonList);
	jsonList = JSON.parse(jsonList);
	var xhttp = new XMLHttpRequest();
	
	function inputNumberFormat(slr) {
	    return String(slr).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	/* 과정ID로 과정 조회 */
	function crsSelect(root, crsId){
		xhttp.onreadystatechange = function(){
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				data = xhttp.responseText;
				data = JSON.parse(data);
				console.log(data);
				document.getElementById("crsId").value = data.crsId;
				document.getElementById("crsNm").value = data.crsNm;
				document.getElementById("prd").value = data.prd;
				document.getElementById("stdtclssttn").value = inputNumberFormat(data.stdtclssttn);
				document.getElementById("dayClssTm").value = inputNumberFormat(data.dayClssTm); 
				document.getElementById("crsIntro").value = data.crsIntro;
				document.getElementById("sbjtNm").value = data.sbjtNm;
				
				if(data.crsTp == '종합'){
// 					$("#crsTp_1").prop("checked", true);
					document.getElementById("crsTp_1").checked = "checked";	
				} else {
					document.getElementById("crsTp_2").checked = "checked";
				}
				document.getElementById("crsId").readOnly = true;
			}
		}
		xhttp.open("GET", root + "/crsSelect?crsId=" + crsId, true);
		xhttp.send();
	}
	
	/* 과정 리스트 DataTable */
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
					"data" : "crsId",
					"searchable": false,
					"render" : function(data, type, row, meta){
						data = '<div align="center"><input type="button" value="' + data + '" onclick="crsSelect(\''+ root + '\', \''+data+'\')"></div>';
					return data;
					}
				}, {
					"data" : "sbjtNm"
				}, {
					"data" : "crsNm"
				}, {
					"data" : "prd",
					"render" : function(data, type, row, meta){
						data = '<div align="center">' + data + '</div>';
						return data;
					}
				}, {
					"data" : "stdtclssttn",
					"render" : function(data){
						data = '<div align="right">' + data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '</div>';	
						return data;
					}
				}]
		});
	});

		function crsTpRadio(crsTp){
			if(crsTp == "종합"){
 				document.getElementById("sbjtNm").hidden = true;
				document.getElementById("sbjtNm").disabled = true;
 				document.getElementById("prd").hidden = true;
 				document.getElementById("prd").disabled = true;
 			}
			if(crsTp == "특강"){
				/* document.getElementById("sbjtNm").disabled = "disabled"; */
				document.getElementById("sbjtNm").hidden = false;
				document.getElementById("sbjtNm").disabled = false;
				document.getElementById("prd").hidden = false;
 				document.getElementById("prd").disabled = false;
			}
				
		}
	</script>
	

	<jsp:include page="../../../footer.jsp"/>
</body>
</html>