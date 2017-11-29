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
</head>
<body>
<div style="background-color: #e6e6ff; height: 200px;">
  <div class="container text-center">
    <h1><img src="${root}/imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="50" height="50" style="margin-bottom: 10px">&nbsp; Royal Academy</h1>      
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
      <a class="navbar-brand" href="${root}/main.jsp">Logo</a>
      <a class="navbar-brand" href="${root}/main.jsp">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.nm" var ="nm"/>
	  
	  <sec:authorize access="hasAnyRole('ROLE_ST', 'ROLE_USR')">		 
      <ul class="nav navbar-nav">
        <li><a href="${root}/viewRegist">수강신청</a></li>
        <li><a href="${root}/myScr">성적확인</a></li>
        <li><a href="${root}/myAttnd">출결확인</a></li>
        <li><a href="${root}/myClssList">수강과정확인</a></li>
        <li><a href="${root}/homeP/qnaSelectView">댓글 게시판 목록</a></li>
        <li><a href="${root}/ntcList">공지사항</a></li>
      </ul>
      </sec:authorize>
      
      <sec:authorize access="hasRole('ROLE_STAFF')">
      <ul class="nav navbar-nav">
        <li><a href="${root}/mgTchr">강사 관리</a></li>
        <li><a href="${root}/stdtAllList">학생 관리</a></li>
        <li><a href="${root}/saleMg/manager">매출 관리</a></li>
        <li><a href="${root}/course">과정 관리</a></li>
        <li><a href="${root}/mgClss">강좌 관리</a></li>
        <li><a href="${root}/testSMS">문자 발송</a></li>
        <li><a href="${root}/emp">직원 관리</a></li>
        <li><a href="${root}/ntcInsertView">공지사항 등록</a></li>
        <li><a href="${root}/homeP/qnaSelectView">댓글 게시판 목록</a></li>
        <li><a href="${root}/ntcList">공지사항</a></li>
        </ul>
      </sec:authorize>
      
      <sec:authorize access="hasRole('ROLE_TCHR')">
      <ul class="nav navbar-nav">
        <li><a href="${root}/tchrBs/qzView">문제 생성</a></li>
        <li><a href="${root}/tchrBs/attnd">출석 확인</a></li>
        <li><a href="${root}/tchrBs/srcIn">성적 입력</a></li>
        <li><a href="${root}/tchrBs/stSearch">학생 성적 확인</a></li>
        <li><a href="${root}/tchrBs/qzSelectView">시험 출제</a></li>
        <li><a href="${root}/homeP/qnaSelectView">댓글 게시판 목록</a></li>
      </ul>
      </sec:authorize>
      
</sec:authorize>
      <ul class="nav navbar-nav navbar-right">
        <sec:authorize access="isAnonymous()">
        <li><a href="javascript:void(0)" onclick="document.getElementById('id01').style.display='block'"><span class="glyphicon glyphicon-education"></span> 로그인</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('id02').style.display='block'"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
		</sec:authorize>
	<sec:authorize access="isAuthenticated()">
       	<li><a href="javascript:void(0)" onclick="document.getElementById('id03').style.display='block'"><span class="glyphicon glyphicon-user"></span><sec:authentication property="principal.nm" />님</a></li>
        <li><a href="javascript:logout();"  class="w3-bar-item w3-button w3-padding-large w3-hide-small" ><span class="glyphicon glyphicon-remove-sign"></span>로그아웃</a></li>
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