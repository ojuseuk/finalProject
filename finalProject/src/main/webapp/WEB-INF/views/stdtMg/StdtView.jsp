<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${not empty crsList}" >
   <select name="crs" id="crs" onchange="reqCrsList(this.value,'${root}')">
   	  <option value="선 택">선 택</option>
      <c:forEach items="${crsList}" var="data">
         <option value="${data.crsId}">${data.crsNm}</option>
      </c:forEach>
   </select>
</c:if>
<select id="clss" onchange="reqClssList(this.value, '${root}')">
	<option>선 택</option>
</select>
<input id="searchNm" type="text" name="name" value="">
<input type="button" value="검색" onclick="searchNm('${root}')">
<table id="stdtList" border="0" cellpadding="5" cellspacing="2"
	width="50%" bordercolordark="white" bordercolorlight="black">
	<tr>
		<td></td>
		<td><p align="center">
				<b><span style="font-size: 12pt;">수강생 목록</span></b>
			</p></td>
		<td></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><p align="center">
				<font color="white"><b><span style="font-size: 12pt;">번 호</span></b></font>
			</p></td>
		<td bgcolor="#336699"><p align="center">
				<font color="white"><b><span style="font-size: 12pt;">이 름</span></b></font>
			</p></td>
		<td bgcolor="#336699"><p align="center">
				<font color="white"><b><span style="font-size: 12pt;">학 과</span></b></font>
			</p></td>
	</tr>
	
	<c:if test="${empty stdtAllList || fn:length(stdtAllList) == 0}">
		<tr>
	        <td colspan="5">
	            <p align="center"><b><span style="font-size:12pt;">등록된 수강생이 없습니다.</span></b></p>
	        </td>
	    </tr>
	</c:if>
	
	<c:forEach items="${requestScope.stdtAllList}" var="data">
		<tr>
			<td bgcolor=""><p align="center"><span style="font-size:12pt;">
					${data.stdtNo}</span></p></td>
			<td bgcolor=""><p align="center"><span style="font-size:12pt;"><a href="javascript:reqStdtInfo('${data.stdtNo}', '${root}');">
					${data.nm}</a></span></p></td>
			<td bgcolor=""><p align="center"><span style="font-size:12pt;">
					${data.mjrTp}</span></p></td>
		</tr>
	</c:forEach>
</table>
<div id="stdtInfo" style="font-size:12pt;">
</div>

<script type="text/javascript">
	var data;
	var clssData;
	var clssTag;
	var xhttp = new XMLHttpRequest();
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
		xhttp.open("GET", root + "/clss?crsId=" + crsId, true);
		xhttp.send();
	}
	
	function stdtListCrs(crsId, root) {
		var xhttp2 = new XMLHttpRequest();
		xhttp2.onreadystatechange = function() {
			if (xhttp2.readyState == 4 && xhttp2.status == 200) {
				var clssData5 = xhttp2.responseText;
				clssData5 = JSON.parse(clssData5);
				clssTag = '<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><td></td><td><p align="center"><b><span style="font-size: 12pt;">수강생 목록</span></b></p></td><td></td>	</tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">번 호</span></b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">이 름</span></b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">학 과</span></b></font></p>'
						+ '</td></tr>';
			}
			if (clssData5 == "") {
				clssTag += '<tr><td colspan="5"><p align="center"><b><span style="font-size:12pt;">등록된수강생이 없습니다.</span></b></p></td></tr>';
				document.getElementById("stdtList").innerHTML = clssTag;
				document.getElementById("stdtInfo").innerHTML = "";
			} else {
				for (i = 0; i < clssData5.length; i++) {
					clssTag += '<tr><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData5[i].stdtNo
							+ '</span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ '<a href= "javascript:reqStdtInfo(\'' + clssData5[i].stdtNo + '\',\'' + root + '\');">'
							+ clssData5[i].nm
							+ '</a></span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData5[i].mjrTp + '</span></p></td></tr>';
				}
				clssTag += '</table>';
				document.getElementById("stdtList").innerHTML = clssTag;
			}
		}
		xhttp2.open("GET", root + "/stdtListCrs?crsId=" + crsId,	true);
		xhttp2.send();
	}
	
	function reqClssList(clssNm, root) {
		var crsId = document.getElementById("crs").value;
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var clssData2 = xhttp.responseText;
				clssData2 = JSON.parse(clssData2);
				clssTag = '<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><td></td><td><p align="center"><b><span style="font-size: 12pt;">수강생 목록</span></b></p></td><td></td>	</tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">번 호</span></b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">이 름</span></b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">학 과</span></b></font></p>'
						+ '</td></tr>';
			}
			if (clssData2 == "") {
				clssTag += '<tr><td colspan="5"><p align="center"><b><span style="font-size:12pt;">등록된수강생이 없습니다.</span></b></p></td></tr>';
				document.getElementById("stdtList").innerHTML = clssTag;
				document.getElementById("stdtInfo").innerHTML = "";
			} else {
				for (i = 0; i < clssData2.length; i++) {
					clssTag += '<tr><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData2[i].stdtNo
							+ '</span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ '<a href= "javascript:reqStdtInfo(\'' + clssData2[i].stdtNo + '\',\'' + root + '\');">'
							+ clssData2[i].nm
							+ '</a></span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData2[i].mjrTp + '</span></p></td></tr>';
				}
				clssTag += '</table>';
				document.getElementById("stdtList").innerHTML = clssTag;
			}
		}
		xhttp.open("GET", root + "/stdtList?clssNm=" + clssNm + "&crsId=" + crsId, true);
		xhttp.send();
	}

	function reqStdtInfo(stdtNo, root) {
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssData3 = xhttp.responseText;
				clssData3 = JSON.parse(clssData3);
				for (i = 0; i < clssData3.length; i++) {
					clssTag = '<h3>' + clssData3[i].id + '<br>'
							+ clssData3[i].stdtNo + '<br>' 
							+ clssData3[i].nm + '<br>' 
							+ clssData3[i].addr + '<br>'
							+ clssData3[i].phone + '<br>' 
							+ clssData3[i].prntPhone + '<br>' 
							+ clssData3[i].email + '<br>'
							+ clssData3[i].clssNm + '<br>'
							+ clssData3[i].mjrTp + '<br>' 
							+ clssData3[i].retryCnt	+ '<br>' 
							+ clssData3[i].paidDt + '<br>'
							+ clssData3[i].repaidDt + '</h3>' + '<br>'
							+ '<input type="button" value="정보변경" onclick="updateStdt(\'' + stdtNo + '\',\'' + root + '\');">';
				}
			}
			document.getElementById("stdtInfo").innerHTML = clssTag;
		}
		xhttp.open("GET", root + "/stdtInfo?stdtNo=" + stdtNo, true);
		xhttp.send();
	}
	
	function updateStdt(stdtNo, root) {
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssData3 = xhttp.responseText;
				clssData3 = JSON.parse(clssData3);
				clssTag = '<form action="'+ root + '/updateStdt">';
				for (i = 0; i < clssData3.length; i++) {
					clssTag += clssData3[i].id + '<br>'
							+ clssData3[i].stdtNo + '<br>' 
							+ '<input type="hidden" name="stdtNo" value="'+ clssData3[i].stdtNo + '">'
							+ clssData3[i].nm + '<br>'
							+ clssData3[i].addr + '<br>'
							+ clssData3[i].phone + '<br>' 
							+ clssData3[i].prntPhone + '<br>'
							+ clssData3[i].email + '<br>'
							+ '<input type="text" name="clssId" value="' + clssData3[i].clssId + '">' + '<br>'
							+ clssData3[i].clssNm + '<br>' 
							+ clssData3[i].mjrTp + '<br>' 
							+ clssData3[i].retryCnt + '<br>'
							+ clssData3[i].paidDt + '<br>'
							+ clssData3[i].repaidDt + '</h3>' + '<br>'
							+ '<input type="submit" value="저장">' 
				}
					clssTag +='</form>';
			}
			document.getElementById("stdtInfo").innerHTML = clssTag;
		}
		xhttp.open("GET", root + "/stdtInfo?stdtNo=" + stdtNo, true);
		xhttp.send();
	}
	
	function searchNm(root) {
		var stdtNm = document.getElementById("searchNm").value;
		var clssNm = document.getElementById("clss").value;
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssTag = "";
				var clssData4 = xhttp.responseText;
				clssData4 = JSON.parse(clssData4);
				clssTag = '<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><td></td><td><p align="center"><b><span style="font-size: 12pt;">수강생 목록</span></b></p></td><td></td>	</tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">번 호</span></b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">이 름</span></b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b><span style="font-size:12pt;">학 과</span></b></font></p>'
						+ '</td></tr>';
				}
				if (clssData4 == "") {
					clssTag += '<tr><td colspan="5"><p align="center"><b><span style="font-size:12pt;">등록된수강생이 없습니다.</span></b></p></td></tr>';
					document.getElementById("stdtList").innerHTML = clssTag;
				} else {
					for (i = 0; i < clssData4.length; i++) {
					clssTag += '<tr><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData4[i].stdtNo
							+ '</span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ '<a href= "javascript:reqStdtInfo(\'' + clssData4[i].stdtNo + '\',\'' + root + '\');">'
							+ clssData4[i].nm
							+ '</a></span></p></td><td bgcolor=""><p align="center"><span style="font-size:12pt;">'
							+ clssData4[i].mjrTp + '</span></p></td></tr>';
					}
					clssTag += '</table>';
					document.getElementById("stdtList").innerHTML = clssTag;
					document.getElementById("stdtInfo").innerHTML = "";
				}
			}
			xhttp.open("GET", root + "/selectStdtNm?nm=" + stdtNm + "&clssNm=" + clssNm, true);
			xhttp.send();
		}
</script>



