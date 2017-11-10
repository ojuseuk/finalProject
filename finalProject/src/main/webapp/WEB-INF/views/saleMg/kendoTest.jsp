<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../styles/kendo.common.min.css" />
<link rel="stylesheet" href="../styles/kendo.default.min.css" />
<link rel="stylesheet" href="../styles/kendo.default.mobile.min.css" />

<script src="../js/jquery.min.js"></script>
<script src="../js/kendo.all.min.js"></script>
</head>
<body>
	<div id="example">
		<div class="demo-section k-content wide">
			<div id="chart"></div>
		</div>
		<div class="box wide">
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
		${requestScope.list} ${requestScope.json} ${requestScope.object} <input
			type="hidden" value='${requestScope.json}' id="jsonData">


	</div>
	<script type="text/javascript">
		var json = document.getElementById("jsonData").value;
		var jsonData = '{ "list" : ' + json + '}';
		var jsonData2 = JSON.parse(jsonData);
		var data = "";

		var amountArray = new Array();
		var dayArray = new Array();

		for (var i = 0; i < 3; i++) {
			amountArray[i] = jsonData2.list[i].amount;
			dayArray[i] = jsonData2.list[i].day;
// 			alert(jsonArray[i]);
		}

// 		alert(jsonArray);
		var series = [ {
			name : "일일 매출",
			data :  amountArray ,

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
					categories : dayArray,
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
					"input[name=seriesType]:checked").val(), stack = $("#stack")
					.prop("checked");

			for (var i = 0, length = series.length; i < length; i++) {
				series[i].stack = stack;
				series[i].type = type;
			}
			;

			chart.setOptions({
				series : series
			});
		}
	</script>

</body>
</html>