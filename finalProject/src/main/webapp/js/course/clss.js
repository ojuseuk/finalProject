/**
 *  강좌 관리
 */

		var xhttp = new XMLHttpRequest();
		var xhttp2 = new XMLHttpRequest();
		var data;
		var header = document.querySelector('meta[id="_csrf_header"]').getAttribute('content');
		var token = document.querySelector('meta[id="_csrf"]').getAttribute('content');
		var data2;
		var root = document.getElementById("root").value;
		var jsonList = document.getElementById("jsonList").value;
		jsonList = JSON.parse(jsonList);
		
		resultMsg = document.getElementById("resultMsg").value;
		if(resultMsg != ""){
			alert(resultMsg);
		}
		
		/* 화면 초기화 */
		$(document).ready(function() {
            $('#btnClear').click(function() {
                location.reload();
            });
        });

		
		/* 강좌 리스트 DataTable 채우기*/
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
						"data" : "clssId",
						"searchable": false,
						"render" : function(data, type, row, meta){

							data  = '<div align="center"><input class="w3-button w3-round-large w3-blue-grey w3-tiny" type="button" value="' + data + '" onclick="clssSelect(\''+ root + '\', \''+data+'\')"></div>'
							return data;
						}
					}, {
						"data" : "sbjtNm"
					}, {
						"data" : "crsNm"
					}, {
						"data" : "clssNm"
					}, {
						"data" : "strtDt"
					}, {
						"data" : "capa",
						"render" : function(data){
							data = '<div align="right">' + data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '</div>';	
							return data;
						}
					}, {
						"data" : "clssroom"
					}]
			});
		});
		
		/* 강좌 수정 */
		function clssUpdate(){
			document.getElementById("frmClss").action = root + "/clssUpdate";
			document.getElementById("frmClss").submit();
		}


		/* 강사 배정 */
		function assgnTchr(root){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					jsonListTchr = xhttp.responseText;
					jsonListTchr = JSON.parse(jsonListTchr);
					
					$('#dtTchr').dataTable().fnDestroy();
					/* 강사 리스트 DataTable 채우기*/
		 			$('#dtTchr').DataTable({
		 				"language": {
		 					    search: "검색 : " ,
		 			            "thousands": ","
		 				},
		 				"scrollY" : 330,
		 				"scrollCollapse" : true,
		 				data : jsonListTchr,
		 				columns : [ {
	 						"data" : "tchrNo",
	 						"searchable": false,
							"render" : function(data, type, row, meta){
								data  = '<div align="center"><input class="w3-button w3-round-large w3-blue-grey w3-tiny" type="button" value="' + data + '" onclick="tchrSelect(\''+ root + '\', \''+data+'\')"></div>'
								return data;
							}
	 					}, {
	 						"data" : "nm"
	 					}, {
	 						"data" : "sbjtChrg"
	 					}]
		 			});		
				}
			}
			
			tchrNo = document.getElementById("tchrNo").value;
			clssId = document.getElementById("clssId").value;
			/* chrg = document.getElementById("chrg").value; */
			slr = document.getElementById("slr").value;
			
			params  = "tchrNo=" + tchrNo + "&";
			params += "clssId=" + clssId + "&";
			/* params += "chrg=" + chrg + "&"; */
			params += "slr=" + slr ;
			
			xhttp.open("POST", root + "/assgnTchr", true);
			/* post 사용시에 필수로필요한 Content-Type */
			xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			
			/* spring-security를 사용할 경우 해아할 setRequestHeader */
			xhttp.setRequestHeader(header, token);
			xhttp.send(params);
		}
		
		function tchrClose(){
			document.getElementById("fsTchr").hidden = true;
		}
		
		function tchrShow(){
			document.getElementById("fsTchr").hidden = false;
		}
		
		
		
		/* 강사번호로 TB_TCHR 검색 */
		function tchrSelect(root, tchrNo){
			
			/*강사 배정 현황 초기화*/
//			tchrSelectBySbjtNm(root, sbjtNm);
//			document.getElementById("slr").value = "";
//			document.getElementById("tchrIntro").value = "";
//			$("#imgTchr").remove();
			
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					console.log("여기다!!!!" + data.nm);
					
					tag = '<option value="' + data.tchrNo + '">' + data.nm + '</option>';
					document.getElementById("tchrNo").innerHTML = tag;
					document.getElementById("tchrIntro").value = data.tchrIntro;
					document.getElementById("slr").value = data.slr;
					tag = '<img src="' + root + '/imgs/img/';
					tag += data.tchrPt + '" style="width:150px;height:150px;">';
					
					console.log(tag);
					document.getElementById("tchrPhoto").innerHTML = tag;
				}
			}
			xhttp.open("GET", root + "/tchrSelect?tchrNo=" + tchrNo, true);
			xhttp.send();
		}
		
		/* 특정 과정의 강좌 리스트 조회 */
		function clssSelectByCourse(root, crsId){
			document.getElementById("frmClss").action = root + "/clssSelectByCourse";
			document.getElementById("frmClss").submit();
		}
		
		/* 강좌ID로 강사 배정 조회. 리스트에서 특정 강좌 선택 시 */
		function tchrAssnSelect(root, clssId, sbjtNm){
			xhttp2.onreadystatechange = function(){
				console.log(xhttp2.readyState);
				console.log(xhttp2.status);
				if (xhttp2.readyState == 4 && xhttp2.status == 200) {
					var data2 = xhttp2.responseText;
					console.log("xhttp2.responseText : " + xhttp2.responseText);
					console.log("data2.length : " + data2.length);
					data2 = JSON.parse(data2);
					console.log("data2.length 파싱 후 : " + data2.length);
					$('#dtTchr').dataTable().fnDestroy();
					
					/*강사 배정 현황 초기화*/
					tchrSelectBySbjtNm(root, sbjtNm);
					document.getElementById("slr").value = "";
					document.getElementById("tchrIntro").value = "";
					$("#imgTchr").remove();
					
					if(data2.length == 1 ){								/* 강사가 배정된 경우 */
						if(sbjtNm != '전과목'){							/*종합반의 경우*/
							console.log("parsing 후 data2 : " + data2[0]);
							document.getElementById("slr").value = data2[0].slr;
							document.getElementById("tchrIntro").value = data2[0].tchrIntro;
							
							tag = '<option value="' + data2[0].tchrNo + '">' + data2[0].nm + '</option>';
							document.getElementById("tchrNo").innerHTML = tag;
							tag = '<img id="imgTchr" src="' + root + '/imgs/img/';
							tag += data2[0].tchrPt + '" style="width:150px;height:150px;">';
							document.getElementById("tchrPhoto").innerHTML = tag;
						}
					}


					/* 강사 리스트 DataTable 채우기*/
		 			$('#dtTchr').DataTable({
		 				"language": {
		 					    search: "검색 : " ,
		 			            "thousands": ","
		 				},
		 				"scrollY" : 330,
		 				"scrollCollapse" : true,
		 				data : data2,
		 				columns : [ {
		 						"data" : "tchrNo",
		 						"searchable": false,
								"render" : function(data, type, row, meta){
									data  = '<div align="center"><input class="w3-button w3-round-large w3-blue-grey w3-tiny" type="button" value="' + data + '" onclick="tchrSelect(\''+ root + '\', \''+data+'\')"></div>'
									return data;
								}
		 					}, {
		 						"data" : "nm"
		 					}, {
		 						"data" : "sbjtChrg"
		 					}]
		 			});		
				}
			}
			xhttp2.open("GET", root + "/tchrAssnSelect?clssId=" + clssId, true);
			xhttp2.send();
		}
		
		/* 강좌ID로 강좌 조회 */
		function clssSelect(root, clssId){

			
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("sbjtNm").value = data.sbjtNm;
					document.getElementById("crsId").value = data.crsId;
					document.getElementById("clssId").value = data.clssId;
					document.getElementById("clssNm").value = data.clssNm;
					document.getElementById("strtDt").value = data.strtDt;
					document.getElementById("endDt").value = data.endDt;
					document.getElementById("strtTm").value = data.strtTm;
					document.getElementById("endTm").value = data.endTm;
					document.getElementById("capa").value = data.capa;
					document.getElementById("clssroom").value = data.clssroom;
					
					tag = '<option value="' + data.crsId + '">' + data.crsNm + '</option>';
					document.getElementById("crsId").innerHTML = tag;
					
					tchrAssnSelect(root, data.clssId, data.sbjtNm);			// clss List가 조회되고 난 후 강사배정 조회
					
				}
			}
			xhttp.open("GET", root + "/clssSelect?clssId=" + clssId, true);
			xhttp.send();
		}
		
		/* 과목명으로 강사 리스트 조회 */
		function tchrSelectBySbjtNm(root, sbjtNm){
			xhttp2.onreadystatechange = function(){
				if (xhttp2.readyState == 4 && xhttp2.status == 200) {
					data2 = xhttp2.responseText;
					data2 = JSON.parse(data2);
					var tag = '<option>강사 선택</option>';
					for (var i = 0; i < data2.length; i++) {
						tag += '<option value="' + data2[i].tchrNo + '">' + data2[i].nm + '</option>';
					}
					
					document.getElementById("tchrNo").innerHTML = tag;
				}
			}							
			xhttp2.open("GET", root + "/tchrSelectBySbjtNm?sbjtNm=" + sbjtNm, true);
			xhttp2.send();
		}
		
		/* 과목명으로 과정 리스트 조회 */
		function crsSelect(root, sbjtNm){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					var tag = '<option>과정 선택</option>';
					for (var i = 0; i < data.length; i++) {
						tag += '<option value="' + data[i].crsId + '">' + data[i].crsNm + '</option>';
					}
					
					document.getElementById("crsId").innerHTML = tag;
				}
			}
			xhttp.open("GET", root + "/crsSelectBySbjtNm?sbjtNm=" + sbjtNm, true);
			xhttp.send();
		}