<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보변경</title>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div id="" class="container">
  <form action="${root}/changeUsr" method="post">
  	<table>
  		<tr>
  			<td>아이디</td>
  			<td>${requestScope.usr.id}</td>
  			<td><input type="hidden" name="id" id = "id" value="${requestScope.usr.id}"></td>
  		</tr>
  		<tr>
  			<td>비밀번호</td>
  			<td><input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" name="pw" id="pw" value="${requestScope.usr.pw}" required></td>
	  	</tr>
	  	<tr>
	  		<td>이름</td>
	  		<td><input type="text" placeholder="이름" name="nm" id="nm" value="${requestScope.usr.nm}" required></td>
	  	</tr>
	  	<tr>
	  		<td>전화</td>
	  		<td><input type="text" placeholder="전화 ※ '-'없이 숫자(10~11자)만 입력" name="phone" id="phone" value="${requestScope.usr.phone}" required></td>
	  	</tr>
	  	<tr>
	  		<td>주소</td>
	  		<td> <input type="text" placeholder="주소" name="addr" id="addr" value="${requestScope.usr.addr}" required></td>
	  	</tr>
	  	<tr>
	  		<td>이메일</td>
	  		<td><input type="text" placeholder="이메일" name="email" id="email" value="${requestScope.usr.email}" required></td>
	  	</tr>
	    <tr>
	        <td><button type="button" class="signupbtn" style="width: 50%;" onclick="sendIt()">저장</button>
	        <button type="reset" class="signupbtn" style="width: 50%;">취소</button></td>
	    </tr>
	    <tr>
	    	<td> <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
	    </tr>
      </table>
  </form>
</div>
<input type="hidden" id="fail" value="${requestScope.fail}">
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script>
if($("#fail").val == 'f'){
	alert("업데이트 실패");
}
   /* 유효성 체크 */
   $(function(){
	  var check_error=0;
      
      $("#pw").focusout(function(){
         var pw=$(this).val();
         var pwd_valid=/^[a-zA-Z0-9_-]{6,14}$/;
         var msg="";
         if(!pwd_valid.test(pw)){
        	$(this).next().html("(6~14자 영문(대,소), 숫자)입니다.");
        	$(this).next().addClass("check_error");
         }else{
        	 $(this).next().html("비밀번호 형식에 알맞습니다.");
        	 $(this).next().removeClass("check_error").addClass("check_ok");
         }
      });
      $("#nm").focusout(function(){
          var msg="";
          if($(this).val().length<2){
             $(this).next().html("이름을 올바르게 입력해 주세요.");
             $(this).next().addClass("check_error");
          }else{
        	 $(this).next().html("형식에 알맞습니다.");
        	 $(this).next().removeClass("check_error").addClass("check_ok");
          }
      });
      $("#phone").focusout(function(){
         var phone_valid=/[-]/;
         var phone=$(this).val();
         var msg="";
         if($(this).val().length<10 || $(this).val().length>11){
         	$(this).next().html("10~11자 이내의 핸드폰번호를 입력해주세요.");
         	$(this).next().addClass("check_error");
         }else if(phone_valid.test(phone)){
        	$(this).next().html("-를 빼고 입력해주세요.");
          	$(this).next().addClass("check_error");
         }else{
        	$(this).next().html("형식에 알맞습니다.");
         	$(this).next().removeClass("check_error").addClass("check_ok");
         }
      });
      $("#email").focusout(function(){
         var email_validA=/[@]/;
         var email_validDot=/[.]/;
         var email=$(this).val();
         if($(this).val().length<10){
        	$(this).next().next().html("이메일의 길이가 짧습니다.");
          	$(this).next().next().addClass("check_error");
         }else if(!email_validA.test(email)){
        	$(this).next().next().html("@를 함께 입력해주세요");
        	$(this).next().next().addClass("check_error");
         }else if(!email_validDot.test(email)){
        	$(this).next().next().html(".를 함께 입력해주세요");
        	$(this).next().next().addClass("check_error");
         }else{
        	$(this).next().next().html("형식에 알맞습니다.");
          	$(this).next().next().removeClass("check_error").addClass("check_ok");
         }
      });          
      $("form").submit(function(event){
          console.log($("#wrap").children().find(".check_error").length);
          if($("#wrap").children().find(".check_error").length>0){
             $("#submitMsg").text("입력 값이 올바르지 않습니다.");
             event.preventDefault();
             return;
          }
       });
   });
</script>
</body>
</html>
