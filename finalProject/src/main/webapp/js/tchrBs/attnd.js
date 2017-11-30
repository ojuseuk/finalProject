/**
 * 
 */
var json = $('#json').val();
var listSize = $('#listSize').val();
json = JSON.parse(json);

var clssId = new Array();

for (var i = 0; i < listSize; i++) {
	clssId.push(json[i].CLSSID);
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

clssId = clssId.unique();

for (var i = 0; i < clssId.length; i++) {
	$("#clss option:eq(0)").after("<option value='" + clssId[i] + "'>" + clssId[i] + "</option>");
}

function dateParse(str) {
	var y = str.substr(0, 4);
	var m = str.substr(4, 2);
	var d = str.substr(6, 2);
	return new Date(y, m - 1, d);
}

function pad(n, width) {
	n = n + '';
	return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

function clssSearch(root) {

	var clssId = $('#clss').val();
	$('#abc').empty();
	$('#abc').removeAttr("style");
	if (clssId == '선택') {
		$('#abc').append("학생 출석 정보가 없습니다.");
	} else {
// 				$("div [id='abc'] table").remove();
		$('#abc').empty();
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
	
			if (this.readyState == 4 && this.status == 200) {
				var json = this.responseText;
				json = JSON.parse(json);
				
				var stdtNo = new Array();	//학생 번호
				var dtE = new Array(); //입실
				var dtD = new Array(); //퇴실
				
				for (var i = 0; i < json.length; i++) {
					stdtNo.push(json[i].NM);

					if (json[i].ATTNDTP == 'at001'
							|| json[i].ATTNDTP == 'at002') {
						dtE.push(json[i]);
					} else {
						dtD.push(json[i]);
					}

				}
				
//				console.log(stdtNo);
				stdtNo = stdtNo.unique();
//				console.log(stdtNo);
				var startDate = json[0].STDTDT;
				var endDate = json[0].ENDDT;
		
				startDate = dateParse(startDate);
//				console.log(startDate);
				endDate = dateParse(endDate);

				var time = (endDate - startDate)
				/1000/(24 * 60 * 60) + 1;

				var week = new Array('일', '월', '화', '수', '목', '금', '토');

				var $table = $('<table></table>');
				$table.attr("class", "w3-table w3-bordered");
				var $tr1 = $('<tr style="background-color: #90909096; align:center"></tr>');
				var $tr2 = $('<tr style="background-color: #90909096; align:center"></tr>');
				var $td1, $td2, $td11, $td22;
				
				$td11 = $('<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>');
				$td11.attr("width", "200px");
				$td22 = $('<td>이름</td>');
				$tr1.append($td11);
				$tr2.append($td22);
				
				var y, m, d, dN, yy, mm, dd;
				var ymdDate = new Array();
				var a = 0;
				
				for (var i = 0; i < time; i++) {
					y = startDate.getFullYear();
					m = startDate.getMonth() + 1;
					m2 = pad(m, 2);
					d = startDate.getDate();
					dN = week[startDate.getDay()];
					d2 = pad(d, 2);
					ymdDate.push(y + '' + m2 + d2);
					startDate.setDate(d + 1);

					$td1 = $('<td></td>');
					$td1.append(y+"/"+m+"/"+d);
					$tr1.append($td1);
					$td2 = $('<td></td>');
					if(startDate.getDay() == 1){
						$td2.append('<font color="red">'+dN+'</font>');
					}else if(startDate.getDay() == 0){
						$td2.append('<font color="blue">'+dN+'</font>');
					}else{
						$td2.append(dN);
					}
					$tr2.append($td2);

				}

				$table.append($tr1);
				$table.append($tr2);

				var $tr3, $tr4;
				var $td3, $td4, $td33, $td44;
				
				var a = new Date();
				y = a.getFullYear();
				m = a.getMonth() + 1;
				m2 = pad(m, 2);
				d = a.getDate();
				d2 = pad(d, 2);
				todayDate = y + '' + m2 + d2;
//				console.log(ymdDate);
//				console.log(dtE);
				let holiday = "";
				console.log(dtD);
				console.log(stdtNo);
				let stdtNoDtD;
				let stdtNoTpD;
				let stdtNoDtE;
				let stdtNoTpE;
				
				for(var a=0; a<stdtNo.length; a++){
					stdtNoDtD = new Array();
					stdtNoTpD = new Array();
					stdtNoDtE = new Array();
					stdtNoTpE = new Array();
					$tr3 = $('<tr style="background-color: white; align:center"></tr>');
					$tr4 = $('<tr style="background-color: white; align:center; border-bottom : 2px solid"></tr>');
					$td33 = $('<td>'+stdtNo[a]+'-입실확인</td>');
					$td44 = $('<td>'+stdtNo[a]+'-퇴실확인</td>');
					$tr3.append($td33);
					$tr4.append($td44);
					
					for(var b=0;b<dtE.length;b++){
						
						if(dtE[b].NM == stdtNo[a]){
							stdtNoDtE.push(dtE[b].DT);
							stdtNoTpE.push(dtE[b].ATTNDTP);
						}
						
					}
					for(var b=0;b<dtD.length;b++){
						if(dtD[b].NM == stdtNo[a]){
							stdtNoDtD.push(dtD[b].DT);
							stdtNoTpD.push(dtD[b].ATTNDTP);
						}
					}
					console.log(a +" -- "+stdtNoDtE);
					console.log(a +" -- "+stdtNoTpE);
					for (var i = 0; i < time; i++) {
						holiday = dateParse(ymdDate[i]);
						let attndTp;
						for (var j = 0; j < dtE.length; j++) {
							$td3 = $('<td></td>');	
							if (todayDate < ymdDate[i]) {
								$td3.append("예정");
							}else if(holiday.getDay() == 6 || holiday.getDay() == 0){
								$td3.append('<font color="blue">휴일</font');
							}else{
								if (ymdDate[i] == stdtNoDtE[j]) {
									
									attndTp = stdtNoTpE[j];
									if(attndTp == 'at001'){
										$td3.append("출석");	
									}else if(attndTp == 'at002'){
										$td3.append('<font color="orange">지각</font>');
									}
									break;
									
								} else {
										$td3.append('<font color="red">결석</font>');
								}
							}
						}// end of for - j

						$tr3.append($td3);
					}// end of for - i
					
					for (var i = 0; i < time; i++) {
						let attndTp;
						holiday = dateParse(ymdDate[i]);
						for (var j = 0; j < dtD.length; j++) {
							$td4 = $('<td></td>');
							
							if (todayDate < ymdDate[i]) {
								$td4.append("예정");
							}else if(holiday.getDay() == 6 || holiday.getDay() == 0){
								$td4.append('<font color="blue">휴일</font');
							}else{
								if (ymdDate[i] == stdtNoDtD[j]) {
									
									attndTp = stdtNoTpD[j];
									if(attndTp == 'at003'){
										$td4.append("조퇴");
									}else if(attndTp == 'at004'){
										$td4.append("퇴실");
									}
									break;
								} else {
									$td4.append('<font color="red">결석</font>');
								}
							}
						}

						$tr4.append($td4);
					}
					$table.append($tr3);
					$table.append($tr4);
				}
// 						$table.append($tr5);
// 						$table.append($tr6);
				$('#abc').attr("style", "overflow: scroll");
				$('#abc').append($table);

			}
		}

		xhttp.open("GET", root + "/tchrBs/attndClss?clssId=" + clssId,
				true);
		xhttp.send();
	}
}