<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${root}/styles/kendo.common.min.css" />
<link rel="stylesheet" href="${root}/styles/kendo.default.min.css" />
<link rel="stylesheet" href="${root}/styles/kendo.default.mobile.min.css" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<html>
<head>
<title>나의 성적</title>
</head>
<jsp:include page="../../../top.jsp"/>
<body>
	<div id="chart" style="width:100%;"></div>
	<div id="examTp">
		<select id="examTpList" onchange="scrBySbjt(this.value,'${root}')"></select>
	</div>
	<input type="hidden" id="scrList" value="${requestScope.scrList.size()}">
	<input type="hidden" id="json" value='${requestScope.json}'>
	
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/kendo.all.min.js"></script>
<script type="text/javascript">

	var json = $("#json").val();
	var listSize = $("#scrList").val();
	json = JSON.parse(json);
	console.log(json)
	
	var examTitle = new Array();
	var examId = new Array();
	var sbjtTp = new Array();
	var scr = new Array();
	var avg = new Array();
	var sum = 0;
	var cnt = 1;
	for(var i = 0; i < listSize; i++){
		examTitle.push(json[i].examTitle);
		examId.push(json[i].examId);
		sbjtTp.push(json[i].sbjtNm);
		scr.push(json[i].score);
		sum += json[i].score;
		
		if(cnt % 5 == 0){
			avg.push(sum/5);
			sum = 0;
		}
		cnt++;
	}
	
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
	
	sbjtTp = sbjtTp.unique();
	examTitle = examTitle.unique();
	examId = examId.unique();
	
	var examTpTag = "<option value='default'>시험 평균</option>"
	
	for (var i = 0; i < examTitle.length; i++) {
		examTpTag += "<option value='" + examId[i] + "'>" + examTitle[i] + "</option>"
	}
	document.getElementById("examTpList").innerHTML = examTpTag;
	
	var series = [ {
		name : "시험 평균",
		data : avg,

		// Line chart marker type
		markers : {
			type : "square"
		}
	} ];
	
	function createChart() {
		$("#chart").kendoChart({
			title : {
				text : "나의 시험 성적"
			},
			legend : {
				position : "bottom"
			},
			seriesDefaults : {
				type : "line",
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
				categories : examTitle,
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
				"line").val(), stack = $(
				"#stack").prop("checked");

		for (var i = 0, length = series.length; i < length; i++) {
			series[i].stack = stack;
			series[i].type = type;
		}
		;

		chart.setOptions({
			series : avg
		});
	}
//  시험별 국영수사과 점수
	function scrBySbjt(exam, root){
		if(exam == "default"){
			location.reload();
		}
		var sbjtNm = new Array();
		var detailscr = new Array();
		
		for (var i = 0; i < listSize; i++) {
			if(json[i].examId == exam){
				sbjtNm.push(json[i].sbjtNm);
				detailscr.push(json[i].score);
			}
		}
				
		var series = [ {
			name : "과목별 점수",
			data : detailscr,

			// Line chart marker type
			markers : {
				type : "square"
			}
		} ];
		
		function createChart() {
			$("#chart").kendoChart({
				title : {
					text : ""
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
					categories : sbjtNm,
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
			var chart = $("#chart").data("kendoChart"), 
				type = $("column").val(), 
				stack = $("#stack").prop("checked");

			for (var i = 0, length = series.length; i < length; i++) {
				series[i].stack = stack;
				series[i].type = type;
			}
			;

			chart.setOptions({
				series : detailscr
			});
		}
	}
</script>
<!-- <Br><Br><Br><Br><Br><Br><Br><Br><Br><Br> -->
<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>