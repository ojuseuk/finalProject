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
<link rel="stylesheet"
	href="${root}/styles/kendo.default.mobile.min.css" />

<link rel="stylesheet"
	href="${root}/styles/vendor/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/kendo.all.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
</head>
<body>
	<select id="year" onchange="yearSale()" name="month">
		<option value="선택">선택</option>
	</select>
	<button onclick="saleYear('${root}', 'y')">년 매출</button>
	<select id="month" name="month" onchange="monthSale()">
		<option value="선택" id="default">선택</option>
	</select>
	<button onclick="saleYear('${root}', 'm')">월 매출</button>
	<input type="date" id="day" name="day">
	<button onclick="saleYear('${root}', 'd')">일 매출</button>
	
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
			<div class="box wide" style="display: none;" id="chartList">
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
		let date = new Date(); // 현재 일자
		let year = date.getFullYear(); // 현재 년도

		for (var i = year - 10; i <= year; i++) {
			$("#year option:eq(0)").after(
					"<option value='"+i+"'>" + i + "</option>");
		}

		function yearSale() {
			$("select[id='month'] option").not("[id='default']").remove();

			for (var i = 1; i <= 12; i++) {
				$('#month option:eq(0)').after(
						"<option value='"+i+"'>" + i + "</option>");
			}

		}

		function monthSale() {
			let year = $('#year').val(); // 년도
			let month = $('#month').val(); // 월
			let day = (new Date(year, month, 0)).getDate(); //y,m 기준으로 그달 마지막 day
			string.Format("{0:D2}", day);
			let max = year + "-" + month + "-" + day;
			let min = year + "-" + month + "-" + "01";
			alert(min);
			alert(max);
			$('#day').attr("min", min);
			$('#day').attr("max", max);

		}

		function saleYear(root, d) {
			//day 값 빼오는 중.....................
			let y = $('#year').val();		// 년도
			let m = $('#month').val();		// 월
			let d = $('#day').val();		// 일
			let amount = new Array();
			let month = new Array();
			let amountD = 0;
			
			alert(d);
			if(m == "선택"){
				m = 0;
			}
			if(d == "선택"){
				d = 0;
			}
			let param = "year="+y+"&month="+m+"&day="+d;
			alert(param);
			
			if (d == "y" && y == "선택") {
				alert("년도를 선택해 주세요.");
			}else if (d == "m" && m == 0){
				alert("달을 선택해 주세요.")
			}else {

				$('#chartList').css("display", "block");
				$.ajax({
					type : "GET",
					url : root + "/saleMg/mgSale",
					data : param,
					success : function(data) {
						console.log(data);

						$('#dataTable').DataTable({
							"scrollY" : 250,
							"scrollCollapse" : true,
							data : data,
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
	
						for (var i = 0; i < data.length; i++) {
	
							if ((i + 1) < data.length) {
								if (data[i].month == data[i + 1].month) {
									amountD += data[i].amount;
								} else {
									amountD += data[i].amount;
									amount.push(amountD);
									amountD = 0;
								}
	
							} else {
								amountD += data[i].amount;
								amount.push(amountD);
							}
							month.push(data[i].month);
						}//end of for
	
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
	
						month = month.unique();
	
						var series = [ {
							name : "월별 매출",
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
									categories : month,
									majorGridLines : {
										visible : false
									}
								},
								tooltip : {
									visible : true,
									format : "{0}"
								}
							});
						}//end of createChart
	
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
								}// end of for
	
								chart.setOptions({
									series : series
								});
							}//end of refresh

					}//end of success

				});

			}// end of if

		}//end of saleYear
	</script>
</body>
</html>