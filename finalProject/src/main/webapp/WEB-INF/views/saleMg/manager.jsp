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
<%-- <link rel="stylesheet" href="${root}/styles/vendor/font-awesome/font-awesome.min.css" /> --%>
<%-- <link rel="stylesheet" href="${root}/styles/vendor/css/sb-admin.css" /> --%>

<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/kendo.all.min.js"></script>
</head>
<body>
	<div>
		<input type="date" name="date1" id="date1" onblur="date2Min()">
		~ <input type="date" name="date2" id="date2" onblur="date1Max()">
		<button onclick="saleMg('${root}')" id="searchSale">조회</button>
	</div>
	<div style="width: 100%;">
		<div id="demo" class="card mb-3" align="left"
			style="float: left; width: 50%">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>번호</th>
								<th>년</th>
								<th>월</th>
								<th>일</th>
								<th>비용항목</th>
								<th>금액</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>번호</th>
								<th>년</th>
								<th>월</th>
								<th>일</th>
								<th>비용항목</th>
								<th>금액</th>
							</tr>
						</tfoot>
						<tbody>
							<tr class="odd" id="dataDefault">
								<td valign="top" colspan="6" class="dataTables_empty"
									align="center">No data available in table</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div style="float: right; width: 50%" id="example">
			<div class="demo-section k-content wide">
			<div id="chart"></div>
			</div>
			<div class="box wide" style="display: none;" id="abc">
				<div class="box-col">
					<h4>API Functions</h4>
					<ul class="options">
						<li><input id="typeColumn" name="seriesType" type="radio"
							value="column" checked="checked" autocomplete="off" /> <label
							for="typeColumn">Columns</label></li>
						<li><input id="typeBar" name="seriesType" type="radio"
							value="bar" autocomplete="off" /> <label for="typeBar">Bars</label>
						</li>
						<li><input id="typeLine" name="seriesType" type="radio"
							value="line" autocomplete="off" /> <label for="typeLine">Lines</label>
						</li>
						<li><input id="stack" type="checkbox" autocomplete="off"
							checked="checked" /> <label for="stack">Stacked</label></li>
					</ul>
					<p>
						<strong>refresh()</strong> will be called on each configuration
						change
					</p>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var editor;
		function date2Min() {
			$('#date2').attr("min", $('#date1').val());
		}

		function date1Max() {
			$('#date1').attr("max", $('#date2').val());
		}

		function saleMg(root) {
			var date1 = $('#date1').val();
			var date2 = $('#date2').val();
			
			$('#abc').css("display", "block");
			$('#dataDefault').remove();
			$('#dataTable').dataTable().fnDestroy();

			if (date1 == "" || date2 == "") {
				alert("날짜를 선택해 주세요");
			} else {
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						saleList = this.responseText;
						console.log(saleList);

						saleList = JSON.parse(saleList);

						console.log(saleList);
						$('#dataTable').DataTable({
							"scrollY" : 250,
							"scrollCollapse" : true,
							data : saleList,
							columns : [ {
								"data" : "no",
								//아래 링크 걸어서 사용 아니면 onclick
								"render" : function(data, type, row, meta){
									data = '<a href="www.naver.com">'+data+'</a>';
									
									return data;
								}
							}, {
								"data" : "year"
							}, {
								"data" : "month"
							}, {
								"data" : "day"
							}, {
								"data" : "costItem"
							}, {
								"data" : "amount"
							} ]
						});
						
						var amount = new Array();
						var day = new Array();
						var year = new Array();
						var month = new Array();
						var amountD = 0;
						var e = 0;

						for (var d = 0; d < saleList.length; d++) {
							console.log(d);

							if ((d + 1) < saleList.length) {
								if (saleList[d].year == saleList[d + 1].year
										&& saleList[d].month == saleList[d + 1].month
										&& saleList[d].day == saleList[d + 1].day) {
									console.log("test1:  " + saleList[d].amount
											+ "-" + saleList[d].day);
									console.log("test2:  "
											+ saleList[d + 1].amount + "-"
											+ saleList[d + 1].day);
									amountD += saleList[d].amount;
								} else {
									amountD += saleList[d].amount;
									amount.push(amountD);
									console.log("test3:  " + amountD);
									amountD = 0;
								}
							} else {
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
								seriesColors: ["#108D25"],
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
				xhttp.open("GET", root + "/saleMg/mgSale?date1=" + date1
						+ "&date2=" + date2, true);
				xhttp.send();
			}
		}
	</script>

	<%-- <script src="${root}/js/vendor/bootstrap/bootstrap.bundle.min.js"></script> --%>
	<%-- <script src="${root}/js/vendor/jquery-easing/jquery.easing.min.js"></script> --%>
	<!-- table(grid) -->
	<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
	<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>

</body>
</html>