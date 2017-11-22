<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- *학생 중복 출력 수정, 업데이트 시 종합반만 변경 가능하게 수정, 중복코드 정리, 변수 정리, 스크롤 -->

<title>학생정보</title>
<jsp:include page="../../../top.jsp"/>
<div class="table-responsive">
	<c:if test="${not empty crsList}">
	<b>과정</b>
		<select name="crs" id="crs"
			onchange="reqCrsList(this.value,'${root}')">
			<option value="선 택">선 택</option>
			<c:forEach items="${crsList}" var="data">
				<option value="${data.crsId}">${data.crsNm}</option>
			</c:forEach>
		</select>
	</c:if>
	<b>강좌</b>
		<select id="clss" onchange="reqClssList(this.value, '${root}')">
			<option>선 택</option>
		</select> 
</div>

	<input type="hidden" value='${requestScope.json}' id="json">
	<input type="hidden" id="root" value='${root}'>
	
<div style="width: 100%;">
	<div id="demo" class="card mb-3" align="left"
		style="float: left; width: 50%; height: 558px">
		<div class="card-body">
			<h2 align="center">수강생 목록</h2>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>번 호</th>
							<th>이 름</th>
							<th>학 과</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div style="width:50%; height:400px; float:left;">
	<form action="${root}/insertStdt">
		<table class="table table-bordered" id="inStdt" width="100%">
			<tr>
				<td colspan="2"><h2 align="center">수강생 등록</h2></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input id="stdtId" type="text" name="id" value="" placeholder="ID검색">
				<input id="selectId" type="button" value="조회"></td>
			</tr>
			<tr>
				<td>수강생번호</td>
				<td><input type="text" name="stdtNo" value="${stdtNo}"></td>
			</tr>
			<tr>
				<td>학 과</td>
				<td><select id="mjrTp" name="mjrTp">
					<option value="mj001">문 과</option>
					<option value="mj002">이 과</option>
					<option value="mj003">예체능</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>강좌</td>
				<td><select id="geClss" name="clssId">
					<option value="clss5">종합반A</option>
					<option value="clss2">종합반B</option>
					<option value="clss6">종합반C</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>대입응시횟수</td>
				<td><input type="number" name="retryCnt"></td>
			</tr>
			<tr>
				<td>부모님 연락처</td>
				<td><input type="text" name="prntPhone"></td>
			</tr>
			<tr>
				<td>등록일</td>
				<td><input type="date" name="paidDt" id="regDate"></td>
			</tr>
			<tr>
				<td>환불일</td>
				<td><input type="date" name="repaidDt" id="retDate"></td>
			</tr>
			<tr>
				<td colspan="2"><p align="center">
					<input type="submit" value="저장">
					<input type="reset" value="리셋">
				</p></td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
	var data;
	var clssData;
	var clssTag;
	var xhttp = new XMLHttpRequest();
	
// 전체 수강생
	var allList = $("#json").val();
	var root = $("#root").val();
	allList = JSON.parse(allList);
	console.log(allList);
	$('#dataTable').DataTable({
		"scrollY" : 250,
		"scrollCollapse" : true,
		data : allList,
		columns : [ {
			"data" : "stdtNo"
		}, {
			"data" : "nm",
			//아래 링크 걸어서 사용 아니면 onclick
			"render" : function(data, type, row, meta){
				data = '<a href="'+ root +'/stdtInfo?stdtNo=' + row.stdtNo + '">' 
					 + row.nm + '</a>';
				return data;
			}
		}, {
			"data" : "mjrTp"
		} ]
	});
	
// 	아이디조회
	$(document).ready(function(){
		$("#selectId").click(function(){
			var id = $("#stdtId").val();
			$.post({
				url : "/project/selectStdtId",
				data : $("#stdtId").serialize(),
				success : function(id){
					if(id == ''){
						alert("회원이 아닙니다");
					} else {
						alert("회원입니다");
					}
				},
				error : function(){
					alert("조회에 실패했습니다");
				}
			});
		});
	});
	
	
// 	강좌목록
	function reqCrsList(crsId, root) {
		stdtListCrs(crsId, root);
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssTag = '<option>선 택</option>';
				clssData = xhttp.responseText;
				clssData = JSON.parse(clssData);
				
				for (i = 0; i < clssData.length; i++) {
					clssTag += '<option value="' + clssData[i].clssNm + '">' + clssData[i].clssNm + '</option>';
				}
				document.getElementById("clss").innerHTML = clssTag;
				document.getElementById("stdtInfo").innerHTML = "";
			}
		}
		xhttp.open("POST", root + "/clssList", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("crsId=" + crsId);
	}
	
// 	과정별 수강생목록
	function stdtListCrs(crsId, root) {
	$('#dataTable').dataTable().fnDestroy();
		var xhttp2 = new XMLHttpRequest();
		xhttp2.onreadystatechange = function() {
			if (xhttp2.readyState == 4 && xhttp2.status == 200) {
				var stdtList = xhttp2.responseText;
				stdtList = JSON.parse(stdtList);
				$('#dataTable').DataTable({
					"scrollY" : 250,
					"scrollCollapse" : true,
					data : stdtList,
					columns : [ {
						"data" : "stdtNo"
					}, {
						"data" : "nm",
						//아래 링크 걸어서 사용 아니면 onclick
						"render" : function(data, type, row, meta){
							data = '<a href="'+ root +'/stdtInfo?stdtNo=' + row.stdtNo + '">' 
							 	 + row.nm + '</a>';
							return data;
						}
					}, {
						"data" : "mjrTp"
					} ]
				});
			}
		}
		xhttp2.open("POST", root + "/stdtListCrs",	true);
		xhttp2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp2.send("crsId=" + crsId);
	}
	
// 	강좌별 수강생목록
	function reqClssList(clssNm, root) {
		$('#dataTable').dataTable().fnDestroy();
		var crsId = document.getElementById("crs").value;
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var stdtList = xhttp.responseText;
				stdtList = JSON.parse(stdtList);
				$('#dataTable').DataTable({
					"scrollY" : 250,
					"scrollCollapse" : true,
					data : stdtList,
					columns : [ {
						"data" : "stdtNo"
					}, {
						"data" : "nm",
						//아래 링크 걸어서 사용 아니면 onclick
						"render" : function(data, type, row, meta){
							data = '<a href="'+ root +'/stdtInfo?stdtNo=' + row.stdtNo + '">' 
								 + row.nm + '</a>';
							return data;
						}
					}, {
						"data" : "mjrTp"
					} ]
				});
			}
		}
		xhttp.open("POST", root + "/stdtList", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("clssNm=" + clssNm + "&crsId=" + crsId);
	}
	
</script>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../../../footer.jsp"/>


