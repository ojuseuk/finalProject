/**
 * 강사 관리 화면에서 사용하는 javascript
 */
		var xhttp = new XMLHttpRequest();
		var xhttp2 = new XMLHttpRequest();
		var xhttp3 = new XMLHttpRequest();
		var data;
		resultMsg = document.getElementById("resultMsg").value;
		if(resultMsg != ""){
			alert(resultMsg);
		}
		
		var root = document.getElementById("root").value;
		var jsonList = document.getElementById("jsonList").value;
		console.log(jsonList);
		jsonList = JSON.parse(jsonList);

		/* dataTable 처리 */
		$(document).ready(function(){
			$('#dataTable').DataTable({
				"language": {
					    search: "검색 : " 
				},
				"scrollY" : 400,
				"scrollCollapse" : true,
				data : jsonList,
				columns : [ {
					"data" : "id",
					"searchable": false
					}, {
						"data" : "empNo",
						"searchable": false
					}, {
						"data" : "tchrNo",
						"render" : function(data, type, row, meta){
							data = '<div align="center"><input type="button" value="' + data + '" onclick="tchrSelect(\''+root+'\', \''+data+'\')"></div>';
							return data;
						}
					}, {
						"data" : "sbjtChrg"
					}, {
						"data" : "nm"
					}]
			});
		});
		
		
		/* 강사번호로 TB_TCHR 업데이트 */
		function tchrUpdate(){
			document.getElementById("frmTchr").action = root + "/tchrUpdate";
			document.getElementById("frmTchr").submit();
		}
		
 		function inputNumberFormat(slr) {
		    return String(slr).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
 		

		/* 강사번호로 TB_TCHR 검색 */
		function tchrSelect(root, tchrNo){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("tchrNo").value = data.tchrNo;
					document.getElementById("empNo").value = data.empNo;
					document.getElementById("id2").value = data.id;
					document.getElementById("nm2").value = data.nm;
					console.log(data.nm);
 					document.getElementById("slr").value = inputNumberFormat(data.slr); 
					document.getElementById("sbjtChrg").value = data.sbjtChrg;
					document.getElementById("tchrIntro").value = data.tchrIntro;
					
					tag = '<img src="' + root + '/imgs/img/';
					tag += data.tchrPt + '" style="width:150px;height:150px;">';
					
					console.log(tag);
					document.getElementById("tchrPhoto").innerHTML = tag;
					
					
					document.getElementById("empNo").readOnly = true;
					document.getElementById("nm2").readOnly = true;
					document.getElementById("slr").readOnly = true;
				}
			}
			xhttp.open("GET", root + "/tchrSelect?tchrNo=" + tchrNo, true);
			xhttp.send();
		}
		
		/* 사용자 ID로 TB_USR 검색 */
		function searchUsr(root, id){
			console.log(root, id);
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("nm2").value = data.nm;
				}
			}
			xhttp.open("GET", root + "/usrSearch?id=" + id, true);
			xhttp.send();
		}
		
		/* 사용자 ID로 TB_EMP 검색 */
 		function searchEmpById(root,id){
			console.log(root,id);
			
			xhttp2.onreadystatechange = function(){
				if (xhttp2.readyState == 4 && xhttp2.status == 200) {
					data = xhttp2.responseText;
					data = JSON.parse(data);
					document.getElementById("empNo").value = data.empNo;
					document.getElementById("slr").value = data.slr;
				}
			}
			xhttp2.open("GET", root + "/empSearchById?id=" + id, true);
			xhttp2.send();
		}
		
		/* 사용자 ID로 TB_TCHR 검색 */
 		function searchTchrById(root,id){
			console.log(root,id);
			
			xhttp3.onreadystatechange = function(){
				if (xhttp3.readyState == 4 && xhttp3.status == 200) {
					data = xhttp3.responseText;
					data = JSON.parse(data);
					document.getElementById("tchrNo").value = data.tchrNo;
				}
			}
			xhttp3.open("GET", root + "/tchrSearchById?id=" + id, true);
			xhttp3.send();
		}
		
	