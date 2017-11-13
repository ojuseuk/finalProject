<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${root}/styles/kendo.common.min.css" />
<link rel="stylesheet" href="${root}/styles/kendo.default.min.css" />
<link rel="stylesheet" href="${root}/styles/kendo.default.mobile.min.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/kendo.all.min.js"></script>
</head>
<body>

	<input type="date" name="date1" id="date1" > ~ <input type="date" name="date2" id="date2">
	<button onclick="saleMg('${root}')">조회</button>
	
	<div id="demo"></div>
	
	<div id="chart"></div>
	<script type="text/javascript">
		function saleMg(root){
			var date1 = document.getElementById("date1").value;
			var date2 = document.getElementById("date2").value;
			
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var saleList = this.responseText;
					saleList = JSON.parse(saleList);
					console.log(saleList);
// 					document.getElementById("demo").innerHTML = restData;
					
					var arrTh = ['번호', '년', '월', '일', '비용항목', '금액'];
					
					var div = document.createElement('div');
					var text = document.createTextNode('Hello');
					div.setAttribute('class', 'w3-container');
					div.appendChild(text);
					var table = document.createElement('table');
					table.setAttribute('class', 'w3-table w3-bordered');
					var tr = document.createElement('tr');
					var th;
					for(var a=0;a<6;a++){
						th = document.createElement('th');
						th.appendChild(document.createTextNode(arrTh[a]));
						tr.appendChild(th);
					}
					table.appendChild(tr);
					var tr2;
					
					var str;
					alert(saleList.length);
					for(var b=0;b<saleList.length;b++){
						tr2 = document.createElement('tr');
						var td1 = document.createElement('td');
						td1.appendChild(document.createTextNode(saleList[b].no));
						var td2 = document.createElement('td');
						td2.appendChild(document.createTextNode(saleList[b].year));
						var td3 = document.createElement('td');
						td3.appendChild(document.createTextNode(saleList[b].month));
						var td4 = document.createElement('td');
						td4.appendChild(document.createTextNode(saleList[b].day));
						var td5 = document.createElement('td');
						td5.appendChild(document.createTextNode(saleList[b].costItem));
						var td6 = document.createElement('td');
						td6.appendChild(document.createTextNode(saleList[b].amount));
						tr2.appendChild(td1);
						tr2.appendChild(td2);
						tr2.appendChild(td3);
						tr2.appendChild(td4);
						tr2.appendChild(td5);
						tr2.appendChild(td6);
						table.appendChild(tr2);
					}
					
					var amount = new Array();
					var day = new Array();
					var year = new Array();
					var month = new Array();
					var amountD=0;
					var e=0;
					
					for(var d=0;d<saleList.length-1;d++){
						console.log(d);
						console.log("test1:  "+saleList[d].amount);
						if(saleList[d].year == saleList[d+1].year && saleList[d].month == saleList[d+1].month && saleList[d].day == saleList[d+1].day){
							console.log("test2:  "+saleList[d].amount);
							amountD += saleList[d].amount;					
						}else{
							amountD += saleList[d].amount;
							amount.push(amountD);
							console.log("test3:  "+amountD);	
							amountD=0;
						}
						year.push(saleList[d].year);
						month.push(saleList[d].month);
						day.push(saleList[d].day);
					}
					
					Array.prototype.unique = function() {
				        var a = {};
				        for (var i = 0; i < this.length; i++) {
				            if (typeof a[this[i]] == 'undefined') {
				                a[this[i]] = 1;
				            }
				        }
				        this.length = 0;
				        for (var i in a) {
				            this[this.length] = i;
				        }
				        return this;
				    };
				    day = day.unique()
					for(var f=0;f<amount.length;f++){
// 						alert("합계 : "+amount[f]);
						console.log(amount[f]);
					}
					
					for(var f=0;f<amount.length;f++){
// 						alert("합계 : "+amount[f]);
						console.log("a" + amount[f]);
					}
					
					for(var f=0;f<day.length;f++){
// 						alert("합계 : "+amount[f]);
						console.log("a" + day[f]);
					}
					
					var series = [ {
						name : "일일 매출",
						data :  amount ,

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
					div.appendChild(table);
					
					document.getElementById("demo").appendChild(div);
					


				}
			};
			xhttp.open("GET", root+"/saleMg/mgSale?date1="+date1+"&date2="+date2, true);
			xhttp.send();
		}
	</script>
	

</body>
</html>