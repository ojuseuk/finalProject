/**
 * 교육과정 관리에 사용되는 javascript
 */

	var root = document.getElementById("root").value;
	var jsonList = document.getElementById("jsonList").value;
	console.log(jsonList);
	jsonList = JSON.parse(jsonList);
	var xhttp = new XMLHttpRequest();
										 
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

	function inputNumberFormat(slr) {
	    return String(slr).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	function courseUpdate(){
		/*document.getElementById("frmCrs").action = "/courseUpdate";*/
		document.getElementById("frmCrs").action = root + "/courseUpdate";
		document.getElementById("frmCrs").submit();		
	}
	
	
	/* 과정ID로 과정 조회 */
	function crsSelect(root, crsId){
		xhttp.onreadystatechange = function(){
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				data = xhttp.responseText;
				data = JSON.parse(data);
				console.log(data);
				document.getElementById("crsId").value = data.crsId;
				document.getElementById("crsNm").value = data.crsNm;
				document.getElementById("prd").value = data.prd;
				document.getElementById("stdtclssttn").value = inputNumberFormat(data.stdtclssttn);
				document.getElementById("dayClssTm").value = inputNumberFormat(data.dayClssTm); 
				document.getElementById("crsIntro").value = data.crsIntro;
				document.getElementById("sbjtNm").value = data.sbjtNm;
				
				if(data.crsTp == '종합'){
// 					$("#crsTp_1").prop("checked", true);
					document.getElementById("crsTp_1").checked = "checked";	
				} else {
					document.getElementById("crsTp_2").checked = "checked";
				}
				document.getElementById("crsId").readOnly = true;
			}
		}
		xhttp.open("GET", root + "/crsSelect?crsId=" + crsId, true);
		xhttp.send();
	}
	
	/* 과정 리스트 DataTable */
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
					"data" : "crsId",
					"searchable": false,
					"render" : function(data, type, row, meta){
						data = '<div align="center"><input type="button" class="w3-button w3-round-large w3-blue-grey w3-tiny" value="' + data + '" onclick="crsSelect(\''+ root + '\', \''+data+'\')"></div>';
					return data;
					}
				}, {
					"data" : "sbjtNm"
				}, {
					"data" : "crsNm"
				}, {
					"data" : "prd",
					"render" : function(data, type, row, meta){
						data = '<div align="center">' + data + '</div>';
						return data;
					}
				}, {
					"data" : "stdtclssttn",
					"render" : function(data){
						data = '<div align="right">' + data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '</div>';	
						return data;
					}
				}]
		});
	});

		function crsTpRadio(crsTp){
			if(crsTp == "종합"){
 				document.getElementById("sbjtNm").hidden = true;
				document.getElementById("sbjtNm").disabled = true;
 				document.getElementById("prd").hidden = true;
 				document.getElementById("prd").disabled = true;
 			}
			if(crsTp == "특강"){
				/* document.getElementById("sbjtNm").disabled = "disabled"; */
				document.getElementById("sbjtNm").hidden = false;
				document.getElementById("sbjtNm").disabled = false;
				document.getElementById("prd").hidden = false;
 				document.getElementById("prd").disabled = false;
			}
				
		}