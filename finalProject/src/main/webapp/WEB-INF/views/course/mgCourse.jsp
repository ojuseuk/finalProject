<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정 관리</title>
<style>
p {
	margin-top: 0px;
	margin-bottom: 0px;
}
</style>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
 	<form action="courseInsert">
<!-- 	<form> -->
		<fieldset style="width: 40%">
			<legend>교육 과정</legend>
			<table>
				<tr>
					<td>구분 :</td>
					<td>
						<input type="radio" name="crsTp" id="crsTp" value="종합" onclick="crsTpRadio('종합')"/> 종합
						<input type="radio" name="crsTp" id="crsTp" value="특강" onclick="crsTpRadio('특강')"/> 특강
					</td>
				</tr>
				<tr>
					<td>과정 ID :</td>
					<td><input type="text" name="crsId" id="crsId"/></td>
				</tr>
				<tr>
					<td>과목 :</td>
  					<td>
						<!--
						<select name="sbjtNm" id="sbjtNm">
							<option value="국어">국어</option>
							<option value="영어">영어</option>
							<option value="수학">수학</option>
							<option value="과학">과학</option>
						</select>
						-->
						<select name="sbjtNm" id="sbjtNm">
							<option value="">과목 선택</option>
							<c:forEach items="${requestScope.sbjtList}" var="data">
								<option value=${data.sbjtNm}>${data.sbjtNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>  
				<tr>
					<td>과정명 :</td>
					<td><input type="text" name="crsNm" id="crsNm"/></td>
				</tr>
				<tr>
					<td>기간 : </td>
					<td><input type="number" name="prd" id="prd"/></td>
				</tr>
				<tr>
					<td>일 수업시간 :</td>
					<td><input type="number" name="dayClssTm" id="dayClssTm"/>시간/일</td>
				</tr>
				<tr>
					<td>수강료 :</td>
					<td><input type="number" name="stdtclssttn" id="stdtclssttn"/>원</td>
				</tr>
				<tr>
					<td>과정 소개 :</td>
					<td><textarea name = "crsIntro" id="crsIntro" cols = "50" rows = "7" 
                              placeholder="200자 이내"></textarea></td>
				</tr>
			</table>
		</fieldset><br><br>
 		<input type="submit" value="과정 등록"> 
		<input type="button"  onclick="javascript:history.back()" value="등록 취소" >
	</form>
	
	<!-- 리스트 출력 -->
	<div id="viewCourseList" style="position:absolute; top:250px; left:600px; width:700px; height:200px; display:inline-block;">
			
		<!-- cellpadding="5" cellspacing="2"  -->
		<table align="center" border="1" width="60%" bordercolorlight="black">
			<tr>
		        <td bgcolor="#336699">
		            <p align="center">
		            <font color="white"><b><span style="font-size:9pt;">과정 ID</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">과목</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">과정명</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">수업 일수</span></b></font></p>
		        </td>
		        <td bgcolor="#336699">
		            <p align="center"><font color="white"><b><span style="font-size:9pt;">수강료</span></b></font></p>
		        </td>
		    </tr>
		    
			<c:if test="${empty list || fn:length(list) == 0}">
				<tr>
			        <td colspan="5">
			            <p align="center"><b><span style="font-size:9pt;">등록된 교육과정이 없습니다.</span></b></p>
			        </td>
			    </tr>
			</c:if>
			
			<c:forEach items="${requestScope.list}" var="data">
				    <tr>
				        <td bgcolor="">
				            <p align="center"><span style="font-size:9pt;">${data.crsId}</span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.sbjtNm}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.crsNm}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.prd}</a></span></p>
				        </td>
				        <td bgcolor="">
							<p><span style="font-size:9pt;">${data.stdtclssttn}</a></span></p>
				        </td>
				    </tr>
			</c:forEach>
		</table>	
</div>
	<!-- 리스트 미리 출력 끝-->
	
	
	<script type="text/javascript">
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
	</script>
	

	<jsp:include page="../../../footer.jsp"/>
</body>
</html>