<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>수강신청</title>
<c:if test="${not empty requestScope.sbjt}" >
   <select name="sbjt" id="sbjt" onchange="reqCrsList(this.value,'${root}')">
   		<option>과목선택</option>
   		<c:forEach items="${requestScope.sbjt}" var="data">
    		<option value="${data.sbjtNm}">${data.sbjtNm}</option>
   		</c:forEach>
   </select>
</c:if>

<div style="width:50%; height:500px; overflow:auto">
<c:if test="${not empty requestScope.crs}">
	<table id="crsList" border="0" cellpadding="5" cellspacing="2"
		width="100%" bordercolordark="white" bordercolorlight="black">
		<tr>
		<div width="100%" align="center">
			<td><p>
				<b><span style="font-size: 12pt;">과정 목록</span></b>
			</p></td>
		</div>
		</tr>
		<tr>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b><span style="font-size: 12pt;">과정명</span></b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b><span style="font-size: 12pt;">기	간</span></b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b><span style="font-size: 12pt;">수강료</span></b></font>
				</p></td>
		</tr>
		<c:forEach items="${requestScope.crs}" var="data">
			<tr>
				<td bgcolor="">
				<p align="center"><span style="font-size:12pt;">
				<a href="javascript:reqClssInfo('${data.crsId}', '${root}')">${data.crsNm}</a></span></p>
				</td>
				<td bgcolor="">
				<p align="center"><span style="font-size:12pt;">${data.prd}일</span></p>
				</td>
				<td bgcolor="">
				<p align="center"><span style="font-size:12pt;">${data.stdtclssttn}원</span></p>
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</div>
<div id="crsInfo" style="width:50%; height:200px; overflow:auto"></div>
<div id="clssList" style="width:50%; height:200px; overflow:auto"></div>
<div id="modal"></div>

<script type="text/javascript">
	var xhttp = new XMLHttpRequest();
	function reqCrsList(sbjtNm, root){
		var sbjtData;
		var sbjtTag = "";
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				sbjtData = xhttp.responseText;
				sbjtData = JSON.parse(sbjtData);
				sbjtTag = '<table id="clss" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black"><tr>'
						+ '<div width="100%" align="center"><td><p><b><span style="font-size: 12pt;">과정 목록</span></b></p></td></div></tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">과정명</span></b></font>	</p></td>'
						+ '<td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">기	간</span></b></font></p></td>'
						+ '<td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">수강료</span></b></font></p></td>';
			}
			if (sbjtData == ""){
				sbjtTag += '<tr><td colspan="5"><p align="center"><b><span style="font-size:12pt;">등록된 과정이 없습니다.</span></b></p></td></tr>';
				document.getElementById("crsList").innerHTML = sbjtTag;
				document.getElementById("clssList").innerHTML = "";
				document.getElementById("crsInfo").innerHTML = "";
			} else {
				for (i = 0; i < sbjtData.length; i++) {
					sbjtTag += '<tr><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ '<a href= "javascript:reqClssInfo(\'' + sbjtData[i].crsId + '\',\'' + root + '\');">'
							+ sbjtData[i].crsNm
							+ '</a></span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ sbjtData[i].prd + '일'
							+ '</span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ sbjtData[i].stdtclssttn + '원'
							+ '</span></p></td>'
				}
				sbjtTag += '</table>';
				document.getElementById("crsList").innerHTML = sbjtTag;
				document.getElementById("clssList").innerHTML = "";
				document.getElementById("crsInfo").innerHTML = "";
			}
		}
		xhttp.open("POST", root + "/selectCrsPerSbjt?sbjtNm=" + sbjtNm, true);
		xhttp.send();
	}
	
	function reqClssInfo(crsId, root){
		console.log(crsId);
		var clssData;
		var clssTag = "";
		var crsInfoTag = "";
		var clssInfoTag = "";
		var modal = "";
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssData = xhttp.responseText;
				clssData = JSON.parse(clssData);
				console.log(clssData);
				clssTag = '<table id="crsList" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black"><tr>'
						+ '<div width="100%" align="center"><td><p><b><span style="font-size: 12pt;">강좌 목록</span></b></p></td></div></tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">강좌명</span></b></font>	</p></td>'
						+ '<td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">강사명</span></b></font></p></td>'
						+ '<td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">모집인원</span></b></font></p></td>'
						+ '<td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">세부정보</span></b></font></p></td></tr>';
				
				crsInfoTag += '<table id="InfoCrs" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black"><tr>'
					       + '<div width="100%" align="center"><td><p><b><span style="font-size: 12pt;">과정 소개</span></b></p></td></div></tr>'
					       + '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">소개</span></b></font></p></td>'
					       + '<td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size: 12pt;">강사명</span></b></font></p></td></tr>';			
			}
			if (clssData == ""){
				clssData += '<tr><td colspan="5"><p align="center"><b><span style="font-size:12pt;">등록된 강좌가 없습니다.</span></b></p></td></tr>';
				crsInfoTag += '<tr><td colspan="5"><p align="center"><b><span style="font-size:12pt;">등록된 강좌가 없습니다.</span></b></p></td></tr>';
				document.getElementById("clssList").innerHTML = clssTag;
				document.getElementById("crsInfo").innerHTML = crsInfoTag;
			} else {
				for (i = 0; i < clssData.length; i++) {
					crsInfoTag += '<tr><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							   + clssData[i].crsIntro
						       + '</span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							   + clssData[i].nm
							   + '</span></p></td>';
					clssTag += '<tr><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData[i].clssNm
							+ '</span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData[i].nm
							+ '</span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData[i].capa
							+ '</span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ '<div class="w3-container">'
							+ '<button onclick="document.getElementById(\'id'+i+'\').style.display=\'block\'\">세부정보'
							+ '</button></div></span></p></td></tr>';
					modal += '<div id="id' + i + '" class="w3-modal">' 
						  + '<div class="w3-modal-content">'
						  + '<div class="w3-container">'
						  + '<span onclick="document.getElementById(\'id' + i + '\').style.display=\'none\'" class="w3-button w3-display-topright">&times;</span>'
						  + '<p id="clssInfo">'
						  + clssData[i].nm + '<br>' + clssData[i].tchrPt + '<br>' + clssData[i].tchrIntro + '<br>'
						  + clssData[i].strtDt + '~' + clssData[i].endDt + '<br>' + clssData[i].strtTm + '~'
						  + clssData[i].endTm + '<br>' + clssData[i].clssroom
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
	

</script>