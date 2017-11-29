	var data;
	var clssData;
	var clssTag;
	var xhttp = new XMLHttpRequest();
	
// 전체 수강생
	var allList = $("#json").val();
	var root = $("#root").val();
	allList = JSON.parse(allList);
	console.log(allList);
	$('#dataTable').DataTable({
		"scrollY" : 500,
		"scrollCollapse" : true,
		data : allList,
		columns : [ {
			"data" : "stdtNo"
		}, {
			"data" : "nm",
			//아래 링크 걸어서 사용 아니면 onclick
			"render" : function(data, type, row, meta){
				data = '<a href="'+ root +'/stdtInfo?stdtNo=' + row.stdtNo + '">' 
					 + row.nm + '</a>';
				return data;
			}
		}, {
			"data" : "mjrTp"
		} ]
	});
	
// 	아이디조회
	$(document).ready(function(){
		$("#selectId").click(function(){
			var id = $("#stdtId").val();
			$.post({
				url : root + "/selectStdtId",
				data : $("#stdtId").serialize(),
				beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success : function(id){
					if(id == ''){
						document.getElementById("selectResult").innerHTML = "회원이 아닙니다";
					} else {
						document.getElementById("selectResult").innerHTML = "회원입니다";
					}
				},
				error : function(){
					document.getElementById("selectResult").innerHTML = "조회에 실패했습니다";
				}
			});
		});
	});
	
	
// 	강좌목록
	function reqCrsList(crsId, root) {
		stdtListCrs(crsId, root);
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssTag = '<option>선 택</option>';
				clssData = xhttp.responseText;
				clssData = JSON.parse(clssData);
				
				for (i = 0; i < clssData.length; i++) {
					clssTag += '<option value="' + clssData[i].clssNm + '">' + clssData[i].clssNm + '</option>';
				}
				document.getElementById("clss").innerHTML = clssTag;
				document.getElementById("stdtInfo").innerHTML = "";
			}
		}
		xhttp.open("POST", root + "/clssList", true);
		xhttp.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("crsId=" + crsId);
	}
	
// 	과정별 수강생목록
	function stdtListCrs(crsId, root) {
	$('#dataTable').dataTable().fnDestroy();
		var xhttp2 = new XMLHttpRequest();
		xhttp2.onreadystatechange = function() {
			if (xhttp2.readyState == 4 && xhttp2.status == 200) {
				var stdtList = xhttp2.responseText;
				stdtList = JSON.parse(stdtList);
				$('#dataTable').DataTable({
					"scrollCollapse" : true,
					data : stdtList,
					columns : [ {
						"data" : "stdtNo"
					}, {
						"data" : "nm",
						//아래 링크 걸어서 사용 아니면 onclick
						"render" : function(data, type, row, meta){
							data = '<a href="'+ root +'/stdtInfo?stdtNo=' + row.stdtNo + '">' 
							 	 + row.nm + '</a>';
							return data;
						}
					}, {
						"data" : "mjrTp"
					} ]
				});
			}
		}
		xhttp2.open("POST", root + "/stdtListCrs",	true);
		xhttp2.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		xhttp2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp2.send("crsId=" + crsId);
	}
	
// 	강좌별 수강생목록
	function reqClssList(clssNm, root) {
		$('#dataTable').dataTable().fnDestroy();
		var crsId = document.getElementById("crs").value;
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var stdtList = xhttp.responseText;
				stdtList = JSON.parse(stdtList);
				$('#dataTable').DataTable({
					"scrollY" : 500,
					"scrollCollapse" : true,
					data : stdtList,
					columns : [ {
						"data" : "stdtNo"
					}, {
						"data" : "nm",
						//아래 링크 걸어서 사용 아니면 onclick
						"render" : function(data, type, row, meta){
							data = '<a href="'+ root +'/stdtInfo?stdtNo=' + row.stdtNo + '">' 
								 + row.nm + '</a>';
							return data;
						}
					}, {
						"data" : "mjrTp"
					} ]
				});
			}
		}
		xhttp.open("POST", root + "/stdtList", true);
		xhttp.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("clssNm=" + clssNm + "&crsId=" + crsId);
	}
	