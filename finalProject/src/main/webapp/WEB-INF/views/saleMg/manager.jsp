<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="date" name="date1" id="date1" > ~ <input type="date" name="date2" id="date2">
	<button onclick="saleMg('${root}')">조회</button>
	
	<div id="demo"></div>
	
	<script type="text/javascript">
		function saleMg(root){
			var date1 = document.getElementById("date1").value;
			var date2 = document.getElementById("date2").value;
			
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var restData = this.responseText;
					console.log(restData);
					document.getElementById("demo").innerHTML = restData; 
				}
			};
			xhttp.open("GET", root+"/saleMg/mgSale?date1="+date1+"&date2="+date2, true);
			xhttp.send();
			
		}
		
	</script>
</body>
</html>