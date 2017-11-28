<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hakwon example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script type="text/javascript" src="${root}/js/usr/usrInsert.js"></script>
<!-- banner style -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;}
</style>
</head>
<body>
<jsp:include page="top.jsp"/>


<!-- Sidebar left   -->
<div class="w3-sidebar  w3-bar-block" style="width:15%; background-color: #ffffff;">
  <h3 class="w3-bar-item">EVENT</h3>
  <img class="w3-padding" src="./imgs/img/event1.jpg"  >  
</div>
<!-- Sidebar right -->
<div class="w3-sidebar w3-bar-block " style="width:15%;right:0; background-color: #ffffff;">
  <h3 class="w3-bar-item">EVENT</h3>
  <img class="w3-padding" src="./imgs/img/event2.gif"  >
</div>

<br>
<br>
<!-- banner start -->
<div class="w3-content" style="max-width:500px;">
  <img class="mySlides" src="./imgs/img/k750490.png" style="width:500px; height: 300px;">
  <img class="mySlides" src="./imgs/img/c750490.png" style="width:500px; height: 300px;"> 	
  <img class="mySlides" src="./imgs/img/m750490.png" style="width:500px; height: 300px;">
  <img class="mySlides" src="./imgs/img/e750490.png" style="width:500px; height: 300px;">
</div>


<script type="text/javascript">
var slideIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none"; 
    }
    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1} 
    x[slideIndex-1].style.display = "block"; 
    setTimeout(carousel, 2000); 
}
</script>
<!-- banner end -->

<div class="container">  
  <div class="row">
         
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/k1.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/e1.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
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
      <div class="panel panel-primary">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/k2.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/e3.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/m2.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
       
  </div>
 </div>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/k3.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/e4.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/m3.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
       
  </div>
 </div>

<!-- 모달 시작 -->
<!-- 로그인 -->
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="${root}/login" method="post">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
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

    <div class="container" style="background-color:#f1f1f1">
    </div>
  </form>
</div>


<!-- 회원가입 -->
<div id="id02" class="modal" style="overflow: scroll;">
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content animate" action="${root}/userInsert.do" method="post" id="f">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
    <div class="container">
      <label><b>아이디</b></label>
      <input type="hidden" name="command" value="join">
      <input type="text" placeholder="아이디 ※ 영문+숫자 조합 6~14자 이내" class="id1" name="id" id="id1" class="id" required >
      <br>
      <span class="check_error"></span>
      <br>
      <!-- <input type="button" id="btn_idcheck" name="btn_idcheck" value="중복확인"> -->
	 

      <label><b>비밀번호</b></label>     
      <input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" class="pw" name="pw" id="pw1" required>
      <span class="check_error"></span>
      <br>
      
	  <label><b>비밀번호 확인</b></label>     
      <input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" class="pw2" id="pw2" name="pw2" required>
      <span class="check_error"></span>
      <br>

      <label><b>이름</b></label>
      <input type="text" placeholder="이름" class="nm" name="nm" id="nm1" required>
      <span class="check_error"></span>
      <br>
      
      <label><b>전화</b></label>
      <input type="text" placeholder="전화 ※ '-'없이 숫자(10~11자)만 입력" class="phone" name="phone" id="phone1" required>
      <span class="check_error"></span>
      <br>
       	
      <label><b>주소</b></label>
      <input type="text" placeholder="주소" class="addr" name="addr" id="addr1" required>
      <span class="check_error"></span>
      <br>
      
      <label><b>이메일</b></label>
      <input type="text" placeholder="이메일" class="email" name="email" id="email1" required><br>
      <span class="check_error"></span>
      <br>
      
	  <div class="clearfix">
<!--         <button type="submit" class="signupbtn" style="width: 50%;"  onclick="sendit()">회원가입</button><br> -->
        <input type="button" value="회원가입" onclick="sendIt()"> 
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn" style="width: 19%;">취소</button>
      </div>
    </div>
  </form>
</div>

<!-- 모달 끝 -->
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

<!-- banner script -->
<script type="text/javascript">

</script>


<jsp:include page="footer.jsp"/>

</body>
</html>


