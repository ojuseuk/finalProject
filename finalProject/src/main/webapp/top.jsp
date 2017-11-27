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
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script type="text/javascript" src="${root}/js/usr/usrInsert.js"></script>
</head>
<body>
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
        <li><a href="${root}/saleMg/manager">매출 관리</a></li>
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
      <input type="text" placeholder="아이디 ※ 영문+숫자 조합 6~14자 이내" name="id" id="id" required >
      <br>
      <span class="check_error"></span>
      <br>
      <!-- <input type="button" id="btn_idcheck" name="btn_idcheck" value="중복확인"> -->
	 

      <label><b>비밀번호</b></label>     
      <input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" name="pw" id="pw" required>
      <span class="check_error"></span>
      <br>
      
	  <label><b>비밀번호 확인</b></label>     
      <input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" id="pw2" required>
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
<!--         <button type="submit" class="signupbtn" style="width: 50%;"  onclick="sendit()">회원가입</button><br> -->
        <input type="button" value="회원가입" onclick="sendIt()"> 
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
        <button type="button" class="signupbtn" style="width: 80%;" onclick="location.href='<c:url value="inputUsrInfo"/>'">회원정보변경</button><br>
        <button type="button" class="signupbtn" style="width: 80%;" onclick="location.href='<c:url value="delUser"/>'">회원탈퇴</button><br>
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