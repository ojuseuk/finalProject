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
	height: 1000px;
	margin: auto;
}

#wrap #findId {
	width: 400px;
	height: 500px;
	border-radius:10px;
	border: 1px solid gray;
	float: left;
 	margin-left: 20px;
 	margin-right: 20px;
 	margin-top: 40px;
 	padding-left: 20px;
 	padding-top: 10px; 
	background-color: white;
}

#wrap #findPwd {
	width: 400px;
	height: 500px;
	border-radius:10px;
	border: 1px solid gray;
	float: left;
	margin-left: 70px;
	margin-top: 40px;
	padding-left: 20px;
	padding-top: 10px;
	background-color: white;
}

#wrap #findId #findId_insert {
	margin-top: 30px;
}

#wrap #findPwd #findPwd_insert {
	margin-top: 26px;
}

</style>
<script src="${root}/js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div id="wrap">
	<div id="findId">
		<h2>아이디 찾기</h2>
		<hr style="width:100%;float:left;">
		<br>
		<br>
		<br>
		<span style="font-size:12px;font-weight:bold; color: #353535;">회원정보에 입력한 이름과  전화번호로 아이디를 찾을 수 있습니다.<br>
			개인 정보 보호를 위해 아이디 뒷자리 3개는 *로 표시됩니다.</span><br>
		<div id="findId_insert" style="margin-left:100px;">
			<input type="text" id="nm" class="form-control" placeholder="이름을 입력해주세요." style="height:34px;width:200px;"><br>
			<input type="text" id="phone" class="form-control" placeholder="전화번호를 입력해주세요." style="height:34px;width:200px;"><br>
			<input type="button" id="btn_idok" class="btn btn-primary" value="확인" style="width:200px;">
			<input type="hidden" value="${root}" id="root"><br>
			<br>
			<br>
		</div>
		<div id="findId_result" align="center">
			<span id="span_findId_result">
			</span>
		</div>
	</div>
	
	<div id="findPwd">
		<h2>비밀번호 찾기</h2>
		<hr style="width:100px;float:left;">
		<br>
		<br>
		<br>
		<span style="font-size:12px;font-weight:bold; color: #353535;">회원정보에 입력한 이메일 주소로 인증이 가능합니다.<br>
			본인인증 후, 새로운 비밀번호를 입력해 주세요.</span><br>
		<div id="findPwd_insert" style="margin-left:100px;">
			<input type="text" id="id" class="form-control" placeholder="아이디를 입력해주세요." style="height:34px;width:200px;"><br>
			<input type="text" id="email" class="form-control" placeholder="이메일을 입력해주세요." style="height:34px;width:200px;"><br>
			<input type="button" id="btn_pwdok" class="btn btn-primary" value="확인" style="width:200px;"><br>
			<br>
		</div>
		<div id="findPwd_result" align="center">
			<span id="span_findPwd_result"></span>
		</div>
	</div>
	
</div>
	<script type="text/javascript">
	var root = $("#root").val();
	alert(root);
	var urlRoot = root+"/findId";
	$(document).ready(function(){
		$('#btn_idok').on("click", function(){
			$.ajax({
				url: urlRoot,
				data:{"nm":$("#nm").val(),"phone":$("#phone").val()},
				dataType:'json',
				success:function(data){
					alert("왜 안되");
					if(data.idCheck==false){
						$("#span_findId_result").css("color","red").html("해당 정보를 조회할 수 없습니다.");
					}else{
						var length=data.idCheck.length;
						$("#span_findId_result").css("color","green").html("회원님의 아이디는 "+data.idCheck.substr(0,(length-3))+"*** 입니다.");
					}
				}
			});
		});
		
 		$("#btn_pwdok").click(function(){
			$.ajax({
				url:'findPwd',
				data:{"id":$("#id").val(),"email":$("#email").val()},
				dataType:'json',
				success:function(data){
					if(data.pwdCheck==false){
						$("#span_findPwd_result").css("color","red").html("해당 정보를 조회할 수 없습니다.");
					}else{
						$("#span_findPwd_result").css("color","green").html("해당 정보가 정상적으로 조회되었습니다.<br>");
						$("#span_findPwd_result").append("<a href='changePwdNew?id="+$("#id").val()+"' style='font-size:18px;font-weight:bold;'>새 비밀번호 등록하러 가기</a>");
					}
				}
			})
		});
	});
</script>
		
</body>
</html>


