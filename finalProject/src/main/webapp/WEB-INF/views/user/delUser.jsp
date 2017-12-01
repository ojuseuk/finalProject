<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<div id="wrap" align="center">
	<div id="out">
		<h2>회원탈퇴</h2>
		<hr style="width:100px;float:left;">
		<br>
		<br>
		<br>
		<span>
			<p style="font-size:15px;font-weight:bold; color: #353535; align:center;">
			회원탈퇴를 원하시면 아이디와 비밀번호를 입력해 주세요.
			</p>
		</span><br>
		<div id="userout">
		    ID<input type="text" id="id" class="form-control" placeholder="아이디를 입력해주세요." style="height:34px;width:200px;"><br>
			PW<input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력해주세요." style="height:34px;width:200px;"><br>
			<input type="button" id="btn_ok" class="btn btn-primary" value="확인" style="background-color:#5b5e61b3; width:200px;">
			<input type="hidden" value="${root}" id="root"><br>
			<br>
			<br>
		</div>
		
	</div>
</div>
<script type="text/javascript">
	var root = $("#root").val();
	var urlRoot = root+"/userOut";
	$(document).ready(function(){
		$('#btn_ok').on("click", function(){
			$.ajax({
                beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				type: 'post',	
				url: urlRoot,
				data:{"id":$("#id").val(),"pw":$("#pw").val()},
				dataType:'json',
				success:function(){
					console.log(1111);
					alert("성공");
					location.href="main.jsp";
					
				}
			});
		});
		
	});
</script>
</body>
</html>
