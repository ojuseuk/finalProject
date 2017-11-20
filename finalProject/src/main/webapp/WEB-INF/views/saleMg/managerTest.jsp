<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/styles/kendo.common.min.css" />
<link rel="stylesheet" href="${root}/styles/kendo.default.min.css" />
<link rel="stylesheet" href="${root}/styles/kendo.default.mobile.min.css" />

<link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<%-- <link  rel="stylesheet" href="${root}/styles/vendor/font-awesome/font-awesome.min.css" /> --%>
<%-- <link rel="stylesheet" href="${root}/styles/vendor/css/sb-admin.css" /> --%>

<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/kendo.all.min.js"></script>
</head>
<body>

	<input type="date" name="date1" id="date1" onblur="date2Min()">
	~
	<input type="date" name="date2" id="date2" onblur="date1Max()">
	<button onclick="saleMg('${root}')" id="searchClick">조회</button>

	<div id="demo" class="card mb-3">
	
	
	</div>

	<div id="chart"></div>
	<script type="text/javascript">
		function date2Min() {
			$('#date2').attr("min", $('#date1').val());
		}

		function date1Max() {
			$('#date1').attr("max", $('#date2').val());
		}

		function saleMg(root) {
			var date1 = $('#date1').val();
			var date2 = $('#date2').val();
			$('#demo').empty();

			if (date1 == "" || date2 == "") {
				alert("날짜를 선택해 주세요");
			} else {
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						var saleList = this.responseText;
						saleList = JSON.parse(saleList);
						alert(saleList[0].day);
						var arrTh = [ '번호', '년', '월', '일', '비용항목', '금액' ];

						var $div1 = $('<div class="table-responsive">Data Table Example</div>');
						var $div2 = $('<div class="card-body"></div>');
						
						var $div = $('<div class="table-responsive"></div>');
						var $table = $('<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"></table>');
						var $tr = $('<tr></tr>');
						var $th;
						for (var a = 0; a < 6; a++) {
							$th = $('<th></th>');
							$th.append(arrTh[a]);
							$tr.append($th);
						}

						$table.append($tr);
						alert(saleList.length);
						var $tr2, $td1, $td2, $td3, $td4, $td5, $td6;
						for (var b = 0; b < saleList.length; b++) {

							$tr2 = $("<tr></tr>");
							$td1 = $("<td>" + saleList[b].no + "</td>");
							$td2 = $("<td>" + saleList[b].year + "</td>");
							$td3 = $("<td>" + saleList[b].month + "</td>");
							$td4 = $("<td>" + saleList[b].day + "</td>");
							$td5 = $("<td>" + saleList[b].costItem + "</td>");
							$td6 = $("<td>" + saleList[b].amount + "</td>");

							$tr2.append($td1);
							$tr2.append($td2);
							$tr2.append($td3);
							$tr2.append($td4);
							$tr2.append($td5);
							$tr2.append($td6);

							$table.append($tr2);
						}
						
						$div.append($table);
						$div1.append($div2);
						$div1.append($div);
						
						$('#demo').append($div1);

						var amount = new Array();
						var day = new Array();
						var year = new Array();
						var month = new Array();
						var amountD = 0;
						var e = 0;

// 						saleList.sort(function(a, b){
// 							return a.day > b.day ? -1 : a.day < b.day ? 1 : 0;
// 						});
						
						for (var d = 0; d < saleList.length; d++) {
							console.log(d);
							
							if((d+1) < saleList.length){
							if (saleList[d].year == saleList[d + 1].year && saleList[d].month == saleList[d + 1].month
									&& saleList[d].day == saleList[d + 1].day) {
								console.log("test1:  " + saleList[d].amount + "-" + saleList[d].day);
								console.log("test2:  " + saleList[d+1].amount + "-" + saleList[d+1].day);
								amountD += saleList[d].amount;
							} else {
								amountD += saleList[d].amount;
								amount.push(amountD);
								console.log("test3:  " + amountD);
								amountD = 0;
							}
							}else{
								amountD += saleList[d].amount;
								amount.push(amountD);
								console.log("test4: " + amountD);
							}
							year.push(saleList[d].year);
							month.push(saleList[d].month);
							day.push(saleList[d].day);
						}
						
						// 배열 중복값 제거
						Array.prototype.unique = function() {
							var a = {};
							for (var i = 0; i < this.length; i++) {
								if (typeof a[this[i]] == 'undefined') {
									a[this[i]] = 1;
								}
							}
							this.length = 0;
							for ( var i in a) {
								this[this.length] = i;
							}
							return this;
						};
						
						day = day.unique();
						for (var f = 0; f < amount.length; f++) {
							console.log(amount[f]);
						}

						for (var f = 0; f < amount.length; f++) {
							console.log("a" + amount[f]);
						}

						for (var f = 0; f < day.length; f++) {
							console.log("a" + day[f]);
						}

						var series = [ {
							name : "일일 매출",
							data : amount,

							// Line chart marker type
							markers : {
								type : "square"
							}
						} ];
						function createChart() {
							$("#chart").kendoChart({
								title : {
									text : "Site Visitors Stats /thousands/"
								},
								legend : {
									position : "bottom"
								},
								seriesDefaults : {
									type : "column",
									stack : true
								},
								series : series,
								valueAxis : {
									line : {
										visible : false
									}
								},
								categoryAxis : {
									categories : day,
									majorGridLines : {
										visible : false
									}
								},
								tooltip : {
									visible : true,
									format : "{0}"
								}
							});
						}

						$(document).ready(function() {
							createChart();
							$(document).bind("kendo:skinChange", createChart);
							$(".options").bind("change", refresh);
						});

						function refresh() {
							var chart = $("#chart").data("kendoChart"), type = $(
									"input[name=seriesType]:checked").val(), stack = $(
									"#stack").prop("checked");

							for (var i = 0, length = series.length; i < length; i++) {
								series[i].stack = stack;
								series[i].type = type;
							}
							;

							chart.setOptions({
								series : series
							});
						}

					}

				};
				xhttp.open("GET", root + "/saleMg/mgSale?date1=" + date1 + "&date2=" + date2, true);
				xhttp.send();
			}
		}
	</script>

<!--  -->
<%-- <script src="${root}/js/vendor/bootstrap/bootstrap.bundle.min.js"></script> --%>
<!--  -->
<%-- <script src="${root}/js/vendor/jquery-easing/jquery.easing.min.js"></script> --%>

<%-- <script src="${root}/js/vendor/sb-admin.min.js"></script> --%>
<script src="${root}/js/vendor/sb-admin-datatables.min.js"></script>
    <!-- table(grid) -->
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>

</body>
</html>