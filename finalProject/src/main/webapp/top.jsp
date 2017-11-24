<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</head>

<div style="background-color: #eee">
  <div class="container text-center">
  
    <p>대학 입시, 주요 과목 특강</p>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    
      <a class="navbar-brand" href="${root}/main.jsp">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
 
      <ul class="nav navbar-nav">
        <li><a href="${root}/viewRegist">수강신청</a></li>
        <li><a href="${root}/myScr">성적확인</a></li>
        <li><a href="${root}/myAttnd">출결확인</a></li>
        <li><a href="${root}/myClssList">수강과정확인</a></li>
      </ul>
      </c:if>
   
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
    
   
        <li><a href="javascript:void(0)" onclick="document.getElementById('id01').style.display='block'"><span class="glyphicon glyphicon-education"></span> 로그인</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('id02').style.display='block'"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        </c:if>
        <c:if test="${id != null}">
    
        </c:if>
      </ul>
    </div>
  </div>
  
  
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