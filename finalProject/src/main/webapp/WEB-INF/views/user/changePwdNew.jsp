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

#wrap #upload_request {
	width: 550px;
	height: 500px;
	float: left;
	margin-left: 270px;
	margin-top: 40px;
	padding-left: 20px;
	padding-top: 10px;
	border-radius:5px;
	background-color: white;
}

#wrap #upload_request #upload_request_div {
	margin-top: 30px;
}

.check_error {
	color:red;
}
.check_ok {
	color:green;
}
</style>
</head>
<body>
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script>
   /* 유효성 체크 */
   $(function(){
	  var check_error=0;
	   
      $("#pw").focusout(function(){
         var new_pwd=$(this).val();
         var newpwd_valid=/^[a-zA-Z0-9_-]{6,14}$/;
         var msg="";
         if(!newpwd_valid.test(new_pwd)){
        	$(this).next().html("형식에 맞지 않습니다.<br> (6~14자 영문(대,소), 숫자)");
        	$(this).next().addClass("check_error");
         }else{
        	 $(this).next().html("형식에 알맞습니다.");
        	 $(this).next().removeClass("check_error").addClass("check_ok");
         }
      });
      $("#pw_check").focusout(function(){
         var msg="";
         if($(this).val().length>=6){
	         if($(this).val()!=$("#pw").val()){
	            $(this).next().html("비밀번호가 일치하지 않습니다.");
	            $(this).next().addClass("check_error");
	         }else{
	        	$(this).next().html("비밀번호가 일치합니다.");
	        	$(this).next().removeClass("check_error").addClass("check_ok");
	         }
         }else{
        	 $(this).next().html("비밀번호 길이가 짧습니다.");
         }
      });
      $("form").submit(function(event){
          console.log($("#wrap").children().find(".check_error").length);
          if($("#wrap").children().find(".check_error").length>0){
        	  $("#submitMsg").text("입력 값이 올바르지 않습니다.");
             event.preventDefault();
             return;
          }else{
        	  alert('비밀번호 변경이 정상적으로 처리되었습니다.');
          }
       });
   });
</script>

<div id="wrap">
	<div id="upload_request">
		<h2>비밀번호 변경</h2>
		<hr style="width:100px;float:left;">
		<br>
		<br>
		<br>
		<span style="font-size:12px;font-weight:bold; color: #353535;">본인확인이 완료되었습니다.<br>
			새 비밀번호를 입력해주세요.</span><br>
		<div id="upload_request_div" style="margin-left:100px;">
			<form method="post" action="afChangePwdNew">
				<input type="text" id="id" name="id" value="${id}" class="form-control" style="width:200px;" readonly="readonly"><br>
				<input type="password" id="pw" name="pw" placeholder="새 비밀번호 입력" class="form-control" style="width:200px;">
				<span class="check_error"></span><br>
				<input type="password" id="pw_check" name="pw_check" placeholder="새 비밀번호 입력확인" class="form-control" style="width:200px;">
				<span class="check_error"></span><br>
				<div align="left">
					<input type="submit" class="btn btn-primary" id="btn_submit" value="변경하기" style="width:200px;"><br>
					<span id="submitMsg" style="color:red;"></span>
				</div>
			</form>
			<br>
			<br>
		</div>
	</div>
</div>
</body>
</html>
