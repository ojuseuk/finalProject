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
<div id="calendar_wrap" width="100%">
	<table class="table table-bordered" id="calendar">
<!-- 	border="1" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black" -->
	  <caption>
	    <span class="year"></span>년 
	    <span class="month"></span>월 
	  </caption>
	  <tr>
	    <th>일</th>
	    <th>월</th>
	    <th>화</th>
	    <th>수</th>
	    <th>목</th>
	    <th>금</th>
	    <th>토</th>
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
	var attndTp = new Array();
	var attdnDate = new Array();
	for (var i = 0; i < listSize; i++) {
		attndTp.push(json[i].ATTND_TP);
	}
	for (var i = 0; i < listSize; i++) {
		attdnDate.push(json[i].DT);
	}
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
	
	// caption 영역 날짜 표시 객체
	var caption_year = document.querySelector('.year'),
	    caption_month = document.querySelector('.month');

	var start_day = document.querySelectorAll('tr td');

	// 테이블 초기화
	for(var i = 0; i < start_day.length; i++){
		start_day[i].innerHTML = '&nbsp;';
	}
	var j = 0;
	// 한달치 날짜를 테이블에 시작 요일부터 순서대로 표시
	for(var i = day; i < day + d_length; i++){
		if(date > today.getDate()){
			attndTp[j] = "예정";
		}
		if(attndTp[j] == "at001"){
			attndTp[j] = "출석";
		} else if (attndTp[j] == "at002"){
			attndTp[j] = "<font color='red'>결석</font>";
		} else if (attndTp[j] == "at003"){
			attndTp[j] = "<font color='yellow'>지각</font>";
		} else if (attndTp[j] == "at004"){
			attndTp[j] = "<font color='green'>조퇴</font>";
		}
		
	  start_day[i].innerHTML = date + "<br>" + attndTp[j];
	  date++;
	  j++;
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
// 	prev.onclick = function(){
// 		calendar(year, --month);
// 	};
// 	next.onclick = function(){
// 		calendar(year, ++month);
// 	};		

})();
</script>
<Br><Br><Br><Br><Br><Br><Br><Br><Br><Br>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>