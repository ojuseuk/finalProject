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
	<button onclick="location.href='${pageContext.request.contextPath}/emp'">직원 관리</button>
	<button onclick="location.href='${pageContext.request.contextPath}/mgTchr">강사 관리</button>
	
	<br><hr><br>
 	<form action="tchrInsert.do" id="frmTchr">
		<fieldset style="width: 40%">
			<legend>사용자 정보</legend>
			<table>
				<tr>
					<td>사용자 ID :</td>
					<td><input type="text" name="id" id="id" />
  						<input type="button" value="조회"
						onclick="searchUsr('${pageContext.request.contextPath}', document.getElementById('id').value);
								 searchEmpById('${pageContext.request.contextPath}', document.getElementById('id').value);
								 searchTchrById('${pageContext.request.contextPath}', document.getElementById('id').value)">
					</td>
				</tr>  
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="nm" id="nm" placeholder="비동기로 DB 데이터 출력"/></td>
				</tr>
			</table>
		</fieldset>

		<fieldset style="width: 40%">
			<legend>직원 정보</legend>
			<table>
				<tr>
					<td>사원번호 :</td>
					<td><input type="text" name="empNo" id="empNo"/>
					</td>
				</tr>  
				<tr>
					<td>급여 :</td>
					<td><input type="number" name="slr" id="slr"/></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset style="width: 40%">				
			<legend>강사 정보</legend>
			<table>
				<tr>
					<td>강사번호 :</td>
					<td><input type="text" name="tchrNo" id="tchrNo"/>
					</td>
					
				</tr>  
				<tr>
					<td>담당과목 :</td>
					<td><select name="sbjtChrg" id="sbjtChrg">
							<option value="">과목 선택</option>
							<c:forEach items="${requestScope.sbjtList}" var="data">
								<option value=${data.sbjtNm}>${data.sbjtNm}</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr>
					<td>강사 소개 : </td>
					<td><textarea name = "tchrIntro" id="tchrIntro" cols = "50" rows = "7" 
                              placeholder="200자 이내"></textarea></td>
				</tr>
			</table>
		</fieldset>
		<br><br>

		<input type="reset" value="화면 초기화"> 
		<input type="submit" value="강사 등록"> 
		<input type="button" value="수정 내용 저장" onclick="tchrUpdate()">
		<input type="button" onclick="javascript:history.back()" value="이전 화면으로">
		
 		<input type="hidden" id="resultMsg" value="${requestScope.resultMsg}">
	</form>
	
	<script type="text/javascript">
		var xhttp = new XMLHttpRequest();
		var xhttp2 = new XMLHttpRequest();
		var xhttp3 = new XMLHttpRequest();
		var data;
		resultMsg = document.getElementById("resultMsg").value;
		if(resultMsg != ""){
			alert(resultMsg);
		}
		/* 강사번호로 TB_TCHR 업데이트 */
		function tchrUpdate(){
			document.getElementById("frmTchr").action = "${pageContext.request.contextPath}/tchrUpdate";
			document.getElementById("frmTchr").submit();
		}
		
		/* 강사번호로 TB_TCHR 검색 */
		function tchrSelect(root, tchrNo){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("tchrNo").value = data.tchrNo;
					document.getElementById("empNo").value = data.empNo;
					document.getElementById("id").value = data.id;
					document.getElementById("nm").value = data.nm;
					document.getElementById("slr").value = data.slr;
					document.getElementById("sbjtChrg").value = data.sbjtChrg;
					document.getElementById("tchrIntro").value = data.tchrIntro;
					document.getElementById("empNo").readOnly = true;
					document.getElementById("nm").readOnly = true;
					document.getElementById("slr").readOnly = true;
				}
			}
			xhttp.open("GET", root + "/tchrSelect?tchrNo=" + tchrNo, true);
			xhttp.send();
		}
		
		/* 사용자 ID로 TB_USR 검색 */
		function searchUsr(root,id){
			console.log(root,id);
			
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("nm").value = data.nm;
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
		
	</script>
	
	<!-- 리스트 미리 출력 -->
	<div id="viewTchrList" style="position:absolute; top:50px; left:600px; width:700px; height:200px; display:inline-block;">
			
		<table align="center" border="1" width="60%" bordercolorlight="black">
			<tr>
		        <td bgcolor="#336699">
		            <p align="center">
		            <font color="white"><b><span style="font-size:9pt;">ID</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center">
		            <font color="white"><b><span style="font-size:9pt;">사번</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center">
		            <font color="white"><b><span style="font-size:9pt;">강사번호</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">담당과목</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">이름</span></b></font></p>
		        </td>
		    </tr>
		    
			<c:if test="${empty list || fn:length(list) == 0}">
				<tr>
			        <td colspan="7">
			            <p align="center"><b><span style="font-size:9pt;">등록된 강사가 없습니다.</span></b></p>
			        </td>
			    </tr>
			</c:if>
			
			<c:forEach items="${requestScope.list}" var="data">
				    <tr>
				        <td bgcolor="">
				            <p align="center"><span style="font-size:9pt;">${data.id}</span></p>
				            
				        </td>
				        <td bgcolor="">
				            <p align="center"><span style="font-size:9pt;">${data.empNo}</span></p>
				        </td>
				        <td bgcolor="">
				        	<p align="center">
				        	<input type="button" value=${data.tchrNo} onclick="tchrSelect('${pageContext.request.contextPath}', '${data.tchrNo}')"></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.sbjtChrg}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.nm}</a></span></p>
				        </td>
				    </tr>
			</c:forEach>
		</table>	
</div>
	<!-- 리스트 미리 출력 끝-->
	
	

	
</body>
</html>