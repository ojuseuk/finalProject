<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>수강신청</title>
<div>
<c:if test="${not empty requestScope.sbjt}" >
   <select name="sbjt" id="sbjt" onchange="reqCrsList(this.value,'${root}')">
   		<option>과목선택</option>
   		<c:forEach items="${requestScope.sbjt}" var="data">
    		<option value="${data.sbjtNm}">${data.sbjtNm}</option>
   		</c:forEach>
   </select>
</c:if>
</div>

<div style="width:50%; height:600px; overflow:auto; float:left;">
<c:if test="${not empty requestScope.crs}">
	<table id="crsList" border="0" cellpadding="5" cellspacing="2"
		width="100%" bordercolordark="white" bordercolorlight="black">
		<tr>
		<div width="100%" align="center">
			<td><p>
				<b>과정 목록</b>
			</p></td>
		</div>
		</tr>
		<tr>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>과정명</b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>기 간</b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>수강료</b></font>
				</p></td>
		</tr>
		<c:forEach items="${requestScope.crs}" var="data">
			<tr>
				<td bgcolor="">
				<p align="center">
				<a href="javascript:reqClssInfo('${data.crsId}', '${root}')">${data.crsNm}</a></p>
				</td>
				<td bgcolor="">
				<p align="center">${data.prd}일</p>
				</td>
				<td bgcolor="">
				<p align="center">${data.stdtclssttn}원</p>
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</div>
<div id="crsInfo" style="width:50%; height:200px; overflow:auto">
	<table id="InfoCrs" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
	<tr>
		<div width="100%" align="center"><td><p><b>과정 소개</b></p></td></div>
	</tr>
	<tr>
		<td bgcolor="#336699"><p align="center"><font color="white"><b>소개</b></font></p></td>
	</tr>
	<tr>
		<td><p>과정을 선택하세요</p></td>
	</tr>
	</table>
</div>
<div id="clssList" style="width:50%; height:400px; overflow:auto">
	<table border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
	<div width="100%">
		<tr>
			<td><p><b>강좌 목록</b></p></td>
		</tr>
	</div>
		<tr>
			<td bgcolor="#336699"><p align="center"><font color="white">강좌명</font></p></td>
			<td bgcolor="#336699"><p align="center"><font color="white">강사명</font></p></td>
			<td bgcolor="#336699"><p align="center"><font color="white">모집인원</font></p></td>
			<td bgcolor="#336699"><p align="center"><font color="white">상세정보</font></p></td>
		</tr>
	<tr>
		<td><p>과정을 선택하세요</p></td>
	</tr>
	</table>
</div>
<div>
	<form name="reqapplyClss" action="${root}/applyClss" method="POST">
	<p align="right">
		<input type="hidden" name="clssList" value="">
		<input id="saveClss" type="button" value="강좌담기">
		<input id="appClss" type="button" value="수강신청" onclick="sendClssList('${root}')">
	</p>
	</form>
</div>
<div id="modal"></div>
<div id="as"></div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	var clssData;
	var clssInfoObj;
	var xhttp = new XMLHttpRequest();
	
	function deleClss(root){
		$(document).on("click", "#delCheck", function(){
			$(".appClssList input:checked").each(function(){
				console.log($(this).parent().children("#delCheck").val);
			});
		});
	}
	
	function sendClssList(root){
		var clssArr = new Array();
		for (i = 0; i < sessionStorage.length; i++) {
			clssArr[i] = sessionStorage.getItem(sessionStorage.key(i));
// 			clssArr[i] = JSON.parse(clssArr[i]);
// 			console.log(clssArr[i]);
		}
// 		document.reqapplyClss.clssList.value = clssArr;
		console.log(clssArr);
// 		console.log(clssInfoObj);
// 		console.log(JSON.stringify(clssArr));
// 		document.reqapplyClss.submit();
		$.post({
			url : root + "/applyClss",
			data : JSON.stringify(clssArr),
			contentType : "application/json; charset=UTF-8",
			success : function(clssArr){
				console.log("suc");
				document.getElementById("as").innerHTML = clssArr;
			},
			error : function(){
				console.log("fail");
			}
		});
	}
	
	function reqCrsList(sbjtNm, root){
		var sbjtData;
		var sbjtTag = "";
		var crsInfoTag = "";
		var clssList = "";
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				sbjtData = xhttp.responseText;
				sbjtData = JSON.parse(sbjtData);
				sbjtTag = '<table id="clss" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><div width="100%" align="center">'
						+ '<td><p><b>과정 목록</b></p></td></div></tr>'
						+ '<tr><td bgcolor="#336699"><p align="center">'
						+ '<font color="white"><b>과정명</b></font></p></td>'
						+ '<td bgcolor="#336699"><p align="center">'
						+ '<font color="white"><b>기	간</b></font></p></td>'
						+ '<td bgcolor="#336699"><p align="center">'
						+ '<font color="white"><b>수강료</b></font></p></td>';
				
				crsInfoTag = '<div id="crsInfo" style="width:100%; height:200px; overflow:auto">'
			    		   + '<table id="InfoCrs" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						   + '<tr><div width="100%" align="center"><td><p><b>과정 소개</b></p></td></div></tr>'
						   + '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b>소개</b></font></p></td></tr>'
						   + '<tr><td><p>과정을 선택하세요</p></td></tr></table></div>';
						   
				clssList = '<div id="clssList" style="width:100%; height:400px; overflow:auto">'
					     + '<table border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						 + '<div width="100%"><tr><td><p><b>강좌 목록</b></p></td></tr></div>'
						 + '<tr><td bgcolor="#336699"><p align="center"><font color="white">강좌명</font></p></td>'
						 + '<td bgcolor="#336699"><p align="center"><font color="white">강사명</font></p></td>'
						 + '<td bgcolor="#336699"><p align="center"><font color="white">모집인원</font></p></td>'
						 + '<td bgcolor="#336699"><p align="center"><font color="white">상세정보</font></p></td></tr>'
						 + '<tr><td><p>과정을 선택하세요</p></td></tr></table></div>'
						
			}
			if (sbjtData == ""){
				sbjtTag += '<tr><td colspan="5"><p align="center"><b>등록된 과정이 없습니다.</b></p></td></tr>';
				crsInfoTag += '<tr><td colspan="5"><p align="center"><b>등록된 과정이 없습니다.</b></p></td></tr>';
				clssList += '<tr><td colspan="5"><p align="center"><b>등록된 과정이 없습니다.</b></p></td></tr>';
				document.getElementById("crsList").innerHTML = sbjtTag;
				document.getElementById("clssList").innerHTML = clssList;
				document.getElementById("crsInfo").innerHTML = crsInfoTag;
			} else {
				for (i = 0; i < sbjtData.length; i++) {
					sbjtTag += '<tr><td bgcolor=""><p align="center">'
							+ '<a href= "javascript:reqClssInfo(\'' 
							+ sbjtData[i].crsId 
							+ '\',\'' 
							+ root 
							+ '\');">'
							+ sbjtData[i].crsNm
							+ '</a></span></p></td><td bgcolor=""><p align="center">'
							+ sbjtData[i].prd 
							+ '일'
							+ '</p></td><td bgcolor=""><p align="center">'
							+ sbjtData[i].stdtclssttn 
							+ '원'
							+ '</p></td>'
				}
				sbjtTag += '</table>';
				document.getElementById("crsList").innerHTML = sbjtTag;
				document.getElementById("clssList").innerHTML = clssList;
				document.getElementById("crsInfo").innerHTML = crsInfoTag;
			}
		}
		xhttp.open("POST", root + "/selectCrsPerSbjt?sbjtNm=" + sbjtNm, true);
		xhttp.send();
	}
	
	function reqClssInfo(crsId, root){
		
		var clssTag = "";
		var crsInfoTag = "";
		var clssInfoTag = "";
		var modal = "";
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssData = xhttp.responseText;
				clssData = JSON.parse(clssData);
				console.log(clssData);
				clssTag = '<table class="checking" id="crsList" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><div width="100%" align="center"><td><p><b><span style="font-size: 12pt;">강좌 목록</span></b></p></td></div></tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">강좌명</span></b></font>	</p></td>'
						+ '<td bgcolor="#336699"><p align="center"><font color="white"><b>강사명</b></font></p></td>'
						+ '<td bgcolor="#336699"><p align="center"><font color="white"><b>모집인원</b></font></p></td>'
						+ '<td bgcolor="#336699"><p align="center"><font color="white"><b>상세정보</b></font></p></td></tr>';

				crsInfoTag = '<table id="InfoCrs" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black"><tr>'
					       + '<div width="100%" align="center"><td><p><b>과정 소개</b></p></td></div></tr>'
					       + '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b>소 개</b></font></p></td></tr>';
			}
			if (clssData == ""){
				crsInfoTag += '<tr><td>등록된 강좌가 없습니다.</td></tr>';
				clssTag += '<tr><td>등록된 강좌가 없습니다.</td></tr>';
				document.getElementById("clssList").innerHTML = clssTag;
				document.getElementById("crsInfo").innerHTML = crsInfoTag;
			} else {
				for (i = 0; i < clssData.length; i++) {
					crsInfoTag += '<tr><td><p align="center">'
							   + clssData[i].crsIntro
						       + '</p></td>';
					clssTag += '<tr><td><p align="center">'
							+ '<input id="clssNm" type="checkbox" name="clssNm'+i+'" value="' + clssData[i].clssNm + '">'
							+ '<input id="clssId" type="hidden" name="clssId'+i+'" value="' + clssData[i].clssId + '">'
							+ '<input id="nm" type="hidden" name="nm'+i+'" value="' + clssData[i].nm + '">'
							+ '<input id="strtDt" type="hidden" name="strtDt'+i+'" value="' + clssData[i].strtDt + '">'
							+ '<input id="endDt" type="hidden" name="endDt'+i+'" value="' + clssData[i].endDt + '">'
							+ '<input id="stdtclssttn" type="hidden" name="stdtclssttn'+i+'" value="' + clssData[i].stdtclssttn + '">'
							+ clssData[i].clssNm
							+ '</p></td><td><p align="center">'
							+ clssData[i].nm
							+ '</p></td><td bgcolor=""><p align="center">'
							+ clssData[i].capa
							+ '</p></td><td bgcolor=""><p align="center">'
							+ '<div class="w3-container">'
							+ '<input type="button" value="상세정보" onclick="document.getElementById(\'id' + i + '\').style.display=\'block\'\">'
							+ '</input></div></p></td></tr>';
					
					modal += '<div id="id' + i + '" class="w3-modal">' 
						  + '<div class="w3-modal-content">'
						  + '<div class="w3-container">'
						  + '<span onclick="document.getElementById(\'id' + i + '\').style.display=\'none\'" class="w3-button w3-display-topright">&times;</span>'
						  + '<p id="clssInfo">'
						  + clssData[i].nm + '<br>' 
						  + clssData[i].tchrPt + '<br>' 
						  + clssData[i].tchrIntro + '<br>'
						  + clssData[i].strtDt + '~' + clssData[i].endDt + '<br>' 
						  + clssData[i].strtTm + '~' + clssData[i].endTm + '<br>' 
						  + clssData[i].clssroom
						  +'</p></div></div></div>';
				}
				clssTag += '</table>';
				crsInfoTag += '</table>';
				document.getElementById("clssList").innerHTML = clssTag;
				document.getElementById("crsInfo").innerHTML = crsInfoTag;
				document.getElementById("modal").innerHTML = modal;
			}
		}
		xhttp.open("POST", root + "/selectClssPerCrs?crsId=" + crsId, true);
		xhttp.send();
	}
	
	
	$(document).on("click", "#clssNm", function(){
			var clssInfoStr = new Array();
				$(".checking input:checked").each(function() {
					var i = 0;
					if(i%2==0){
						clssInfoObj = {
								clssNm : $(this).parent().children("#clssNm").val(),
								clssId : $(this).parent().children("#clssId").val(),
								nm : $(this).parent().children("#nm").val(),
								strtDt : $(this).parent().children("#strtDt").val(),
								endDt : $(this).parent().children("#endDt").val(),
								stdtclssttn : $(this).parent().children("#stdtclssttn").val()
						};
						clssInfoStr.push(JSON.stringify(clssInfoObj));
					}
				
				});
				
				$("#saveClss").on("click", function(){
						sessionStorage.setItem($("#clssNm").parent().children("#clssId").val(), clssInfoStr);
						alert("강좌가 담겼습니다.");
				});
	});
	

	
</script>

