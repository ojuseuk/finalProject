<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/select.min.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${root}/styles/w3/w3.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<script	src="https://cdn.datatables.net/select/1.2.3/js/dataTables.select.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.4.js" type="text/javascript"></script>
<html>
<head>
<title>수강신청</title>
<style type="text/css">
td.details-control {
	background: url('imgs/grid/datailBtn.png') no-repeat center center;
	cursor: pointer;
}

tr.shown td.details-control {
	background: url('imgs/grid/datailBtn.png') no-repeat center center;
}
#datatable{
    background-color:#fff;
}
#events {
	margin-bottom: 1em;
	padding: 1em;
	background-color: #ffffff;
	border: 1px solid #999;
	border-radius: 3px;
	height: 200px;
	overflow: auto;
}
.select {
    width: 100px;
    height: 30px;
    padding-left: 10px;
    font-size: 15px;
    color: #424242;
    border: 1px solid #90909096;
    border-radius: 3px;
}
</style>
</head>
<script type="text/javascript">
var IMP = window.IMP;
	IMP.init('imp33012783');
</script>
<jsp:include page="../../../top.jsp" />

<body>
<!-- Sidebar right -->
<div class="sidebar" style="width:6%;right:0; background-color: #ffffff;">
  <div><img class="w3-padding" src="./imgs/banner/90x135.gif"  ></div>
  <div><img class="w3-padding" src="./imgs/banner/90x135(1).gif"  ></div>
  <div><img class="w3-padding" src="./imgs/banner/90x333.gif"  ></div>
  <div><img class="w3-padding" src="./imgs/banner/main_ss.jpg"  ></div>
</div>

<input type="hidden" id="jsonCrs" value='${requestScope.jsonCrs}'>
<input type="hidden" id="usrId" value='${requestScope.usrId}'>
<input type="hidden" id="usrNm" value='${requestScope.usrNm}'>
<input type="hidden" id="usrPhone" value='${requestScope.usrPhone}'>
<input type="hidden" id="usrEmail" value='${requestScope.usrEmail}'>
<input type="hidden" id="usrAddr" value='${requestScope.usrAddr}'>
<input type="hidden" id="root" value='${root}'>

<div id="clssView" style="width: 80%; margin: auto;">
	<div style="width: 100%; overflow: auto;">
		<div class="dataTable_length" style="margin:20px">
			<c:if test="${not empty requestScope.sbjt}">
				<font style="font-size: 17px"><span class="input-group-addon" style="width:100px; height:34px; float: left;"><b>과목</b></span></font>
				<select class="form-control" style="width: 200px" name="sbjt" id="sbjt" onchange="reqCrsList(this.value,'${root}')">
					<option value="default">선 택</option>
					<c:forEach items="${requestScope.sbjt}" var="data">
						<option value="${data.sbjtNm}">${data.sbjtNm}</option>
					</c:forEach>
				</select>
			</c:if>
		</div>
		
		<div id="crs" class="card mb-3" align="left" style="width: 100%; height: 475px">
			<div class="card-body">
				<h2 class="h2" align="center">강좌 목록</h2>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<thead style="background-color: #90909096">
							<tr>
								<th></th>
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

	<div class="input-group-addon" id="events" align="center">강좌를 선택하세요</div>

	<div>
		<p id="tMoney" align="center">
			<b>총 결제 금액 : 0원</b>
		</p>
		<p align="center">
			<input class="w3-button w3-border" style="background-color: #90909096; width: 15%" id="payment" type="button" value="결제">
			<input class="w3-button w3-border" style="background-color: #90909096; width: 15%" id="paymentT" type="button" value="결제테스트">
		</p>
	</div>
</div>

<%-- <script src="${root}/js/schLf/registClss.js"></script> --%>
<script type="text/javascript">
	var crsList = $("#jsonCrs").val();
	var root = $("#root").val();
	var usrId = $("#usrId").val();
	var usrNm = $("#usrNm").val();
	var usrPhone = $("#usrPhone").val();
	var usrEmail = $("#usrEmail").val();
	var selectClss = new Array();
	var tMoney = 0;
	
	console.log(usrId);
	console.log(usrNm);
	console.log(usrPhone);
	console.log(usrEmail);
	crsList = JSON.parse(crsList);
	console.log(crsList);
	
	function format(d) {
		return '<table>'
		+ '<tr>'
		+ '<td align="center"><img src="imgs/imgTchr/' + d.nm + '.JPG" width="50%"></td>' 
		+ '<td>과정 소개 <br> ' + d.crsIntro.replace(/(?:\r\n|\r\n)/g, '<br />') + '<br><br>'
		+ d.nm + '선생님<br><br>'
		+ d.tchrIntro.replace(/(?:\r\n|\r\n)/g, '<br />') + '</tr>'
		+ '</table>';
	}
	// 전체강좌리스트 테이블
	var table = $('#dataTable').DataTable({
		"language" : {
			"thousands" : ","
		},
		"processing" : true,
		"scrollY" : 500,
		"scrollCollapse" : true,
		data : crsList,
		select : {
			style : 'multi',
			selector : 'td:first-child'
		},
		columns : [ {
			orderable : false,
			className : 'select-checkbox',
			targets : 0,
			"data" : null,
			"render" : function(data, type, row, meta) {
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
			"render" : function(data, type, row, meta) {
				return inputDateFormat(row.strtDt) + " ~ " + inputDateFormat(row.endDt) + " (" + row.prd + "일)";
			}
		}, {
			"data" : "stdtclssttn",
			"render" : function(data){
				data = data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원';	
				return data;
			}
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
			row.child.hide();
			tr.removeClass('shown');
		} else {
			row.child(format(row.data())).show();
			tr.addClass('shown');
		}
	
	});
	
	
	$(document).ready(function() {
	var events = $('#events');
	//테이블에 담기
	table.on('select',	function(e, dt, type, indexes) {
		rowData = table.rows(indexes).data().toArray();
		//JSON형태로 조합
		selectClss.push('{"id":' + JSON.stringify(usrId)
						+ ',"nm":' + JSON.stringify(rowData[0].nm)
						+ ',"clssId":' + JSON.stringify(rowData[0].clssId)
						+ ',"clssNm":' + JSON.stringify(rowData[0].clssNm)
						+ ',"strtDt":' + JSON.stringify(rowData[0].strtDt)
						+ ',"endDt":' + JSON.stringify(rowData[0].endDt)
						+ ',"stdtclssttn":' + JSON.stringify(rowData[0].stdtclssttn)
						+ '}');
		//총 금액 
		tMoney += parseInt(rowData[0].stdtclssttn);
		document.getElementById("tMoney").innerHTML = "<b>총 결제 금액 : " + inputNumberFormat(tMoney) + "원</b>";
		console.log(inputNumberFormat(tMoney));
		$.post({
			url : root + "/applyClss",
			data : JSON.stringify(selectClss),
			beforeSend : function(xhr)
	        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			contentType : "application/json; charset=UTF-8",
			success : function(list) {
				document.getElementById("events").innerHTML = list;
			},
			error : function() {
				alert("fail");
			}
		});
		console.log("체크한리스트" + selectClss);
		
	})
	//선택한 테이블에서 삭제
	.on('deselect', function(e, dt, type, indexes) {
		rowData = table.rows(indexes).data().toArray();
		tMoney -= parseInt(rowData[0].stdtclssttn);
		rowData = '{"id":' + JSON.stringify(usrId)
				+ ',"nm":' + JSON.stringify(rowData[0].nm)
				+ ',"clssId":' + JSON.stringify(rowData[0].clssId)
				+ ',"clssNm":' + JSON.stringify(rowData[0].clssNm)
				+ ',"strtDt":' + JSON.stringify(rowData[0].strtDt)
				+ ',"endDt":' + JSON.stringify(rowData[0].endDt)
				+ ',"stdtclssttn":' + JSON.stringify(rowData[0].stdtclssttn) + '}';
				
		document.getElementById("tMoney").innerHTML = "<b>총 결제 금액 : " + inputNumberFormat(tMoney) + "원</b>";
		console.log(inputNumberFormat(tMoney));
		
		for (var i = 0; i < selectClss.length; i++) {
			if (rowData == selectClss[i]) {
				delete selectClss[i];
			}
		}
		
		for (var i = 0; i < selectClss.length; i++) {
			if (selectClss[i] == null) {
				for (var j = i; j < selectClss.length; j++) {
					selectClss[i] = selectClss[i + 1];
					selectClss.splice(i, 1);
				}
			}
		}
		console.log("삭제후리스트"	+ selectClss);
		$.post({
			url : root + "/applyClss",
			data : JSON.stringify(selectClss),
			beforeSend : function(xhr)
	        {   
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			contentType : "application/json; charset=UTF-8",
			success : function(list) {
				document.getElementById("events").innerHTML = list;
			},
			error : function() {
				console.log("fail");
			}
		});
	});
	});
	
	function inputNumberFormat(tMoney) {
	    return String(tMoney).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	function inputDateFormat(date) {
		var year = date.substring(0, 4);
		var month = date.substring(4, 6);
		var day = date.substring(6, 8);
	
		return year + '-' + month + '-' + day;
	}
	// 과목별 리스트 테이블
	function reqCrsList(sbjtNm, root) {
	$('#dataTable').dataTable().fnDestroy();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var crsBySbjt = xhttp.responseText;
			crsBySbjt = JSON.parse(crsBySbjt);
			console.log(crsBySbjt);
			table = $('#dataTable').DataTable(
				{
				"language" : {
					"decimal" : ",",
					"thousands" : ","
				},
				"processing" : true,
				"scrollY" : 500,
				"scrollCollapse" : true,
				data : crsBySbjt,
				select : {
					style : 'multi',
					selector : 'td:first-child'
				},
				columns : [{
					orderable : false,
					className : 'select-checkbox',
					targets : 0,
					"data" : null,
					"render" : function(data, type,	row, meta) {
						return "";
					}
				}, {
					"data" : "crsNm"
				}, {
					"data" : "clssNm"
				}, {
					"data" : "nm"
				}, {
					"data" : "strtDt",
					"render" : function(data, type,	row, meta) {
						return inputDateFormat(row.strtDt) + " ~ " + inputDateFormat(row.endDt) + " (" + row.prd + "일)";
						}
				}, {
					"data" : "stdtclssttn",
					"render" : function(data, type,	row, meta){
						data = data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원';	
						return data;
					}
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
	xhttp.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	xhttp.send("sbjtNm=" + sbjtNm);
	}
	
	// 결제
	$("#payment").click(function() {
		reqPayment(tMoney, usrId, usrNm, usrPhone, usrEmail, selectClss);
	});
	
	$("#paymentT").click(function() {
		$.ajax({
			url: root + "/payments/complete", 
			type: 'POST',
			contentType : "application/json; charset=UTF-8",
			data: JSON.stringify(selectClss),
			beforeSend : function(xhr)
	         {  
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         },
			success : function(data){
					alert("수강신청 성공");
			},
			error : function(){
					alert("수강신청 실패");
			}
		});
	});
	
	function reqPayment(tMoney, usrId, usrNm, usrPhone, usrEmail, selectClss) {
		console.log(tMoney, usrId, usrNm, usrPhone, usrEmail);
		console.log(selectClss);
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : tMoney,
		    buyer_email : usrEmail,
		    buyer_name : usrNm,
		    buyer_tel : usrPhone,
		}, function(rsp) {
		    if ( rsp.success ) {
		    	$.ajax({
		    		url: root + "/payments/complete", 
		    		type: 'POST',
		    		contentType : "application/json; charset=UTF-8",
		    		data: JSON.stringify(selectClss),
		    		beforeSend : function(xhr)
	                 {  
	                     xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                 }
		    	}).done(function(data) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
						document.getElementById("clssView").innerHTML = data;
		    			alert(msg);
		    	});
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		    }
		});
	}

</script>
<Br><Br>
<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>