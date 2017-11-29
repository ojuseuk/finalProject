<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<head>
	<title>Calendar</title>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div id="calendar_wrap" style="width: 80%; margin: auto;">
	<table class="table table-bordered" id="calendar" style="background-color: #ffffff; text-align: center">
<!-- 	border="1" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black" -->
	  <caption>
	    <p align="center"><span class="year" style="font-size: 40px"></span>년 
	    &nbsp;&nbsp;<span class="month" style="font-size: 40px"></span>월 </p>
	  </caption>
	  <tr>
	    <th style="text-align: center; background-color: #90909096">일</th>
	    <th style="text-align: center; background-color: #90909096">월</th>
	    <th style="text-align: center; background-color: #90909096">화</th>
	    <th style="text-align: center; background-color: #90909096">수</th>
	    <th style="text-align: center; background-color: #90909096">목</th>
	    <th style="text-align: center; background-color: #90909096">금</th>
	    <th style="text-align: center; background-color: #90909096">토</th>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	</table>

<!-- 	<p align="center"><a href="#" id="prev">이전 달</a> -->
<!-- 	<a href="#" id="next">다음 달</a></p> -->
</div> 

<input type="hidden" value='${requestScope.json}' id="json">
<input type="hidden" value='${requestScope.list.size()}' id="listSize">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	var json = $('#json').val();
	var listSize = $('#listSize').val();
	json = JSON.parse(json);
	var attndTpIn = new Array(); // 출석, 지각
	var attndTpOut = new Array(); // 조퇴, 퇴실
	var attndDate = new Array(); // 학원 수업 날짜
	var standard = new Array();	// 한달 날짜
	console.log(json);
	
	for (var i = 0; i < listSize; i++) {
		if (json[i].ATTND_TP == 'at001'	|| json[i].ATTND_TP == 'at002') {
			attndTpIn.push(json[i].ATTND_TP);
		} else {
			attndTpOut.push(json[i].ATTND_TP);
		}
	}
	for (var i = 0; i < listSize; i++) {
		attndDate.push(json[i].DT);
	}
	console.log(attndDate);
	//calendar 함수
	function calendar(new_year, new_month){
	// 특정 年月을 시작일부터 조회(year, month, date)
	var	d = new Date(new_year, new_month-1, 1),
	    // 월별 일수 구하기
	    d_length = 32 - new Date(new_year, new_month-1, 32).getDate(),
	    year = d.getFullYear(),
	    month = d.getMonth(),
	    date = d.getDate(),
	    day = d.getDay();
		attnd = "";
	var today = new Date();
	var montly = month + 1;
	for (var i = 1; i <= d_length; i++) {
		standard.push("" + year + "" + montly + "" + pad(i, 2));
	}
	console.log(standard);
	// 1을 01로 바꿔주는 함수
	function pad(n, width) {
		  n = n + '';
		  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	// caption 영역 날짜 표시 객체
	var caption_year = document.querySelector('.year'),
	    caption_month = document.querySelector('.month');
	
	var start_day = document.querySelectorAll('tr td');
	
	// 테이블 초기화
	for(var i = 0; i < start_day.length; i++){
		start_day[i].innerHTML = '&nbsp;';
	}
	
	// 배열의 중복값 제거
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
	attndDate = attndDate.unique();
	console.log(attndDate);
	var j = 0;
	// 한달치 날짜를 테이블에 시작 요일부터 순서대로 표시
	for(var i = day; i < day + d_length; i++){

			let str = "";
			str += date;
		for (var k = 0; k < d_length; k++) {
			if (date > today.getDate()){
				attndTpIn[k] = "예정";
				attndTpOut[k] = "예정";
				console.log(attndTpOut);
			}
			if(attndDate[k] == standard[j]){
				if (attndTpIn[k] == "at001"){
// 					attndTpIn[j] = "<b>출석</b>";
					str += "<br><b>출석</b>";
					
				} else if (attndTpIn[k] == "at002"){
// 					attndTpIn[j] = "<font color='red'><b>지각</b></font>";
					str += "<br><font color='red'><b>지각</b></font>";
				}else{
					str += "<br><b>예정</b>";
				}
				
				if (attndTpOut[k] == "at003"){
// 					attndTpOut[j] = "<b>퇴실</b>";
					str += "<br><b>퇴실</b>";
				} else if (attndTpOut[k] == "at004"){
// 					attndTpOut[j] = "<font color='blue'><b>조퇴</b></font>";
					str += "<br><font color='blue'><b>조퇴</b></font>";
				} else{
					str += "<br><b>예정</b>";
				}
				
			}
		}
		start_day[i].innerHTML = str;
		j++;
		date++;
		
	}
	
	// caption 날짜 표시
	caption_year.innerHTML = year;
	caption_month.innerHTML = month + 1;		
	}
	
	(function(){
	var prev = document.getElementById('prev'),
		next = document.getElementById('next'),
		year = new Date().getFullYear(),
		month = new Date().getMonth() + 1;
	
	calendar(year, month);
	//	prev.onclick = function(){
	//		calendar(year, --month);
	//	};
	//	next.onclick = function(){
	//		calendar(year, ++month);
	//	};		
	
	})();
</script>
<Br><Br><Br><Br>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>