<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
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

    /*로그인 스타일*/
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 40%;
    padding: 10px 15px;
    margin: 4px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #ccffff;
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
    background-color: #e0ebeb;
}

/* Extra styles for the cancel button */
.idpwbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #e0ebeb;
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
    position: center; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 80%; /* Full width */
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
    width: 90%; /* Could be more or less, depending on screen size */
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</head>
<body  id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<div style="background-color: #eee">
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
      <a class="navbar-brand" href="${root}/main.jsp"><img src="./imgs/img/mark3.png" width="30" height="30"></a>
      <a class="navbar-brand" href="${root}/main.jsp">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <c:if test="${id != null}">
      <ul class="nav navbar-nav">
        <li><a href="${root}/viewRegist">수강신청</a></li>
        <li><a href="${root}/myScr">성적확인</a></li>
        <li><a href="${root}/myAttnd">출결확인</a></li>
        <li><a href="${root}/myClssList">수강과정확인</a></li>
      </ul>
      </c:if>
      <c:if test="${staff != null }">
       <ul class="nav navbar-nav">
        <li><a href="${root}/mgTchr">강사 관리</a></li>
        <li><a href="${root}/stdtAllList">학생 관리</a></li>
        <li><a href="${root}/saleMg/manager">매출 관리</a></li>
        <li><a href="${root}/course">과정 관리</a></li>
        <li><a href="${root}/mgClss">강좌 관리</a></li>
        <li><a href="${root}/testSMS">문자 발송</a></li>
        <li><a href="${root}/emp">직원 관리</a></li>
        </ul>
      </c:if>
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${id == null && staff == null }">
        <li><a href="javascript:void(0)" onclick="document.getElementById('id01').style.display='block'"><span class="glyphicon glyphicon-education"></span> 로그인</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('id02').style.display='block'"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        </c:if>
        <c:if test="${id != null}">
       	<li><a href="javascript:void(0)" onclick="document.getElementById('id03').style.display='block'"><span class="glyphicon glyphicon-user"></span>${id}</a></li>
        <li><a href="<c:url value='/logout'/>"><span class="glyphicon glyphicon-remove-sign"></span>로그아웃</a></li>
        </c:if>
        <c:if test="${staff != null}">
       	<li><a href="javascript:void(0)" onclick="document.getElementById('id03').style.display='block'"><span class="glyphicon glyphicon-user"></span>${staff}</a></li>
        <li><a href="<c:url value='/logout'/>"><span class="glyphicon glyphicon-remove-sign"></span>로그아웃</a></li>
        </c:if>
      </ul>
    </div>
  </div>
  
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
</nav>
</body>
</html>