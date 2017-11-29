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
			attndTp[j] = "<font color='red'>지각</font>";
		} else if (attndTp[j] == "at003"){
			attndTp[j] = "출석";
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