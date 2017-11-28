/**
 * 
 */

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

function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

function monthSale() {
	let year = $('#year').val(); // 년도
	let month = $('#month').val(); // 월
	let day = (new Date(year, month, 0)).getDate(); //y,m 기준으로 그달 마지막 day
	month = pad(month, 2);
	let max = year + "-" + month + "-" + day;
	let min = year + "-" + month + "-" + "01";
	alert(min);
	alert(max);
	$('#day').attr("min", min);
	$('#day').attr("max", max);

}

function saleYear(root, button) {
	//day 값 빼오는 중.....................
	let y = $('#year').val();		// 년도
	let m = $('#month').val();		// 월
	let d = $('#day').val();		// 일
	alert(d);
	let amount = new Array();
	let month = new Array();
	let amountD = 0;
	var dateD = d.split("-");
	
	if(m == "선택"){
		m = 0;
	}
	if(d == ""){
		d = 0;
	}else{
		y = dateD[0];
		m = dateD[1];
		d = dateD[2];
	}
	
	let param = "year="+y+"&month="+m+"&day="+d;
	alert(param);
	
	
	if (d == "y" && y == "선택") {
		alert("년도를 선택해 주세요.");
	}else if (button == "m" && m == 0){
		alert("달을 선택해 주세요.")
	}else if(button == "d" && d == 0){
		alert("요일을 선택해 주세요.")
	}else {

		$('#chartList').css("display", "block");
// 				$('#dataTable').dataTable().fnDestroy();
// 				table.clear();
// 				$('#dataTable tobody:child').empty();
		$.ajax({
			type : "GET",
			url : root + "/saleMg/mgSale",
			data : param,
			success : function(data) {
				console.log(data);
				
				$('#dataTable').DataTable({
					"language": {
						    search: "검색 : " 
					},
					"destroy": true,
					"scrollY" : 250,
					"scrollCollapse" : true,
					data : data,
					columns : [ {
						"data" : "no",
						//아래 링크 걸어서 사용 아니면 onclick
						"render" : function(data, type, row, meta){
							data = '<a href="www.naver.com">'+data+'</a>';
							
							return data;
						},
						"searchable": false
					}, {
						"data" : "year",
						"searchable": false
					}, {
						"data" : "month",
						"searchable": false
					}, {
						"data" : "day",
						"searchable": false
					}, {
						"data" : "costItem",
						"searchable": false
					}, {
						"data" : "amount",
						"render" : function(data){
							return data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
						}
					} ]
				});
				
				$('#column3_search').on( 'keyup', function () {
				    table
				        .columns( 3 )
				        .search( this.value )
				        .draw();
				} );
				
				console.log("test : " + button);
				
				for (var i = 0; i < data.length; i++) {

					if(button == 'y'){
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
					}else if(button == 'm'){
						if ((i + 1) < data.length) {
							if (data[i].day == data[i + 1].day) {
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
						month.push(data[i].day);
					}else if(button == 'd'){
						amount.push(data[i].amount);
						month.push(data[i].no);
					}
					
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

				let str ="";
				if(button == 'y'){
					str = "월별 매출";
				}else if(button == 'm'){
					str = "일별 매출";
				}else if(button == 'd'){
					str = "개별";
				}
				var series = [ {
					name : str,
					data : amount,

					// Line chart marker type
					markers : {
						type : "square"
					}
				} ];

				
				function createChart() {
					$("#chart").kendoChart({
						title : {
							text : "매출 관리"
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

// 							$(document).ready(function() {
						createChart();
						$(document).bind("kendo:skinChange", createChart);
						$(".options").bind("change", refresh);
// 							});

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