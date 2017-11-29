/**
 * 
 */
	
function sendIt() {
	let email = $('.email').val();
	let regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	let regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	let id = $('.id');
	let idVal = id.val();
	let pw = $('.pw');
	let pwVal = pw.val();
	let nm = $('.nm');
	let nmVal = nm.val();
	let phone = $('.phone');
	let phoneVal = phone.val();

	// 아이디 입력여부 검사
	if (idVal == "") {
		alert("아이디를 입력하지 않았습니다.")
		id.focus()
		return false;
	}
	// 아이디 유효성 검사 (영문소문자, 숫자만 허용)
	for (i = 0; i < idVal.length; i++) {
		ch = idVal.charAt(i)
		if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
			alert("아이디는 소문자, 숫자만 입력가능합니다.")
			id.focus();
			id.select();
			return false;
		}
	}
	// 아이디에 공백 사용하지 않기
	if (idVal.indexOf(" ") >= 0) {
		alert("아이디에 공백을 사용할 수 없습니다.")
		id.focus();
		id.select();
		return false;
	}
	// 아이디 길이 체크 (4~12자)
	if (idVal.length < 4 || idVal.length > 14) {
		alert("아이디를 4~14자까지 입력해주세요.")
		id.focus();
		id.select();
		return false;
	}
	// 비밀번호 입력여부 체크
	if (pwVal == "") {
		alert("비밀번호를 입력하지 않았습니다.")
		pw.focus()
		return false;
	}
	if (pwVal == idVal) {
		alert("아이디와 비밀번호가 같습니다.")
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
	if (pwVal != $('.pw2').val()) {
		alert("비밀번호가 일치하지 않습니다");
		$('.pw2').val("");
		$('.pw2').focus();
		return false;
	}

	if (email == "") {
		alert("이메일을 입력하지 않았습니다.");
		document.f.my_add.focus();
		return false;
	}

	if (regex.test(email) === false) {
		alert("잘못된 이메일 형식입니다.");
		$('.email').val("");
		$('.email').focus();
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

/* 유효성 체크 */
$(function(){
	  var check_error=0;
   
   $(".id").focusout(function(){
      var id=$(this).val();
      var id_valid=/^[a-z0-9_-]{6,14}$/;
      var msg="";
      if(!id_valid.test(id)){
         $(this).next().next().html("(6~14자 영문(소), 숫자)입니다.");
         $(this).next().next().removeClass("check_ok").addClass("check_error");
      }else{
         $(this).next().next().html("아이디 형식에 알맞습니다.");
         $(this).next().next().removeClass("check_error").addClass("check_ok");
      }
   });
   $(".pw").focusout(function(){
      var pw=$(this).val();
      var pwd_valid=/^[a-zA-Z0-9_-]{6,14}$/;
      var msg="";
      if(!pwd_valid.test(pw)){
     	$(this).next().html("(6~14자 영문(소), 숫자)입니다.");
     	$(this).next().removeClass("check_ok").addClass("check_error");
      }else{
     	 $(this).next().html("비밀번호 형식에 알맞습니다.");
     	 $(this).next().removeClass("check_error").addClass("check_ok");
      }
   });
   $(".pw2").focusout(function(){
	   var pw2=$(this).val();
	   var pw= $('.pw').val();
      if(pw != pw2){
       	$(this).next().html("비밀번호가 일치하지 않습니다.");
       	$(this).next().removeClass("check_ok").addClass("check_error");
        }else{
         $(this).next().html("비밀번호가 일치합니다.");
       	 $(this).next().removeClass("check_error").addClass("check_ok");
        }	  
   });
   $(".nm").focusout(function(){
       var msg="";
       if($(this).val().length<2){
          $(this).next().html("이름을 올바르게 입력해 주세요.");
          $(this).next().removeClass("check_ok").addClass("check_error");
       }else{
     	 $(this).next().html("형식에 알맞습니다.");
     	 $(this).next().removeClass("check_error").addClass("check_ok");
       }
   });
   $(".phone").focusout(function(){
      var phone_valid=/[-]/;
      var phone=$(this).val();
      var msg="";
      if($(this).val().length<10 || $(this).val().length>11){
      	$(this).next().html("10~11자 이내의 핸드폰번호를 입력해주세요.");
      	$(this).next().removeClass("check_ok").addClass("check_error");
      }else if(phone_valid.test(phone)){
     	$(this).next().html("-를 빼고 입력해주세요.");
       	$(this).next().removeClass("check_ok").addClass("check_error");
      }else{
     	$(this).next().html("형식에 알맞습니다.");
      	$(this).next().removeClass("check_error").addClass("check_ok");
      }
   });
   $(".email").focusout(function(){
      var email_validA=/[@]/;
      var email_validDot=/[.]/;
      var email=$(this).val();
      if($(this).val().length<10){
     	$(this).next().next().html("이메일의 길이가 짧습니다.");
       	$(this).next().next().removeClass("check_ok").addClass("check_error");
      }else if(!email_validA.test(email)){
     	$(this).next().next().html("@를 함께 입력해주세요");
     	$(this).next().next().removeClass("check_ok").addClass("check_error");
      }else if(!email_validDot.test(email)){
     	$(this).next().next().html(".를 함께 입력해주세요");
     	$(this).next().next().removeClass("check_ok").addClass("check_error");
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