<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/styles/main/top.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%-- <link rel="stylesheet" href="${root}/styles/main/topBoot.css" /> --%>
</head>
<style>
div.backgroundTop {
	background: url('${root}/imgs/img/back.png') no-repeat center center;
	cursor: pointer;
	height: 200px;
}
.title {
	font-size: 50px;
	color: #ffffff;
}
.subtitle {
	font-size: 20px;
	color: #ffffff;
}
body {
	background-color: #f2f4f7;
}
nav.menu{
	background: #ffffff;
	color: #000000;
	border-color: #898989;	
}
#fontBlack{
	color : black;
}
</style>
<body>
<div class="backgroundTop">
  <div class="container text-center">
  	<div class="brain"></div>
    <p class="title" style="margin-top: 23px">Royal Academy<img src="${root}/imgs/img/brain2.png" style="max-width: 80px; margin-bottom: 20px"></p>      
    <p class="subtitle">대학 입시, 주요 과목 단과</p>
  </div>
</div>
<nav class="menu" style="border: 1px solid #ccc">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${root}/main.jsp"><font color="#000000">Home</font></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.nm" var ="nm"/>
	  
	  <sec:authorize access="hasAnyRole('ROLE_ST', 'ROLE_USR')">		 
      <ul class="nav navbar-nav">
        <li><a href="${root}/viewRegist" id="fontBlack">수강신청</a></li>
        <li><a href="${root}/myScr" id="fontBlack">성적확인</a></li>
        <li><a href="${root}/myAttnd" id="fontBlack">출결확인</a></li>
        <li><a href="${root}/myClssList" id="fontBlack">수강과정확인</a></li>
        <li><a href="${root}/homeP/qnaSelectView" id="fontBlack">댓글 게시판 목록</a></li>
        <li><a href="${root}/ntcList" id="fontBlack">공지사항</a></li>
      </ul>
      </sec:authorize>
      
      <sec:authorize access="hasRole('ROLE_STAFF')">
      <ul class="nav navbar-nav">
        <li><a href="${root}/mgTchr" id="fontBlack">강사 관리</a></li>
        <li><a href="${root}/stdtAllList" id="fontBlack">학생 관리</a></li>
        <li><a href="${root}/saleMg/manager" id="fontBlack">매출 관리</a></li>
        <li><a href="${root}/course" id="fontBlack">과정 관리</a></li>
        <li><a href="${root}/mgClss" id="fontBlack">강좌 관리</a></li>
        <li><a href="${root}/testSMS" id="fontBlack">문자 발송</a></li>
        <li><a href="${root}/emp" id="fontBlack">직원 관리</a></li>
        <li><a href="${root}/ntcInsertView" id="fontBlack">공지사항 등록</a></li>
        <li><a href="${root}/homeP/qnaSelectView" id="fontBlack">댓글 게시판 목록</a></li>
        <li><a href="${root}/ntcList" id="fontBlack">공지사항</a></li>
        </ul>
      </sec:authorize>
      
      <sec:authorize access="hasRole('ROLE_TCHR')">
      <ul class="nav navbar-nav">
        <li><a href="${root}/tchrBs/qzView" id="fontBlack">문제 생성</a></li>
        <li><a href="${root}/tchrBs/attnd" id="fontBlack">출석 확인</a></li>
        <li><a href="${root}/tchrBs/srcIn" id="fontBlack">성적 입력</a></li>
        <li><a href="${root}/tchrBs/stSearch" id="fontBlack">학생 성적 확인</a></li>
        <li><a href="${root}/tchrBs/qzSelectView" id="fontBlack">시험 출제</a></li>
        <li><a href="${root}/homeP/qnaSelectView" id="fontBlack">댓글 게시판 목록</a></li>
      </ul>
      </sec:authorize>
      
</sec:authorize>
      <ul class="nav navbar-nav navbar-right">
        <sec:authorize access="isAnonymous()">
        <li><a href="javascript:void(0)" onclick="document.getElementById('id01').style.display='block'" id="fontBlack">
        <span class="glyphicon glyphicon-education"></span> 로그인</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('id02').style.display='block'" id="fontBlack">
        <span class="glyphicon glyphicon-user"></span>회원가입</a></li>
		</sec:authorize>
	<sec:authorize access="isAuthenticated()">
       	<li><a href="javascript:void(0)" onclick="document.getElementById('id03').style.display='block'" id="fontBlack">
       	<span class="glyphicon glyphicon-user"></span><sec:authentication property="principal.nm" />님</a></li>
        <li><a href="javascript:logout();"  class="w3-bar-item w3-button w3-padding-large w3-hide-small"  id="fontBlack">
        <span class="glyphicon glyphicon-remove-sign"></span>로그아웃</a></li>
	</sec:authorize>
      </ul>
    </div>
  </div>

</nav>

<!-- 회원정보 -->
<div id="id03" class="modal">
  <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content animate" action="${root}/userInsert.do" method="post">
    <div class="containerInfo">
      <div class="InfoContainer">
        <button type="button" class="signupbtn"  onclick="location.href='<c:url value="inputUsrInfo"/>'">회원정보변경</button><br>
        <button type="button" class="signupbtn"  onclick="location.href='<c:url value="delUser"/>'">회원탈퇴</button><br>
        <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn" style="width: 19%;">취소</button>
      </div>
    </div>
  </form>
</div>

<form id="logoutForm" action="${root}/logout" method="post" style="display: none">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<script>
	function logout() {
		document.getElementById("logoutForm").submit();
	}
</script>
</body>
</html>