<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강좌 개설</title>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
 	<form action="clssInsert.do" id="frmClss">
		<fieldset style="width: 40%">
			<legend>교육 과정</legend>
			<table>
				<tr>
					<td>과목명 :</td>
					<td><select name="sbjtNm" id="sbjtNm" required onchange="crsSelect('${pageContext.request.contextPath}', this.value);
																			 tchrSelectBySbjtNm('${pageContext.request.contextPath}', this.value)">
							<option value="">과목 선택</option>
							<c:forEach items="${requestScope.sbjtList}" var="data">
								<option value=${data.sbjtNm}>${data.sbjtNm}</option>
							</c:forEach>
						</select></td>
				</tr>  
				<tr>
					<td>과정명 :</td>
					<td><select name="crsId" id="crsId">
					
						</select>
					</td>
					<td align="right"><input type="button" value="해당 과정 강좌 리스트 " onclick="clssSelectByCourse('${pageContext.request.contextPath}', document.getElementById('crsId').value)">
					</td>
					
				</tr>
			</table>
		</fieldset>
		<fieldset style="width: 40%">
			<legend>강좌 정보</legend>
			<table>
				<tr>
					<td>강좌 ID :</td>
					<td><input type="text" name="clssId" id="clssId"/></td>
				</tr>
				</tr>
					<td>강좌명 :</td>
					<td><input type="text" name="clssNm" id="clssNm"/></td>
				</tr>
				<tr>
					<td>강좌 기간 : </td>
					<td><input type="date" name="strtDt" placeholder="시작일자" id="strtDt"/>부터</td>
					<td><input type="date" name="endDt" placeholder="종료일자" id="endDt"/>까지</td>
				</tr>
				<tr>
					<td>수업시간 :</td>
					<td><input type="time" name="strtTm" placeholder="시작시각" id="strtTm"/></td>
					<td><input type="time" name="endTm" placeholder="종료시각" id="endTm"/></td>
				</tr>
				<tr>
					<td>수강인원 :</td>
					<td><input type="number" name="capa" id="capa"/></td>
				</tr>
				<tr>
					<td>강의실 :</td>
					<td><input type="text" name="clssroom" id="clssroom"/></td>
				</tr>
			</table>
		</fieldset><br>
		<input type="reset" value="화면 초기화"> 
 		<input type="submit" value="강좌 개설"> 
		<input type="button" value="수정 내용 저장" onclick="tchrUpdate()">
		<input type="button" value="강사 배정" onclick="tchrShow()">
		<input type="button" onclick="javascript:history.back()" value="이전 화면으로"><br>
		<br>
		<fieldset style="width: 45%" id="fsTchr" hidden>				
			<legend>강사 정보</legend>
			<table>
				<tr>
					<td>강사명 :</td>
					<td>
						<select name="tchrNo" id="tchrNo" onchange="tchrSelect('${pageContext.request.contextPath}', this.value)">
							<option value="">강사 선택</option>

						</select>
<%-- 						<select name="tchrNm" id="tchrNm" required onchange="tchrSelect('${pageContext.request.contextPath}', this.value)">
							<option value="">강사 선택</option>
							<c:forEach items="${requestScope.tchrList}" var="data">
								<option value=${data.tchrNo}>${data.tchrNm}</option>
							</c:forEach>
						</select> --%>
					</td>
					
				</tr>
					<td>강의료 :</td>
					<td><input type="number" name="slr" id="slr">  
				<tr>
				</tr>
				<tr>
					<td>강사 소개 : </td>
					<td><textarea name = "tchrIntro" id="tchrIntro" cols = "50" rows = "7" 
                              placeholder="200자 이내"></textarea></td>
                    </td>
					<td><div id="tchrPhoto"></div>
                    </td>
				</tr>
			</table>
			<input type="button" value="저장" onclick="assgnTchr('${pageContext.request.contextPath}')">
			<input type="button" value="닫기" onclick="tchrClose()">
			<!-- name="assgnTchr" id="assgnTchr" --> 
		</fieldset>
	</form>
	
	<script type="text/javascript">
		var xhttp = new XMLHttpRequest();
		var xhttp2 = new XMLHttpRequest();
		var data;
		var data2;
		
		/* 강사 배정 */
		function assgnTchr(root){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					
/* 					document.getElementById("tchrNo").value = data.tchrNo;
					document.getElementById("clssId").value = data.clssId;
					 document.getElementById("chrg").value = data.chrg; 
					document.getElementById("slr").value = data.slr; */
					alert(data);
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
			/* xhttp.setRequestHeader(header, token); */
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
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("tchrIntro").value = data.tchrIntro;
					
					tag = '<img src="${pageContext.request.contextPath}/imgs/img/';
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
			document.getElementById("frmClss").action = "${pageContext.request.contextPath}/clssSelectByCourse";
			document.getElementById("frmClss").submit();
		}
		
		/* 강좌ID로 강사 배정 조회. 리스트에서 특정 강좌 선택 시 */
		function tchrAssnSelect(root, clssId){
			xhttp2.onreadystatechange = function(){
				console.log(xhttp2.readyState);
				console.log(xhttp2.status);
				if (xhttp2.readyState == 4 && xhttp2.status == 200) {
					var data2 = xhttp2.responseText;
					data2 = JSON.parse(data2);
					document.getElementById("slr").value = data2.slr;
					document.getElementById("tchrIntro").value = data2.tchrIntro;
					
					tag = '<option value="' + data2.tchrNo + '">' + data2.nm + '</option>';
					document.getElementById("tchrNo").innerHTML = tag;
					
					tag = '<img src="${pageContext.request.contextPath}/imgs/img/';
					tag += data2.tchrPt + '" style="width:150px;height:150px;">';
					document.getElementById("tchrPhoto").innerHTML = tag;
					
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
					
					/* 리스트에서 특정 강좌 선택 시, 해당 과목의 강사 조회 */
					/* tchrSelectBySbjtNm('${pageContext.request.contextPath}', data.sbjtNm); */
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
	</script>
	
	<!-- 리스트 미리 출력 -->
	<div id="viewCourseList" style="position:absolute; top:250px; left:750px; width:800px; height:200px; display:inline-block;">
			
		<table align="center" border="1" width="60%" bordercolorlight="black">
			<tr>
		        <td bgcolor="#336699">
		            <p align="center">
		            <font color="white"><b><span style="font-size:9pt;">강좌 ID</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">과목</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">과정명</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">강좌명</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">시작일자</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">수강인원</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">강의실</span></b></font></p>
		        </td>
		    </tr>
		    
			<c:if test="${empty list || fn:length(list) == 0}">
				<tr>
			        <td colspan="7">
			            <p align="center"><b><span style="font-size:9pt;">개설된 강좌가 없습니다.</span></b></p>
			        </td>
			    </tr>
			</c:if>
			
			<c:forEach items="${requestScope.list}" var="data">
				    <tr>
				        <td bgcolor="">
				        <%-- <input type="button" value=${data.tchrNo} onclick="tchrSelect('${pageContext.request.contextPath}', '${data.tchrNo}')"></p> --%>
				        
				            <p align="center"><span style="font-size:9pt;">
				            <%-- <input type="button" value=${data.clssId} onclick="clssSelect('${pageContext.request.contextPath}', '${data.clssId}')"></span></p> --%>
 				            <input type="button" value=${data.clssId} onclick="clssSelect('${pageContext.request.contextPath}', '${data.clssId}');
 				                                                               tchrAssnSelect('${pageContext.request.contextPath}', '${data.clssId}')"></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.sbjtNm}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.crsNm}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.clssNm}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.strtDt}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.capa}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.clssroom}</a></span></p>
				        </td>
		
				    </tr>
			</c:forEach>
		</table>	
</div>
	<!-- 리스트 미리 출력 끝-->
	
<jsp:include page="../../../footer.jsp"/>	
</body>
</html>