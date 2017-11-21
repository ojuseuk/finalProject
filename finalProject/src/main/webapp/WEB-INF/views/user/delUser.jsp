<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap {
	width: 1000px;
	height: 600px;
	margin: auto;
}

#wrap #del {
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

#wrap #del #del_insert {
	margin-top: 30px;
}

</style>

</head>
<body>
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<div id="wrap">

	<div id="del">
		<h2>회원탈퇴</h2>
		<hr style="width:100px;float:left;">
		<br>
		<br>
		<br>
		<span style="font-size:12px;font-weight:bold; color: #353535;">회원탈퇴를 원하시면 비밀번호를 입력해 주세요.</span><br>
		<div id="del_insert" style="margin-left:100px;">
			<input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력해주세요." style="height:34px;width:200px;"><br>
			<input type="button" id="btn_ok" class="btn btn-primary" value="확인" style="width:200px;">
			<input type="hidden" value="${root}" id="root"><br>
			<br>
			<br>
		</div>
		<div id="del_result" align="center">
			<span id="span_del_result">
			</span>
		</div>
	</div>
</div>
	<script type="text/javascript">
	var root = $("#root").val();
	alert(root);
	var urlRoot = root+"/del";
	$(document).ready(function(){
		$('#btn_ok').on("click", function(){
			$.ajax({
				url: urlRoot,
				data:{"pw":$("#pw").val()},
				dataType:'json',
				success:function(data){
					alert("회원탈퇴");
					if(data.delCheck==false){
						$("#span_del_result").css("color","red").html("실패.");
					}else{
						$("#span_del_result").css("color","green").html("성공.");
					}
				}
			});
		});
		
	});
</script>
</body>
</html>
