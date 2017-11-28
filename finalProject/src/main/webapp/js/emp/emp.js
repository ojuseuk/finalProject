/**
 * 직원관리 화면에서 사용하는 javascript
 */

		/* spring-security를 사용할 경우 해아할 header와 token
			만약 getAttribute('content')를 했을경우 ''가 찍힌다면 spring-security의 
			csrf 방어를 할지 안할지의 여부 확인 필요.
		*/
		var token = document.getElementById('_csrf').getAttribute('content');
		var header = document.getElementById('_csrf_header').getAttribute('content');
		var xhttp = new XMLHttpRequest();
		var data;
		
		
		/* 사원번호로 TB_EMP 업데이트 - 동기 방식*/
		function empUpdate(){
			document.getElementById("frmEmp").action = "${pageContext.request.contextPath}/empUpdate";
			document.getElementById("frmEmp").submit();
		}
		
		var root = document.getElementById("root").value;
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
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					
					document.getElementById("empNo").value = data.empNo;
					document.getElementById("id1").value = data.id;
					document.getElementById("nm1").value = data.nm;
					document.getElementById("slr").value = data.slr;
					document.getElementById("retiredDt").value = data.retiredDt;
				}
			}
			empNo = document.getElementById("empNo").value;
			id = document.getElementById("id1").value;
			nm1 = document.getElementById("nm").value;
			slr = document.getElementById("slr").value;
			retiredDt = document.getElementById("retiredDt").value;
			
			
			var params = "empNo=" + empNo + "&";
			params += "retiredDt=" + retiredDt;
//			alert(empNo + id + nm + slr); 		
//			alert(params);	
			xhttp.open("POST", root + "/empRetire", true);
			/* post 사용시에 필수로필요한 Content-Type */
			xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			
			/* spring-security를 사용할 경우 해아할 setRequestHeader */
			/* xhttp.setRequestHeader(header, token); */
			xhttp.send(params);
		}
		
		/* 사용자 ID로 TB_USR 검색 */
		function searchUsr(root, id){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					alert(data);
					data = JSON.parse(data);
					document.getElementById("nm1").value = data.nm;
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
					document.getElementById("id1").value = data.id;
					document.getElementById("nm1").value = data.nm;
					document.getElementById("slr").value = inputNumberFormat(data.slr);
					document.getElementById("retiredDt").value = data.retiredDt;
					document.getElementById("empNo").readOnly = true;
					document.getElementById("nm1").readOnly = true;
				}
			}
			xhttp.open("GET", root + "/empSelect?empNo=" + empNo, true);
			xhttp.send();
		}
		