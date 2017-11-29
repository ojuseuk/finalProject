<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보확인</title>
<style type="text/css">
#wrap {
	width: 1000px;
	height: 600px;
	margin: auto;
}

#wrap #out {
	width: 440px;
	height: 500px;
	border-radius:10px;
	border: 1px solid gray;
	float: left;
	margin-left: 20px;
	margin-top: 40px;
	padding-left: 20px;
	padding-top: 10px;
	background-color: white;
}

#wrap #out #userout {
	margin-top: 30px;
}

</style>

</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div id="wrap" align="center">
	<div id="out">
		<h2>회원정보변경</h2>
		<hr style="width:100px;float:left;">
		<br>
		<br>
		<br>
		<span >
			<p style="font-size:15px;font-weight:bold; color: #353535; align:center;">
				회원정보변경을 원하시면 아이디와 비밀번호를 입력해 주세요.
			</p>
		</span><br>
		<form action="${root}/confirmUsr" method="POST">
		    ID <p align="center"><input type="text" name="id" class="form-control" placeholder="아이디를 입력해주세요." style="height:34px;width:200px;"></p><br>
			PW <p align="center"><input type="password" name="pw" class="form-control" placeholder="비밀번호를 입력해주세요." style="height:34px;width:200px;"></p><br>
			<input class="join" type="submit" id="btn_ok" class="btn btn-primary" value="확인" style="width:200px;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><br>
		</form>
		<br>
		<br>
		
	</div>
</div>

</body>
</html>
