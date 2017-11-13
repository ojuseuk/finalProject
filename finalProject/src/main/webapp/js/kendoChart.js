/**
 * 	차트를 만들고 데이터 삽입을 위한 js 파일
 * 
 */

var json = document.getElementById("jsonData").value;
var jsonData = '{ "list" : ' + json + '}';
var jsonData2 = JSON.parse(jsonData);
var data = "";

var amountArray = new Array();
var dayArray = new Array();

for (var i = 0; i < 3; i++) {
	amountArray[i] = jsonData2.list[i].amount;
	dayArray[i] = jsonData2.list[i].day;
	// alert(jsonArray[i]);
}

// alert(jsonArray);
var series = [ {
	name : "일일 매출",
	data : amountArray,

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
			"input[name=seriesType]:checked").val(), stack = $("#stack").prop(
			"checked");

	for (var i = 0, length = series.length; i < length; i++) {
		series[i].stack = stack;
		series[i].type = type;
	}
	;

	chart.setOptions({
		series : series
	});
}