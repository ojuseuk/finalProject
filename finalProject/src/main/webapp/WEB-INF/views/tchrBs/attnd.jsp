<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${root}/js/jquery.min.js"></script>
<body>

	<div class="w3-container">
		<h2>강사 업무 - 출석 확인</h2>

		<select name="clss" id="clss">
			<option value="선택">선택</option>
		</select>
		<button onclick="clssSearch('${root}')">조회</button>

		<div id="default">
			<table class="w3-table w3-bordered">
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
				</tr>
				<tr>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
				</tr>
				<tr>
					<td>abc</td>
					<td>abc</td>
					<td>abc</td>
					<td>abc</td>
					<td>abc</td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<br>
		<div id="abc">학생 출석 정보가 없습니다.</div>
	</div>

	<input type="hidden" value='${requestScope.json}' id="json">
	<input type="hidden" value='${requestScope.list.size()}' id="listSize">
	<script type="text/javascript">
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
			$("#clss option:eq(0)").after(
					"<option value='" + clssId[i] + "'>" + clssId[i]
							+ "</option>");
		}

		function dateParse(str) {
			var y = str.substr(0, 4);
			var m = str.substr(4, 2);
			var d = str.substr(6, 2);
			return new Date(y, m - 1, d);
		}

		function pad(n, width) {
			n = n + '';
			return n.length >= width ? n : new Array(width - n.length + 1)
					.join('0')
					+ n;
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

						var stdtNo = new Array();
						var dtE = new Array(); //입실
						var dtD = new Array(); //퇴실
						for (var i = 0; i < json.length; i++) {
							stdtNo.push(json[i].STDTNO);

							if (json[i].ATTNDTP == 'at001'
									|| json[i].ATTNDTP == 'at002') {
								dtE.push(json[i].DT);
							} else {
								dtD.push(json[i].DT);
							}

						}
						console.log('20171201' == dtE[0]);
						console.log(dtE[0])
						var startDate = json[0].STDTDT;
						var endDate = json[0].ENDDT;

						startDate = dateParse(startDate);
						endDate = dateParse(endDate);

						var time = (endDate - startDate)
						/1000/(24 * 60 * 60) + 1;

						var week = new Array('일', '월', '화', '수', '목', '금', '토');

						var $table = $('<table></table>');
						$table.attr("class", "w3-table w3-bordered");
						var $tr1 = $('<tr></tr>');
						var $tr2 = $('<tr></tr>');
						var $td1, $td2;

						var y, m, d, dN, yy, mm, dd;
						var ymdDate = new Array();
						/* alert(json[0].ATTNDTP);
						alert(startDate); */
						var a = 0;
						for (var i = 0; i < time; i++) {
							y = startDate.getFullYear();
							m = startDate.getMonth() + 1;
							d = startDate.getDate();
							dN = week[startDate.getDay()];
							d2 = pad(d, 2);
							ymdDate.push(y + '' + m + d2);
							startDate.setDate(d + 1);

							$td1 = $('<td></td>');
							$td1.append(d);
							$tr1.append($td1);
							$td2 = $('<td></td>');
							$td2.append(dN);
							$tr2.append($td2);

						}

						$table.append($tr1);
						$table.append($tr2);

						var $tr3 = $('<tr></tr>');
						var $tr4 = $('<tr></tr>');
						var $td3, $td4;
						console.log(dtE[0] == ymdDate[0]);
						console.log(ymdDate[0]);

						var a = new Date();
						y = a.getFullYear();
						m = a.getMonth() + 1;
						d = a.getDate();
						d2 = pad(d, 2);
						abc = y + '' + m + d2;
						console.log(abc == '20171115');
						console.log('20171213' < (ymdDate[13]));
						for (var i = 0; i < time; i++) {
							$td3 = $('<td></td>');
							$td3.append("abc");
							$tr3.append($td3);

							for (var j = 0; j < dtE.length; j++) {
								$td4 = $('<td></td>');
								if (ymdDate[i] == dtE[j]) {
									$td4.append(json[i].ATTNDTP);
									break;
								} else {
									if (abc < ymdDate[i]) {
										$td4.append("아직")
									} else {
										$td4.append("결석");
									}
								}
							}

							$tr4.append($td4);
						}
						// 					console.log(dtE[1].compareTo(dtE[]))

						$table.append($tr3);
						$table.append($tr4);
						$('#abc').attr("style", "overflow: scroll");
						$('#abc').append($table);

					}
				}

				xhttp.open("GET", root + "/tchrBs/attndClss?clssId=" + clssId,
						true);
				xhttp.send();
			}
		}
	</script>
</body>
</html>