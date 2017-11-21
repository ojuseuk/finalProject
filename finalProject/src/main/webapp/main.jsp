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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }

    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /*로그인 스타일*/
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #3333cc;
    color: white;
    padding: 10px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 50%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #5c8a8a;
}

/* Extra styles for the cancel button */
.idpwbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #5c8a8a;
}


/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 10px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 100%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
/*로그인 스타일 끝*/

/*error check*/
.check_error {
	color:red;
}
.check_ok {
	color:green;
}

  </style>
</head>
<body>
<div class="jumbotron">
  <div class="container text-center">
    <h1>HAKWON</h1>      
    <p>대학 입시, 주요 과목 특강</p>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <c:if test="${id != null }">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="${root}/viewRegist">수강신청</a></li>
        <li><a href="#">성적확인</a></li>
        <li><a href="#">출결확인</a></li>
        <li><a href="">수강과정확인</a></li>
      </ul>
      </c:if>
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${id == null }">
        <li><a href="javascript:void(0)" onclick="document.getElementById('id01').style.display='block'"><span class="glyphicon glyphicon-education"></span> 로그인</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('id02').style.display='block'"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        </c:if>
        <c:if test="${id != null }">
       	<li><a href="javascript:void(0)" onclick="document.getElementById('id03').style.display='block'"><span class="glyphicon glyphicon-user"></span>회원정보${id}</a></li>
        <li><a href="<c:url value='/logout'/>"  class="w3-bar-item w3-button w3-padding-large w3-hide-small" ><span class="glyphicon glyphicon-remove-sign"></span>로그아웃</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/kor.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/eng.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-success">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/math.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/kor12.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/eng2.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/math2.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
  </div>
</div><br><br>

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

    <div class="container" style="background-color:#f1f1f1">
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
      <input type="text" placeholder="아이디 ※ 영문+숫자 조합 6~14자 이내" name="id" id="id" required>
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
       	
      <label><b>주소</b></label>
      <input type="text" placeholder="주소" name="addr" id="addr" required>
      <span class="check_error"></span>
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
<%--  중복체크 
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_idcheck").click(function(){
			$.ajax({
				url:'/idCheck/'+$("#id").val(),
				dataType:'json',
				success:function(data){
					if(data.idcheck==true){
						$("#span_idcheck").css("color","red").html("[사용중인 아이디입니다.]");
					}else{
						$("#span_idcheck").css("color","green").html("[사용가능한 아이디입니다.]");
					}
				}
			});
		});
	});
</script> --%>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>