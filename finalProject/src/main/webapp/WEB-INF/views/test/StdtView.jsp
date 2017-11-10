<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${not empty crsList}" >
   <select name="crs" id="crsBox" onchange="reqCrs(this.value,'${root}')">
      <c:forEach items="${crsList}" var="data">
         <option value="${data.crsId}">${data.crsNm}</option>
      </c:forEach>
   </select>
</c:if>
<select id="clss">
</select>
<form>
	<input type="text" name="name" value="">
	<input type="submit" value="검색">
</form>
<!-- <table border="0" cellpadding="5" cellspacing="2" width="50%" bordercolordark="white" bordercolorlight="black"> -->
<!-- 	<tr> -->
<!--         <td bgcolor="#336699"> -->
<!--             <p align="center"> -->
<!--             <font color="white"><b><span style="font-size:9pt;">번 호</span></b></font></p> -->
<!--         </td> -->
<!--         <td bgcolor="#336699"> -->
<!--             <p align="center"><font color="white"><b><span style="font-size:9pt;">이 름</span></b></font></p> -->
<!--         </td> -->
<!--         <td bgcolor="#336699"> -->
<!--             <p align="center"><font color="white"><b><span style="font-size:9pt;">작 성 자</span></b></font></p> -->
<!--         </td> -->
<!--         <td bgcolor="#336699"> -->
<!--             <p align="center"><font color="white"><b><span style="font-size:9pt;">작 성 일</span></b></font></p> -->
<!--         </td> -->
<!--         <td bgcolor="#336699"> -->
<!--             <p align="center"><font color="white"><b><span style="font-size:9pt;">조 회 수</span></b></font></p> -->
<!--         </td> -->
<!--     </tr> -->
    
 
<%-- 	<c:if test="${empty list || fn:length(list) == 0}"> --%>
<!-- 		<tr> -->
<!-- 	        <td colspan="5"> -->
<!-- 	            <p align="center"><b><span style="font-size:9pt;">등록된 수강생이 없습니다.</span></b></p> -->
<!-- 	        </td> -->
<!-- 	    </tr> -->
<%-- 	</c:if> --%>

<%-- 	<%-- ArrayList에  GuestBookBean 객체를 하나하나 data라는 반복 대입해서 사용 --%>
<%-- 	<c:forEach items="${requestScope.list}" var="data"> --%>
<!-- 		    <tr> -->
<!-- 		        <td bgcolor=""> -->
<%-- 		            <p align="center"><span style="font-size:9pt;">${data.num}</span></p> --%>
<!-- 		        </td> -->
<!-- 		        <td bgcolor=""> -->
<!-- 					<p align="center"><span style="font-size:9pt;"> -->
<%-- 						<a href="mailto: ${data.email}"> --%>
<%-- 						 ${data.author}</a> --%>
<!-- 					</span></p> -->
<!-- 		        </td> -->
<!-- 		        <td bgcolor=""> -->
<!-- 		            <p align="center"><span style="font-size:9pt;"> -->
<%-- 						<a href="mailto: ${data.email}"> --%>
<%-- 						 ${data.author}</a> --%>
<!-- 					</span></p> -->
<!-- 		        </td> -->
<!-- 		        <td bgcolor=""> -->
<!-- 		            <p align="center"><span style="font-size:9pt;"> -->
<%-- 		             ${data.writeday}</span></p> --%>
<!-- 		        </td> -->
<!-- 		        <td bgcolor=""> -->
<!-- 		            <p align="center"><span style="font-size:9pt;"> -->
<%-- 		             ${data.readnum}</span></p> --%>
<!-- 		        </td> -->
<!-- 		    </tr> -->
<%-- 	</c:forEach> --%>
 	
<!--     <tr> -->
<!--         <td bgcolor=""> -->
<!--             <p align="center"><span style="font-size:9pt;"></span></p> -->
<!--         </td> -->
<!--         <td bgcolor=""> -->
<!-- 			<p><span style="font-size:9pt;"><a href="ReadAContent.jsp?num= "></a></span></p> -->
<!--         </td> -->
<!--         <td bgcolor=""> -->
<!--             <p align="center"><span style="font-size:9pt;"> -->
<!-- 				<a href="mailto:"></a> -->
<!-- 			</span></p> -->
<!--         </td> -->
<!--         <td bgcolor=""> -->
<!--             <p align="center"><span style="font-size:9pt;"></span></p> -->
<!--         </td> -->
<!--         <td bgcolor=""> -->
<!--             <p align="center"><span style="font-size:9pt;"></span></p> -->
<!--         </td> -->
<!--     </tr> -->
<!-- </table> -->
<!-- <hr> -->

	<script type="text/javascript">
		
		var data;
		var clssTag = "";
		var xhttp = new XMLHttpRequest();
		function reqCrs(crsId, root) {
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var clssData = xhttp.responseText;
					clssData = JSON.parse(clssData);
					console.log(clssData);
					for (i = 0; i < clssData.length; i++) {
						clssTag += '<option value="' + i + '">'	+ clssData[i].clssNm + '</option>';
					}
					document.getElementById("clss").innerHTML = clssTag;
				}
			}
			xhttp.open("GET", root + "/clss?crsId=" + crsId, true);
			xhttp.send();
		}

		// 		function clssView(crsId, root) {
		// 			console.log(1);
		// 			var xhttp = new XMLHttpRequest();
		//             xhttp.onreadystatechange = function() {
		//                if (xhttp.readyState == 4 && xhttp.status == 200) {
		//                   var clssData = xhttp.responseText;
		//                   clssData=JSON.parse(clssData);
		//                   console.log(clssData);
		//                   for (i = 0; i < clssData.length; i++) {
		//   					clssTag += '<option value="' + i + '">' + data[i].clssNm + '</option>';
		//   				}
		//   				document.getElementById("clss").innerHTML = clssTag;
		//                }
		//             }
		// 		}
	</script>
<!-- 		function searchGroup(){ -->
<!-- 	         var groupName = document.getElementById("groupNameInput").value; -->
<!-- 	         if(groupName==''){ -->
<!-- 	            alert("검색어를 입력해주세요"); -->
<!-- 	         } else { -->
<!-- 	            var xhttp = new XMLHttpRequest(); -->
<!-- 	            xhttp.onreadystatechange = function() { -->
<!-- 	               if (this.readyState == 4 && this.status == 200) { -->
<!-- 	                  var resData = this.responseText; -->
<!-- 	                  resData=JSON.parse(resData); -->
<!-- 	                  console.log(resData); -->
<!-- 	                  newGroupList(resData,groupName); -->
	                  
<!-- 	               } -->
<!-- 	            } -->
<!-- 	            xhttp.open("POST", "searchGroup.do?groupName="+groupName, true); -->
<!-- 	            xhttp.send();  -->
<!-- 	         } -->

<!-- 	      } -->
		
		
