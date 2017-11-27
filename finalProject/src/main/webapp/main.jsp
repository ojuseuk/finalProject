<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hakwon example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
<jsp:include page="top.jsp"/>




<div class="container">  
 
  <div class="row">
         
    <div class="col-sm-4">
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/k1.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/e1.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/m1.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/k2.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/e3.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/m2.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
       
  </div>
 </div>

<!-- 로그인 -->
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="${root}/userLogin.do" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <label><b>아이디</b></label>
      <input type="hidden" name="command" value="userLogin">
      <input type="text" placeholder="아이디" name="id" required>
	   <br>
      <label><b>비밀번호</b></label>
      <input type="password" placeholder="비밀번호" name="pw" required><br>
      <%-- <div id="div_Check" style="font-weight: bold;color:red;">${login_errMsg }</div>  --%>
      <button type="submit">로그인</button><br>
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
      <button type="button" class="idpwbtn" onclick="location.href='<c:url value="/idpwfind"/>'">아이디/비밀번호 찾기</button>
    </div>

  </form>
</div>


<!-- 회원가입 -->
<div id="id02" class="modal">
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content animate" action="${root}/userInsert.do" method="post">
    <div class="container">
      <label><b>아이디</b></label>
      <input type="hidden" name="command" value="join">
      <input type="text" placeholder="아이디 ※ 영문+숫자 조합 6~14자 이내" name="id" id="id" required >
      <br>
      <span class="check_error"></span>
      <br>
      <!-- <input type="button" id="btn_idcheck" name="btn_idcheck" value="중복확인"> -->
	 

      <label><b>비밀번호</b></label>     
      <input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" name="pw" id="pw" required>
      <span class="check_error"></span>
      <br>

      <label><b>이름</b></label>
      <input type="text" placeholder="이름" name="nm" id="nm" required>
      <span class="check_error"></span>
      <br>
     
      
      <label><b>전화</b></label>
      <input type="text" placeholder="전화 ※ '-'없이 숫자(10~11자)만 입력" name="phone" id="phone" required>
      <span class="check_error"></span>
      <br>
       	
      <label><b>주소</b></label><br>
      <input type="text" placeholder="주소" name="addr" id="addr" required>
      <!--  <input type="text" id="sample6_postcode" placeholder="우편번호">
	  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
      <input type="text" id="sample6_address" placeholder="주소">
      <input type="text" id="sample6_address2" placeholder="상세주소"> -->
      <br>
      
      <label><b>이메일</b></label>
      <input type="text" placeholder="이메일" name="email" id="email" required><br>
      <span class="check_error"></span>
      <br>
      
	  <div class="clearfix">
        <button type="submit" class="signupbtn" style="width: 50%;">회원가입</button><br>
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn" style="width: 19%;">취소</button>
      </div>
    </div>
  </form>
</div>

<!-- 회원정보 -->
<div id="id03" class="modal">
  <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content animate" action="${root}/userInsert.do" method="post">
    <div class="container">
      <div class="clearfix">
        <button type="button" class="signupbtn" style="width: 80%;" onclick="location.href='<c:url value="delUser"/>'">회원탈퇴</button><br>
        <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn" style="width: 19%;">취소</button>
      </div>
    </div>
  </form>
</div>

<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script>
   /* 유효성 체크 */
   $(function(){
	  var check_error=0;
      
      $("#id").focusout(function(){
         var id=$(this).val();
         var id_valid=/^[a-z0-9_-]{6,14}$/;
         var msg="";
         if(!id_valid.test(id)){
            $(this).next().next().html("(6~14자 영문(소), 숫자)입니다.");
            $(this).next().next().addClass("check_error");
         }else{
            $(this).next().next().html("아이디 형식에 알맞습니다.");
            $(this).next().next().removeClass("check_error").addClass("check_ok");
         }
      });
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


<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<!-- Container (The Band Section) -->
<div id="Royal Academy" class="container text-center">
  <h3>Royal Academy</h3>
  <p>  
            저희 학원은 학생들 개개인의 사고와 응용력을 파악하고 이에 맞는 개인별 학습을  할 수 있도록 합니다.<br>
            학생들의 수준에 맞는 학습 설계와 콘텐츠 제공을 통해 효율적인 성적상승의 결과물을 볼 수 있습니다.<br>
            다양한 응용과 심화된 학습콘텐츠로 목표하는 바를 이룰 수 있도록  하겠습니다.    
  </p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="./imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
     
    </div>
    <div class="col-sm-4">
      <p class="text-center"></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="./imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      
    </div>
    <div class="col-sm-4">
      <p class="text-center"></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="./imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
     
    </div>
  </div>
</div>



<!-- Add Google Maps -->
<h1>학원위치</h1>
<div id="map" style="width:100%;height:400px;">
</div>


<!-- 구글 지도 -->
<script>

function myMap() {

        var uluru = {lat: 37.4787713, lng: 126.8810822};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
 
	}

</script>
<!-- 구글 지도 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>

<jsp:include page="footer.jsp"/>

</body>
</html>


