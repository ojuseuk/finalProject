<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<head>
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
<title>수강신청</title>
</head>
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/select.min.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="https://cdn.datatables.net/select/1.2.3/js/dataTables.select.min.js"></script>
<jsp:include page="../../../top.jsp"/>
<div>
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

<div style="width: 100%; overflow: auto; float: left;">
	<div id="crs" class="card mb-3" align="left"
		style="float: left; width: 100%; height: 558px">
		<div class="card-body">
			<h2 align="center">수강신청 목록</h2>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>과정명</th>
							<th>강좌명</th>
							<th>강사명</th>
							<th>기 간</th>
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

<div>
	<form name="reqapplyClss" action="${root}/applyClss" method="POST">
		<p align="right">
			<input type="hidden" name="clssList" value=""> 
			<input id="saveClss" type="button" value="강좌담기"> 
<%-- 			<input id="appClss" type="button" value="수강신청" onclick="sendClssList('${root}')"> --%>
		</p>
	</form>
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
		       '선생님 소개 :' + d.nm + '선생님' + '<br>' + '<img src="imgs/img/eng2.PNG">' +
		       d.tchrIntro;
	}
	
	var table = $('#dataTable').DataTable({
		"processing" : true,
		"scrollY" : 500,
		"scrollCollapse" : true,
		data : crsList,
	    select : true,
		columns : [ {
			"data" : "crsNm",
// 			"render" : function(data, type, row, meta){
// 				return "<input id='crsNm' type='checkbox' value='" + row + "'>" + data;
// 			}
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
	
	//////////////////////////////배열 중복 처리
	var selectClss = new Array();
	var rowData = '';
	$('#dataTable tbody').on('click', 'tr', function() {
	    table
	        .on( 'select', function ( e, dt, type, indexes ) {
	            rowData = table.rows( indexes ).data().toArray();
	            selectClss.push(JSON.stringify( rowData ));
	            console.log(selectClss);
	        } )
	        .on( 'deselect', function ( e, dt, type, indexes ) {
// 	            rowData = table.rows( indexes ).data().toArray();
	            selectClss.splice(indexes, 1);
	            console.log(selectClss);
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
					columns : [ {
						"data" : "crsNm",
// 						"render" : function(data, type, row, meta){
// 							return "<input id='crsNm' type='checkbox' value='" + row.crsNm +"'>" + data;
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
	
	function deleClss(root) {
		$(document).on("click", "#delCheck", function() {
			$(".appClssList input:checked").each(function() {
				console.log($(this).parent().children("#delCheck").val);
			});
		});
	}

	$(document).on("click", "#saveClss", function() {
				var clssInfoStr = new Array();
				$("#dataTable input:checked").each(
						function() {
							var clssInfoObj = $(this).val();
// 							{
// 								crsNm : $(this).parent().children("#crsNm").val(),
// 								clssNm : $(this).parent().children("#clssNm").val(),
// 								clssId : $(this).parent().children("#clssId").val(),
// 								nm : $(this).parent().children("#nm").val(),
// 								strtDt : $(this).parent().children("#strtDt").val(),
// 								endDt : $(this).parent().children("#endDt").val(),
// 								stdtclssttn : $(this).parent().children("#stdtclssttn").val()
// 								};
// 							console.log(clssInfoObj);
// 							clssInfoStr.push(JSON.stringify(clssInfoObj));
						});
				
				$.post({
					url : root + "/applyClss",
					data : JSON.stringify(clssInfoStr),
					contentType : "application/json; charset=UTF-8",
					success : function(clssInfoStr) {
						console.log("suc");
					},
					error : function() {
						console.log("fail");
					}
				});
				

				$("#saveClss").on("click", function() {
							sessionStorage.setItem($("#clssNm").parent()
									.children("#clssId").val(), clssInfoStr);
							alert("강좌가 담겼습니다.");
						});
			});
</script>
<Br><Br><Br><Br><Br><Br><Br><Br><Br><Br>
<jsp:include page="../../../footer.jsp"/>
