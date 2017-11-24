<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet"
	href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" />
<link rel="stylesheet"
	href="${root}/styles/vendor/css/dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/select.min.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<script
	src="https://cdn.datatables.net/select/1.2.3/js/dataTables.select.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"
	type="text/javascript"></script>
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
	height: 200px;
	overflow: auto;
}
</style>
</head>
<script type="text/javascript">
var IMP = window.IMP;
	IMP.init('imp33012783');
</script>
<jsp:include page="../../../top.jsp" />

<body>

	<input type="hidden" id="jsonCrs" value='${requestScope.jsonCrs}'>
	<input type="hidden" id="root" value='${root}'>

	<div style="width: 100%; overflow: auto;">
		<div class="card-body">
			<c:if test="${not empty requestScope.sbjt}">
				<b>과목</b>
				<select name="sbjt" id="sbjt"
					onchange="reqCrsList(this.value,'${root}')">
					<option>선 택</option>
					<c:forEach items="${requestScope.sbjt}" var="data">
						<option value="${data.sbjtNm}">${data.sbjtNm}</option>
					</c:forEach>
				</select>
			</c:if>
		</div>
		<div id="crs" class="card mb-3" align="left"
			style="width: 100%; height: 475px">
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

	<div id="events" align="center">강좌를 선택하세요</div>

	<div>
		<%-- 		<form name="reqapplyClss" action="${root}/applyClss"> --%>
		<p id="tMoney" align="center">
			<b>총 결제 금액 : 0원</b>
		</p>
		<p align="center">
			<input type="hidden" name="applyList" value=""> <input
				id="payment" type="button" value="결제">
		</p>
		<!-- 		</form> -->
	</div>

	<script type="text/javascript">
		var crsList = $("#jsonCrs").val();
		var root = $("#root").val();
		crsList = JSON.parse(crsList);
		console.log(crsList);

		function format(d) {
			return '과정 소개 : ' + d.crsIntro + '<br>' + '선생님 소개 :' + d.nm + '선생님'
					+ '<br>' + '<img src="imgs/img/eng2.PNG">' + d.tchrIntro;
		}

		var table = $('#dataTable').DataTable({
			"language" : {
				"decimal" : ",",
				"thousands" : ","
			},
			"processing" : true,
			"scrollY" : 300,
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
					return data + "~" + row.endDt + "(" + row.prd + "일)";
				}
			}, {
				"data" : "stdtclssttn",
				"render" : function(data, type, row, meta) {
					return parseInt(data);
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

		var selectClss = new Array();
		var tMoney = 0;
		$(document)
				.ready(
						function() {
							var events = $('#events');
							//테이블에 담기
							table
									.on(
											'select',
											function(e, dt, type, indexes) {
												rowData = table.rows(indexes)
														.data().toArray();
												//JSON형태로 조합
												selectClss
														.push('{"nm":'
																+ JSON
																		.stringify(rowData[0].nm)
																+ ',"clssNm":'
																+ JSON
																		.stringify(rowData[0].clssNm)
																+ ',"strtDt":'
																+ JSON
																		.stringify(rowData[0].strtDt)
																+ ',"endDt":'
																+ JSON
																		.stringify(rowData[0].endDt)
																+ ',"stdtclssttn":'
																+ JSON
																		.stringify(rowData[0].stdtclssttn)
																+ '}');
												tMoney += parseInt(rowData[0].stdtclssttn);
												console.log(tMoney);
												document
														.getElementById("tMoney").innerHTML = "<b>총 결제 금액 : "
														+ tMoney + "원</b>";
												$
														.post({
															url : root
																	+ "/applyClss",
															data : JSON
																	.stringify(selectClss),
															contentType : "application/json; charset=UTF-8",
															success : function(
																	list) {
																document
																		.getElementById("events").innerHTML = list;
															},
															error : function() {
																alert("fail");
															}
														});
												console.log("체크한리스트"
														+ selectClss);
												//테이블에서 삭제
											})
									.on(
											'deselect',
											function(e, dt, type, indexes) {
												rowData = table.rows(indexes)
														.data().toArray();
												tMoney -= parseInt(rowData[0].stdtclssttn);
												rowData = '{"nm":'
														+ JSON
																.stringify(rowData[0].nm)
														+ ',"clssNm":'
														+ JSON
																.stringify(rowData[0].clssNm)
														+ ',"strtDt":'
														+ JSON
																.stringify(rowData[0].strtDt)
														+ ',"endDt":'
														+ JSON
																.stringify(rowData[0].endDt)
														+ ',"stdtclssttn":'
														+ JSON
																.stringify(rowData[0].stdtclssttn)
														+ '}'
												console.log(tMoney);
												document
														.getElementById("tMoney").innerHTML = "<b>총 결제 금액 : "
														+ tMoney + "원</b>";
												for (var i = 0; i < selectClss.length; i++) {
													if (rowData == selectClss[i]) {
														delete selectClss[i];
													}
												}
												for (var i = 0; i < selectClss.length; i++) {
													if (selectClss[i] == null) {
														for (var j = i; j < selectClss.length; j++) {
															selectClss[i] = selectClss[i + 1];
															selectClss.splice(
																	i, 1);
														}
													}
												}
												console.log("삭제후리스트"
														+ selectClss);

												$
														.post({
															url : root
																	+ "/applyClss",
															data : JSON
																	.stringify(selectClss),
															contentType : "application/json; charset=UTF-8",
															success : function(
																	list) {
																document
																		.getElementById("events").innerHTML = list;
															},
															error : function() {
																console
																		.log("fail");
															}
														});

												// 				if(selectClss.length == 0){
												// 					document.getElementById("events").innerHTML = "강좌를 선택하세요";
												// 				}
											});
						});

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
								"scrollY" : 300,
								"scrollCollapse" : true,
								data : crsBySbjt,
								select : {
									style : 'multi',
									selector : 'td:first-child'
								},
								columns : [
										{
											orderable : false,
											className : 'select-checkbox',
											targets : 0,
											"data" : null,
											"render" : function(data, type,
													row, meta) {
												return "";
											}
										},
										{
											"data" : "crsNm"
										},
										{
											"data" : "clssNm"
										},
										{
											"data" : "nm"
										},
										{
											"data" : "strtDt",
											"render" : function(data, type,
													row, meta) {
												return data + "~" + row.endDt
														+ "(" + row.prd + "일)";
											}
										}, {
											"data" : "stdtclssttn"
										// 							"render" : function(data, type, row, meta) {
										// 								return data + "' type='number'/>원";
										// 							}	
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
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("sbjtNm=" + sbjtNm);
		}

		$("#payment").click(function() {
			reqPayment(tMoney);
		});

		function reqPayment(tMoney) {
			IMP.request_pay({
				amount : tMoney,
				buyer_name : '이름',
				name : '결제테스트'
			}, function(response) {
				//결제 후 호출되는 callback함수
				if (response.success) { //결제 성공
					console.log(response);
				} else {
					alert('결제실패 : ' + response.error_msg);
				}
			})
		}
	</script>
	<!-- <Br><Br><Br><Br><Br><Br><Br><Br><Br><Br> -->
	<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>