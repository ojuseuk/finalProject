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
	<button onclick="location.href='${pageContext.request.contextPath}/course'">과정 등록</button>
	<button onclick="location.href='${pageContext.request.contextPath}/courseList.do'">과정 목록</button>
	<button onclick="location.href='${pageContext.request.contextPath}/clssInsert.do'">강좌 개설</button>
	<button onclick="location.href='${pageContext.request.contextPath}/course'">반 배치</button>
	
	<br><hr><br>
 	<form action="clssInsert.do">
		<fieldset style="width: 40%">
			<legend>강좌 개설</legend>
			<table>
				<tr>
					<td>과목명 :</td>
					<td><select name="sbjtNm" id="sbjtNm">
							<option value="">과목 선택</option>
							<c:forEach items="${requestScope.sbjtList}" var="data">
								<option value=${data.sbjtNm}>${data.sbjtNm}</option>
							</c:forEach>
						</select></td>
				</tr>  
				<tr>
					<td>과정명 :</td>
					<td><select name="crsId" id="crsId">
							<option value="">과정 선택</option>
							<c:forEach items="${requestScope.courseList}" var="data">
								<option value=${data.crsId}>${data.crsNm}</option>
							</c:forEach>
						</select></td>
				</tr>
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
		</fieldset><br><br>
 		<input type="submit" value="강좌 개설"> 
		<input type="button"  onclick="javascript:history.back()" value="개설 취소" >
	</form>
	
	<!-- 리스트 미리 출력 -->
	<div id="viewCourseList" style="position:absolute; top:50px; left:600px; width:700px; height:200px; display:inline-block;">
			
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
				            <p align="center"><span style="font-size:9pt;">${data.clssId}</span></p>
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
	
	

	
</body>
</html>