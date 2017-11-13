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
	<button onclick="location.href='${pageContext.request.contextPath}/mgEmp">직원 관리</button>
	<button onclick="location.href='${pageContext.request.contextPath}/mgTchr">강사 관리</button>
	
	<br><hr><br>
 	<form action="tchrInsert.do">
		<fieldset style="width: 40%">
			<legend>강사 등록</legend>
			<table>
				<tr>
					<td>강사번호 :</td>
					<td><input type="text" name="tchrNo" id="tchrNo"/>
					</td>
					
				</tr>  
				<tr>
					<td>사용자 ID :</td>
					<td><input type="text" name="id" id="id"/>
						<button id="search">조회</button> 		<!-- 비동기 -->
					</td>
						
				</tr>  
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="nm" id="nm" placeholder="비동기로 DB 데이터 출력"/></td>
				</tr>
				<tr>
					<td>급여 :</td>
					<td><input type="number" name="slr" id="slr"/></td>
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
		</fieldset><br><br>
 		<input type="submit" value="강사 등록"> 
		<input type="button"  onclick="javascript:history.back()" value="등록 취소" >
	</form>
	
	<script type="text/javascript">
		$("#search").bind("click",function(){
		    $.ajax({
		        url : contextPath+"/usrSearch.do",
		        type: "get",
		        data : { "id" : $("#id").val() },
		        success : function(responseData){
		        /*     $("#ajax").remove(); */
		            var data = JSON.parse(responseData);
		            if(!data){
		                alert("존재하지 않는 ID입니다");
		                return false;
		            }
		            var html = '';
		            html += '이름<input type="text" name="name" value="'+data.nm+'">';
		            $("#id").after(html);
		        }
		    });
		});
	
	</script>
	
	<!-- 리스트 미리 출력 -->
	<div id="viewTchrList" style="position:absolute; top:50px; left:600px; width:700px; height:200px; display:inline-block;">
			
		<table align="center" border="1" width="60%" bordercolorlight="black">
			<tr>
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
				            <p align="center"><span style="font-size:9pt;">${data.tchrNo}</span></p>
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