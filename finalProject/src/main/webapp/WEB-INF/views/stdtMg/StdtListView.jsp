<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- *학생 중복 출력 수정, 업데이트 시 종합반만 변경 가능하게 수정, 중복코드 정리, 변수 정리, 스크롤 -->
<title>학생정보</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<div>
	<c:if test="${not empty crsList}">
		<select name="crs" id="crs"
			onchange="reqCrsList(this.value,'${root}')">
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
</div>

<div style="width:50%; height:400px; overflow:auto; float:left;">
	<table id="stdtList" border="0" cellpadding="5" cellspacing="2"
		width="100%" bordercolordark="white" bordercolorlight="black">
		<tr>
			<td></td>
			<td><p align="center">
					<b>수강생 목록</b>
				</p></td>
			<td></td>
		</tr>
		<tr>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>번	호</b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>이	름</b></font>
				</p></td>
			<td bgcolor="#336699"><p align="center">
					<font color="white"><b>학	과</b></font>
			</p></td>
		</tr>

		<c:if test="${empty stdtAllList || fn:length(stdtAllList) == 0}">
			<tr>
				<td colspan="5">
					<p align="center">
						<b>등록된 수강생이 없습니다.</b>
					</p>
				</td>
			</tr>
		</c:if>

		<c:forEach items="${requestScope.stdtAllList}" var="data">
			<tr>
				<td bgcolor=""><p align="center">
						 ${data.stdtNo}
				</p></td>
				<td bgcolor=""><p align="center">
						<a href="javascript:reqStdtInfo('${data.stdtNo}', '${root}');">${data.nm}</a>
				</p></td>
				<td bgcolor=""><p align="center">
						 ${data.mjrTp}
				</p></td>
			</tr>
		</c:forEach>
	</table>
</div>
<div style="width:50%; height:400px; overflow:auto; float:left;">
	<form action="${root}/insertStdt">
		<table id="inStdt" border="0" cellpadding="5" cellspacing="2" width="100%"
			bordercolordark="white" bordercolorlight="black">
			<tr>
				<td></td>
				<td><p align="left">
					<b>수강생 등록</b>
				</p></td>
				<td></td>
			</tr>
			<tr>
				<td bgcolor="#336699"><font color="white"><b>아이디</b></font></td>
				<td><input id="stdtId" type="text" name="id" value="" placeholder="ID검색"><input id="selectId" type="button" value="조회"></td>
			</tr>
			<tr>
				<td bgcolor="#336699"><font color="white"><b>수강생번호</b></font></td>
				<td><input type="text" name="stdtNo" value="${stdtNo}"></td>
			</tr>
			<tr>
				<td bgcolor="#336699"><font color="white"><b>학과</b></font></td>
				<td><select id="mjrTp" name="mjrTp">
					<option value="mj001">문 과</option>
					<option value="mj002">이 과</option>
					<option value="mj003">예체능</option>
				</select>
				</td>
			</tr>
			<tr>
				<td bgcolor="#336699"><font color="white"><b>강좌</b></font></td>
				<td><select id="geClss" name="clssId">
					<option value="clss5">종합반A</option>
					<option value="clss2">종합반B</option>
					<option value="clss6">종합반C</option>
				</select>
				</td>
			</tr>
			<tr>
				<td bgcolor="#336699"><font color="white"><b>대입응시회수</b></font></td>
				<td><input type="number" name="retryCnt"></td>
			</tr>
			<tr>
				<td bgcolor="#336699"><font color="white"><b>부모님 연락처</b></font></td>
				<td><input type="text" name="prntPhone"></td>
			</tr>
			<tr>
				<td bgcolor="#336699"><font color="white"><b>등록일</b></font></td>
				<td><input type="date" name="paidDt" id="regDate"></td>
			</tr>
			<tr>
				<td bgcolor="#336699"><font color="white"><b>환불일</b></font></td>
				<td><input type="date" name="repaidDt" id="retDate"></td>
			</tr>
			<tr>
				<td><p align="center">
						<input type="submit" value="저장"> <input type="reset" value="리셋">
				</p></td>
			</tr>
		</table>
	</form>
</div>

<div id="stdtInfo" style="font-size: 12pt;"></div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	var data;
	var clssData;
	var clssTag;
	var xhttp = new XMLHttpRequest();
	
// 	아이디조회
	$(document).ready(function(){
		$("#selectId").click(function(){
			var id = $("#stdtId").val();
			$.post({
				url : "/project/selectStdtId",
				data : $("#stdtId").serialize(),
				success : function(id){
					if(id == ''){
						alert("회원이 아닙니다");
					} else {
						alert("회원입니다");
					}
				},
				error : function(){
					alert("조회에 실패했습니다");
				}
			});
		});
	});
	
	
// 	과정목록
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
		xhttp.open("POST", root + "/clssList?crsId=" + crsId, true);
		xhttp.send();
	}
	
// 	학생목록
	function stdtListCrs(crsId, root) {
		var xhttp2 = new XMLHttpRequest();
		xhttp2.onreadystatechange = function() {
			if (xhttp2.readyState == 4 && xhttp2.status == 200) {
				var clssData5 = xhttp2.responseText;
				clssData5 = JSON.parse(clssData5);
				clssTag = '<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><td></td><td><p align="center"><b>수강생 목록</b></p></td><td></td>	</tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b>번 호</b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b>이 름</b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b>학 과</b></font></p>'
						+ '</td></tr>';
			}
			if (clssData5 == "") {
				clssTag += '<tr><td colspan="5"><p align="center"><b>등록된 수강생이 없습니다.</b></p></td></tr>';
				document.getElementById("stdtList").innerHTML = clssTag;
				document.getElementById("stdtInfo").innerHTML = "";
			} else {
				for (i = 0; i < clssData5.length; i++) {
					clssTag += '<tr><td bgcolor=""><p align="center">'
							+ clssData5[i].stdtNo
							+ '</p></td><td bgcolor=""><p align="center">'
							+ '<a href= "javascript:reqStdtInfo(\'' + clssData5[i].stdtNo + '\',\'' + root + '\');">'
							+ clssData5[i].nm
							+ '</a></p></td><td bgcolor=""><p align="center">'
							+ clssData5[i].mjrTp + '</p></td></tr>';
				}
				clssTag += '</table>';
				document.getElementById("stdtList").innerHTML = clssTag;
			}
		}
		xhttp2.open("POST", root + "/stdtListCrs?crsId=" + crsId,	true);
		xhttp2.send();
	}
	
// 	강좌목록
	function reqClssList(clssNm, root) {
		var crsId = document.getElementById("crs").value;
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var clssData2 = xhttp.responseText;
				clssData2 = JSON.parse(clssData2);
				clssTag = '<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><td></td><td><p align="center"><b>수강생 목록</b></p></td><td></td>	</tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b>번 호</b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b>이 름</b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b>학 과</b></font></p>'
						+ '</td></tr>';
			}
			if (clssData2 == "") {
				clssTag += '<tr><td colspan="5"><p align="center"><b>등록된수강생이 없습니다.</b></p></td></tr>';
				document.getElementById("stdtList").innerHTML = clssTag;
				document.getElementById("stdtInfo").innerHTML = "";
			} else {
				for (i = 0; i < clssData2.length; i++) {
					clssTag += '<tr><td bgcolor=""><p align="center">'
							+ clssData2[i].stdtNo
							+ '</p></td><td bgcolor=""><p align="center">'
							+ '<a href= "javascript:reqStdtInfo(\'' + clssData2[i].stdtNo + '\',\'' + root + '\');">'
							+ clssData2[i].nm
							+ '</a></p></td><td bgcolor=""><p align="center">'
							+ clssData2[i].mjrTp + '</p></td></tr>';
				}
				clssTag += '</table>';
				document.getElementById("stdtList").innerHTML = clssTag;
			}
		}
		xhttp.open("POST", root + "/stdtList?clssNm=" + clssNm + "&crsId=" + crsId, true);
		xhttp.send();
	}
	
// 	학생상세정보
	function reqStdtInfo(stdtNo, root) {
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssData3 = xhttp.responseText;
				clssData3 = JSON.parse(clssData3);
				var i = 0;
				var j = 1;
				clssTag = '<div style="width:100%">'
						+ '<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><td bgcolor="#336699"><font color="white"><b>아이디</b></font></td><td>' 
						+ clssData3[i].id + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>수강생번호</b></font></td><td>'
						+ clssData3[i].stdtNo + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>이름</b></font></td><td>'
						+ clssData3[i].nm + '</td>' 
						+ '<td bgcolor="#336699"><font color="white"><b>주소</b></font></td><td>'
						+ clssData3[i].addr + '</td>'
						+ '<tr><td bgcolor="#336699"><font color="white"><b>핸드폰번호</b></font></td><td>'
						+ clssData3[i].phone + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>부모님번호</b></font></td><td>'
						+ clssData3[i].prntPhone + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>이메일</b></font></td><td>'
						+ clssData3[i].email + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>수강강좌</b></font></td><td>'
						+ clssData3[i].clssNm 
				if(clssData3.length > 1){
					clssTag += ',' + clssData3[i + j].clssNm + '</td>'
				}
				clssTag += '</td>' 
						+ '<tr><td bgcolor="#336699"><font color="white"><b>학과</b></font></td><td>'
						+ clssData3[i].mjrTp + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>대입응시횟수</b></font></td><td>'
						+ clssData3[i].retryCnt + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>등록일</b></font></td><td>'
						+ clssData3[i].paidDt + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>환불일</b></font></td><td>'
						+ clssData3[i].repaidDt + '</td></tr>'
						+ '</table><input type="button" value="정보변경" onclick="updateStdt(\'' + stdtNo + '\',\'' + root + '\');">'
						+ '</div>';
			}
			document.getElementById("stdtInfo").innerHTML = clssTag;
		}
		xhttp.open("POST", root + "/stdtInfo?stdtNo=" + stdtNo, true);
		xhttp.send();
	}
	
// 	학생정보업데이트(종합반)
	function updateStdt(stdtNo, root) {
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssData3 = xhttp.responseText;
				clssData3 = JSON.parse(clssData3);
				clssTag = '<form action="'+ root + '/updateStdt">';
				var i = 0;
				var j = 1;
				clssTag += '<div style="width:100%">'
						+ '<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><td bgcolor="#336699"><font color="white"><b>아이디</b></font></td><td>' 
						+ clssData3[i].id + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>수강생번호</b></font></td><td>'
						+ clssData3[i].stdtNo + '</td>'
						+ '<input type="hidden" name="stdtNo" value="'+ clssData3[i].stdtNo + '">'
						+ '<td bgcolor="#336699"><font color="white"><b>이름</b></font></td><td>'
						+ clssData3[i].nm + '</td>' 
						+ '<td bgcolor="#336699"><font color="white"><b>주소</b></font></td><td>'
						+ clssData3[i].addr + '</td>'
						+ '<tr><td bgcolor="#336699"><font color="white"><b>핸드폰번호</b></font></td><td>'
						+ clssData3[i].phone + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>부모님번호</b></font></td><td>'
						+ clssData3[i].prntPhone + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>이메일</b></font></td><td>'
						+ clssData3[i].email + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>수강강좌</b></font></td><td>'
						+ clssData3[i].clssNm 
						+ '<input type="text" name="clssId" size="5%" value="' + clssData3[i].clssId + '"><br>'
				if(clssData3.length > 1){
					clssTag += clssData3[i + j].clssNm + '<input type="text" name="clssId" size="5%" value="' 
							+ clssData3[i + j].clssId + '"></td>'
				}
				clssTag += '</td>' 
						+ '<tr><td bgcolor="#336699"><font color="white"><b>학과</b></font></td><td>'
						+ clssData3[i].mjrTp + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>대입응시횟수</b></font></td><td>'
						+ clssData3[i].retryCnt + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>등록일</b></font></td><td>'
						+ clssData3[i].paidDt + '</td>'
						+ '<td bgcolor="#336699"><font color="white"><b>환불일</b></font></td><td>'
						+ clssData3[i].repaidDt + '</td></tr>'
						+ '</table><input type="submit" value="저장">' 
						+ '</form>';
				}
				document.getElementById("stdtInfo").innerHTML = clssTag;
			}
			xhttp.open("POST", root + "/stdtInfo?stdtNo=" + stdtNo, true);
			xhttp.send();
		}
	
// 	학생이름으로 검색
	function searchNm(root) {
		var stdtNm = document.getElementById("searchNm").value;
		var clssNm = document.getElementById("clss").value;
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				clssTag = "";
				var clssData4 = xhttp.responseText;
				clssData4 = JSON.parse(clssData4);
				console.log(clssData4);
				clssTag = '<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">'
						+ '<tr><td></td><td><p align="center"><b>수강생 목록</b></p></td><td></td>	</tr>'
						+ '<tr><td bgcolor="#336699"><p align="center"><font color="white"><b>번 호</b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b>이 름</b></font></p>'
						+ '</td><td bgcolor="#336699"><p align="center"><font color="white"><b>학 과</b></font></p>'
						+ '</td></tr>';
				}
				if (clssData4 == "") {
					clssTag += '<tr><td colspan="5"><p align="center"><b>등록된수강생이 없습니다.</b></p></td></tr>';
					document.getElementById("stdtList").innerHTML = clssTag;
				} else {
					for (i = 0; i < clssData4.length; i++) {
					clssTag += '<tr><td bgcolor=""><p align="center">'
							+ clssData4[i].stdtNo
							+ '</p></td><td bgcolor=""><p align="center">'
							+ '<a href= "javascript:reqStdtInfo(\'' + clssData4[i].stdtNo + '\',\'' + root + '\');">'
							+ clssData4[i].nm
							+ '</a></p></td><td bgcolor=""><p align="center">'
							+ clssData4[i].mjrTp + '</p></td></tr>';
					}
					clssTag += '</table>';
					document.getElementById("stdtList").innerHTML = clssTag;
				}
			}
			xhttp.open("POST", root + "/selectStdtNm?nm=" + stdtNm + "&clssNm=" + clssNm, true);
			xhttp.send();
		}
</script>



