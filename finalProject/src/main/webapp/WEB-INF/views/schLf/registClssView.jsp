<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/select.min.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="https://cdn.datatables.net/select/1.2.3/js/dataTables.select.min.js"></script>
<html>
<head>
<title>수강신청</title>
<style type="text/css">
td.details-control {
	background: url('imgs/grid/plus.JPG') no-repeat center center;
	cursor: pointer;
}

tr.shown td.details-control {
	background: url('imgs/grid/minus.JPG') no-repeat center center;
}
#events {
        margin-bottom: 1em;
        padding: 1em;
        background-color: #f6f6f6;
        border: 1px solid #999;
        border-radius: 3px;
        height: 100px;
        overflow: auto;
    }
</style>
</head>

<jsp:include page="../../../top.jsp"/>

<body>
<div class="card-body">
	<c:if test="${not empty requestScope.sbjt}" >
	<b>과목</b>
 	  <select name="sbjt" id="sbjt" onchange="reqCrsList(this.value,'${root}')">
 	  		<option>선 택</option>
 	  		<c:forEach items="${requestScope.sbjt}" var="data">
  		  		<option value="${data.sbjtNm}">${data.sbjtNm}</option>
  	 		</c:forEach>
 	  </select>
	</c:if>
</div>

<input type="hidden" id="jsonCrs" value='${requestScope.jsonCrs}'>
<input type="hidden" id="root" value='${root}'>

<div style="width: 100%; overflow: auto;">
	<div id="crs" class="card mb-3" align="left"
		style="width: 100%; height: 558px">
		<div class="card-body">
			<h2 align="center">강좌 목록</h2>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th></th>
							<th>과정명</th>
							<th>강좌명</th>
							<th>강사명</th>
							<th>기   간</th>
							<th>수강료</th>
							<th>상세 보기</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div id="events"></div>

<div>
<%-- 	<form name="reqapplyClss" action="${root}/applyClss" method="POST"> --%>
		<p align="center">
<!-- 			<input id="applyList" type="hidden" name="applyList" value="">  -->
			<input id="saveClss" type="button" value="수강신청" > 
<%-- 		<input id="appClss" type="button" value="수강신청" onclick="sendClssList('${root}')"> onclick="sendClssList()"--%>
		</p>
<!-- 	</form> -->
</div>

<div id="modal"></div>
<div id="applyList"></div>

<script type="text/javascript">
	
	var crsList = $("#jsonCrs").val();
	var root = $("#root").val();
	crsList = JSON.parse(crsList);
	console.log(crsList);
	
	function format(d) {
		return '과정 소개 : ' + d.crsIntro + '<br>' + 
		       '선생님 소개 :' + d.nm + '선생님' + '<br>' + '<img src="imgs/img/eng2.PNG">' 
		       + d.tchrIntro;
	}
	
	var table = $('#dataTable').DataTable({
		"processing" : true,
		"scrollY" : 500,
		"scrollCollapse" : true,
		data : crsList,
	    select :  {	
            style: 'multi',
            selector: 'td:first-child'
	    },
		columns : [ {
			orderable: false,
	        className: 'select-checkbox',
	        targets:   0,
	        "data" : null,
	        "render" : function(data, type, row, meta){
				return "";
			}
		}, {
			"data" : "crsNm",
		}, {
			"data" : "clssNm"
		}, {
			"data" : "nm"
		}, {
			"data" : "strtDt",
			"render" : function(data, type, row, meta){
				return data + "~" + row.endDt + "(" + row.prd + "일)";
			}
		}, {
			"data" : "stdtclssttn"
		}, {
			"className" : 'details-control',
			"width" : "10%",
			"orderable" : false,
			"data" : null,
			"defaultContent" : ''
		} ]
	});
	
	$('#dataTable tbody').on('click', 'td.details-control', function() {
		var tr = $(this).closest('tr');
		var row = table.row(tr);
		if (row.child.isShown()) {
			// This row is already open - close it
			row.child.hide();
			tr.removeClass('shown');
		} else {
			// Open this row
			row.child(format(row.data())).show();
			tr.addClass('shown');
		}

	});
	
	var selectClss = new Array();
	var rowData = '';
	$(document).ready(function() {
		var events = $('#events');
	    table
	        .on( 'select', function ( e, dt, type, indexes ) {
	            rowData = table.rows( indexes ).data().toArray();
	            selectClss.push(JSON.stringify( rowData ));
	            events.prepend(selectClss[indexes]);
	            console.log(selectClss)
	            alert("강좌가 담겼습니다.");
	        } )
	        .on( 'deselect', function ( e, dt, type, indexes ) {
	            rowData = table.rows( indexes ).data().toArray();
	            delete selectClss[indexes];
	            console.log(selectClss)
	            alert("강좌가 삭제되었습니다.");
	        } );
	} );	
	
	function reqCrsList(sbjtNm, root) {
		$('#dataTable').dataTable().fnDestroy();
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var crsBySbjt = xhttp.responseText;
				crsBySbjt = JSON.parse(crsBySbjt);
				console.log(crsBySbjt);
				table = $('#dataTable').DataTable({
					"processing" : true,
					"scrollY" : 500,
					"scrollCollapse" : true,
					data : crsBySbjt,
					select :  {	
			            style: 'multi',
//			            selector: ':not(td:last-child)'
			            selector: 'td:first-child'
				    },
					columns : [ {
						orderable: false,
				        className: 'select-checkbox',
				        targets:   0,
				        "data" : null,
				        "render" : function(data, type, row, meta){
							return "";
						}
					}, { 
						"data" : "crsNm",
// 						"render" : function(data, type, row, meta){
// 							return "<input id='crsNm' type='checkbox' value='" + data + "'>" + data;
// 						}
					}, {
						"data" : "clssNm"
					}, {
						"data" : "nm"
					}, {
						"data" : "strtDt",
						"render" : function(data, type, row, meta) {
							return data + "~" + row.endDt + "(" + row.prd + "일)";
						}
					}, {
						"data" : "stdtclssttn"
					}, {
						"className" : 'details-control',
						"width" : "10%",
						"orderable" : false,
						"data" : null,
						"defaultContent" : ''
					} ]
				});
			}
			
		}
		xhttp.open("POST", root + "/selectCrsPerSbjt", true);
		xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhttp.send("sbjtNm=" + sbjtNm);
			
	}
	
// 	function sendClssList(){
// 		document.reqapplyClss.applyList.value = JSON.stringify(selectClss);
// 		document.reqapplyClss.submit();
// 	}	
	
	$(document).on("click", "#saveClss", function() {
		$.post({
			url : root + "/applyClss",
			data : JSON.stringify(selectClss),
			contentType : "application/json; charset=UTF-8",
			success : function(list) {
				console.log(list);
			},
			error : function() {
				console.log("fail");
			}
		});
	});
</script>
<!-- <Br><Br><Br><Br><Br><Br><Br><Br><Br><Br> -->
<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>