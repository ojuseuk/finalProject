<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보변경</title>
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script type="text/javascript" src="${root}/js/usr/usrInsert.js"></script>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
<div id="" class="container">
  <form action="${root}/changeUsr" method="post" id="f">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
    <div class="container">
		<label><b>아이디</b></label>
		<input type="text" id="id1" name="id" value="${requestScope.usr.id}" disabled="disabled">
		<input type="hidden" placeholder="아이디 ※ 영문+숫자 조합 6~14자 이내" class="id1" name="id" id="id1" value="${requestScope.usr.id}" required ><br>
		<span class="check_error"></span><br>
		<!-- <input type="button" id="btn_idcheck" name="btn_idcheck" value="중복확인"> -->
		
		
		<label><b>비밀번호</b></label>     
		<input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" class="pw" name="pw" id="pw1" value="${requestScope.usr.pw }" required>
		<span class="check_error"></span><br>
		   
		<label><b>비밀번호 확인</b></label>     
		<input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" class="pw2" id="pw2" required>
		<span class="check_error"></span><br>
		
		<label><b>이름</b></label>
		<input type="text" placeholder="이름" class="nm" name="nm" id="nm1"  value="${requestScope.usr.nm}" required>
		<span class="check_error"></span><br>
		
		<label><b>전화</b></label>
		<input type="text" placeholder="전화 ※ '-'없이 숫자(10~11자)만 입력" class="phone" name="phone" id="phone1"  value="${requestScope.usr.phone}" required>
		<span class="check_error"></span>
		 	
		<label><b>주소</b></label>
		<input type="text" placeholder="주소" class="addr" name="addr" id="addr1" value="${requestScope.usr.addr}" required>
		<span class="check_error"></span><br>
      
		<label><b>이메일</b></label>
		<input type="text" placeholder="이메일" class="email" name="email" id="email1"  value="${requestScope.usr.email}" required><br>
		<span class="check_error"></span><br>
      
		<div class="divJoin" style="margin-left: 85px">
			<input type="button" class="join" value="회원가입" onclick="sendIt()">
			<input type="button" class="join" onclick="location.href='main.jsp'" value="취소">
		</div>
    </div>
  </form>
</div>
<input type="hidden" id="fail" value="${requestScope.fail}">
<script>
if($("#fail").val == 'f'){
	alert("업데이트 실패");
}
// function abc(){
// 	alert(document.getElementById("name").value);
// 	alert($('[name="nm"]').val());
// 	alert($('#name').val());
// }
   /* 유효성 체크 */
 /*   $(function(){
	  var check_error=0;
      $("#pwInput").focusout(function(){
         var pw=$(this).val();
         var pwd_valid=/^[a-zA-Z0-9_-]{6,14}$/;
         var msg="";
         if(!pwd_valid.test(pw)){
        	 alert(1);
        	$(this).next().html("(6~14자 영문(대,소), 숫자)입니다.");
        	$(this).next().addClass("check_error");
         }else{
        	 $(this).next().html("비밀번호 형식에 알맞습니다.");
        	 $(this).next().removeClass("check_error").addClass("check_ok");
         }
      });
      $("#nmInput1").focusout(function(){
          var msg="";
          if($(this).val().length<2){
             $(this).next().html("이름을 올바르게 입력해 주세요.");
             $(this).next().addClass("check_error");
          }else{
        	 $(this).next().html("형식에 알맞습니다.");
        	 $(this).next().removeClass("check_error").addClass("check_ok");
          }
      });
      $("#phoneInput1").focusout(function(){
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
      $("#emailInput1").focusout(function(){
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
   });  */
   
   function sendIt2() {
	   
	   alert(111);
		let email = $('input[name=email]').val();
		let regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		let regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		let pw = $('.pw');
		let pwVal = pw.val();
		let nm = $('input[name=nm]');
		let nmVal = nm.val();
		let phone = $('input[name=phone]');
		let phoneVal = phone.val();

		// 비밀번호 입력여부 체크
		if (pwVal == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			pw.focus()
			return false;
		}
		// 비밀번호 길이 체크(4~8자 까지 허용)
		if (pwVal.length < 6 || pwVal.length > 14) {
			alert("비밀번호를 6~14자까지 입력해주세요.")
			pw.focus();
			pw.select();
			return false;
		}
		for (i = 0; i < pwVal.length; i++) {
			ch = pwVal.charAt(i)
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
				alert("비밀번호는 소문자, 숫자만 입력가능합니다.")
				pw.focus();
				pw.select();
				return false;
			}
		}

		// 비밀번호와 비밀번호 확인 일치여부 체크
		if (pwVal != $('#input[name=pw2]').val()) {
			alert("비밀번호가 일치하지 않습니다");
			$('#input[name=pw2]').val("");
			$('#input[name=pw2]').focus();
			return false;
		}

		if (email == "") {
			alert("이메일을 입력하지 않았습니다.");
			document.f.my_add.focus();
			return false;
		}

		if (regex.test(email) === false) {
			alert("잘못된 이메일 형식입니다.");
			$('input[name=email]').val("");
			$('input[name=email]').focus();
			return false;
		}
		if (nmVal == "") {
			alert("이름을 입력하지 않았습니다.");
			nm.focus();
			return false;
		}
		if (nmVal.length < 2) {
			alert("이름을 2자 이상 입력해주십시오.");
			nm.focus();
			return false;
		}

		if (phoneVal == "") {
			alert("전화번호를 입력하지 않았습니다.");
			phone.focus();
			return false;
		}

		if (phoneVal.length < 11) {
			alert("전화번호 10자 이상 입력하지않았습니다.");
			phone.focus();
			return false;
		}

		if (!regPhone.test(phoneVal)) {
			alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
			phone.focus();
			return false
		}

		$('#f').submit();
	}
</script>
</body>
</html>
