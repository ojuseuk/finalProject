/**
 * 직원관리 화면에서 사용하는 javascript
 */

		/* spring-security를 사용할 경우 해아할 header와 token
			만약 getAttribute('content')를 했을경우 ''가 찍힌다면 spring-security의 
			csrf 방어를 할지 안할지의 여부 확인 필요.
		*/
		var root = document.getElementById("root").value;
		var token = document.getElementById('_csrf').getAttribute('content');
		var header = document.getElementById('_csrf_header').getAttribute('content');
		var xhttp = new XMLHttpRequest();
		var data;

		resultMsg = document.getElementById("resultMsg").value;
		if(resultMsg != ""){
			alert(resultMsg);
		}
		
		/* 사원번호로 TB_EMP 업데이트 - 동기 방식*/
		function empUpdate(){
			document.getElementById("frmEmp").action = root + "/empUpdate";
			document.getElementById("frmEmp").submit();
		}
//		document.getElementById("frmCrs").action = root + "/courseUpdate";

		var jsonList = document.getElementById("jsonList").value;
		console.log(jsonList);
		jsonList = JSON.parse(jsonList);
		
		/* dataTable 처리 */
		$(document).ready(function(){
			$('#dataTable').DataTable({
				"language": {
					    search: "검색 : " ,
			            "thousands": ","
				},
				"scrollY" : 330,
				"scrollCollapse" : true,
				data : jsonList,
				columns : [ {
					"data" : "id",
					"searchable": false
					}, {
						"data" : "empNo",
						"searchable": false,
						"render" : function(data, type, row, meta){
							data = '<div align="center"><input type="button" value="' + data + '" onclick="empSelect(\''+root+'\', \''+data+'\')"></div>';
							return data;
						}
					}, {
						"data" : "nm",
					}, {
						"data" : "slr",
						"render" : function(data){
							data = '<div align="right">' + data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '</div>';	
							return data;
						}
					}, {
						"data" : "retiredDt"
					}]
			});
		});
 
		
		/* 직원 퇴사 처리 : 퇴사일자 업데이트 */
		function empRetire(root, empNo){
			document.getElementById("frmEmp").action = root + "/empRetire";
			document.getElementById("frmEmp").submit();
		}
		
		/* 사용자 ID로 TB_USR 검색 */
		function searchUsr(root, id){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					alert(data);
					data = JSON.parse(data);
					document.getElementById("nm2").value = data.nm;
				}
			}
			xhttp.open("GET", root + "/usrSearch?id=" + id, true);
			xhttp.send();
		}
		
 		function inputNumberFormat(slr) {
		    return String(slr).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		/* 사원번호로 TB_EMP 검색 */
		function empSelect(root, empNo){
			
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					console.log(data);
					data = JSON.parse(data);
					document.getElementById("empNo").value = data.empNo;
					document.getElementById("id2").value = data.id;
					document.getElementById("nm2").value = data.nm;
					document.getElementById("slr").value = inputNumberFormat(data.slr);
					document.getElementById("retiredDt").value = data.retiredDt;
					document.getElementById("empNo").readOnly = true;
					document.getElementById("nm2").readOnly = true;
				}
			}
			xhttp.open("GET", root + "/empSelect?empNo=" + empNo, true);
			xhttp.send();
		}
		