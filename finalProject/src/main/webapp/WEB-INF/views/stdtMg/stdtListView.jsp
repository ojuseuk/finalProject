<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/dataTables.min.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- *학생 중복 출력 수정, 업데이트 시 종합반만 변경 가능하게 수정, 중복코드 정리, 변수 정리, 스크롤 -->
<head>
<style type="text/css">
#datatable{
    background-color:#fff;
}
</style>
</head>
<title>학생정보</title>
<jsp:include page="../../../top.jsp"/>
<div style="width: 80%; margin: auto;">
	<div class="table-responsive" style="margin: 10px">
		<c:if test="${not empty crsList}">
		<font style="font-size: 17px"><span class="input-group-addon" style="width:100px; float: left"><b>과   정</b></span></font>
			<select class="form-control" name="crs" id="crs" style="width:100px; float: left" onchange="reqCrsList(this.value,'${root}')">
				<option value="default">선 택</option>
				<c:forEach items="${crsList}" var="data">
					<option value="${data.crsId}">${data.crsNm}</option>
				</c:forEach>
			</select>
		</c:if>
		<font style="font-size: 18px"><span class="input-group-addon" style="width:100px; float: left"><b>강   좌</b></span></font>
			<select class="form-control" id="clss" style="width:100px" onchange="reqClssList(this.value, '${root}')">
				<option>선 택</option>
			</select> 
	</div>

	<input type="hidden" value='${requestScope.json}' id="json">
	<input type="hidden" id="root" value='${root}'>
	
	<div id="demo" class="card mb-3" align="left" style="float: left; width: 50%; height: 558px">
		<div class="card-body">
			<h2 align="center">수강생 목록</h2>
			<div class="table-responsive">
				<table class="table table-bordered" class="hover" id="dataTable">
					<thead style="background-color: #90909096">
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
	<span style="width:10%"></span>
	<div style="width:50%; height:400px; float:left;">
	<form action="${root}/insertStdt">
		<fieldset style="width: 100%">
			<legend style="text-align: center;"><h2>수강생 등록</h2></legend>
				<table class="table table-bordered" id="inStdt" style="width:100%;">
					<tr>
						<td align="center"><span class="input-group-addon">아이디</span></td>
						<td><input class="form-control" style="width:400px; float:left;" id="stdtId" type="text" name="id" placeholder="ID검색">
						<input class="w3-button w3-round w3-teal w3-tiny" id="selectId"  type="button" value="조회">
						&nbsp;&nbsp;&nbsp;<div id="selectResult"></div></td>
					</tr>
					<tr>
						<td align="center"><span class="input-group-addon">수강생번호</span></td>
						<td><input class="form-control" type="text" name="stdtNo" value="${stdtNo}"></td>
					</tr>
					<tr>
						<td align="center"><span class="input-group-addon">학 과</span></td>
						<td><select class="form-control" id="mjrTp" name="mjrTp">
							<option value="문 과">문 과</option>
							<option value="이 과">이 과</option>
							<option value="예체능">예체능</option>
						</select>
						</td>
					</tr>
					<tr>
						<td align="center"><span class="input-group-addon">강 좌</span></td>
						<td><select class="form-control" id="geClss" name="clssId">
							<option value="CL004">종합반A</option>
							<option value="CL005">종합반B</option>
							<option value="CL006">종합반C</option>
						</select>
						</td>
					</tr>
					<tr>
						<td align="center"><span class="input-group-addon">대입응시횟수</span></td>
						<td><input class="form-control" type="number" name="retryCnt" required="required"></td>
					</tr>
					<tr>
						<td align="center"><span class="input-group-addon">부모님 연락처</span></td>
						<td><input class="form-control" type="text" name="prntPhone"></td>
					</tr>
					<tr>
						<td align="center"><span class="input-group-addon">등록일</span></td>
						<td><input class="form-control" type="date" name="paidDt" id="regDate"></td>
					</tr>
					<tr>
						<td align="center"><span class="input-group-addon">환불일</span></td>
						<td><input class="form-control" type="date" name="repaidDt" id="retDate"></td>
					</tr>
					<tr>
						<td colspan="2"><p align="center">
							<input class="w3-button w3-round w3-teal"  type="submit" value="저장">
							<input class="w3-button w3-round w3-teal"  type="reset" value="리셋">
						</p></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
</div>
<%-- <script src="${root}/js/stdtMg/stdtList.js"></script> --%>
<script type="text/javascript">
var data;
var clssData;
var clssTag;
var xhttp = new XMLHttpRequest();

//전체 수강생
var allList = $("#json").val();
var root = $("#root").val();
allList = JSON.parse(allList);
console.log(allList);
$('#dataTable').DataTable({
	"scrollY" : 500,
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

//	아이디조회
$(document).ready(function(){
	$("#selectId").click(function(){
		var id = $("#stdtId").val();
		console.log(id);
		$.post({
			url : root + "/selectStdtId",
			data : $("#stdtId").serialize(),
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(id){
				if(id == ''){
					document.getElementById("selectResult").innerHTML = "회원이 아닙니다";
				} else {
					document.getElementById("selectResult").innerHTML = "회원입니다";
				}
			},
			error : function(){
				document.getElementById("selectResult").innerHTML = "조회에 실패했습니다";
			}
		});
	});
});


//	강좌목록
function reqCrsList(crsId, root) {
	stdtListCrs(crsId, root);
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			clssTag = '<option>선 택</option>';
			clssData = xhttp.responseText;
			clssData = JSON.parse(clssData);
			console.log(clssData);
			for (i = 0; i < clssData.length; i++) {
				clssTag += '<option value="' + clssData[i].clssId + '">' + clssData[i].clssNm + '</option>';
			}
			document.getElementById("clss").innerHTML = clssTag;
			document.getElementById("stdtInfo").innerHTML = "";
		}
	}
	xhttp.open("POST", root + "/clssList", true);
	xhttp.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("crsId=" + crsId);
}

//	과정별 수강생목록
function stdtListCrs(crsId, root) {
$('#dataTable').dataTable().fnDestroy();
	var xhttp2 = new XMLHttpRequest();
	xhttp2.onreadystatechange = function() {
		if (xhttp2.readyState == 4 && xhttp2.status == 200) {
			var stdtList = xhttp2.responseText;
			stdtList = JSON.parse(stdtList);
			$('#dataTable').DataTable({
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
	xhttp2.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	xhttp2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp2.send("crsId=" + crsId);
}

//	강좌별 수강생목록
function reqClssList(clssId, root) {
	$('#dataTable').dataTable().fnDestroy();
	var crsId = document.getElementById("crs").value;
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var stdtList = xhttp.responseText;
			stdtList = JSON.parse(stdtList);
			$('#dataTable').DataTable({
				"scrollY" : 500,
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
	xhttp.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("clssId=" + clssId + "&crsId=" + crsId);
}

</script>

<!-- <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> -->
<!-- <br><br> -->
<%-- <jsp:include page="../../../footer.jsp"/> --%>


