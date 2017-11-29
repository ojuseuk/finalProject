<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 모달 시작 -->
	<!-- 로그인 -->
	<div id="id01" class="modal">

		<form class="modal-content animate" action="${root}/login" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

			<div class="containerInfo">
				<div class="imgcontainer">
					<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">
						<img alt="팝업 닫기" src="${root}/imgs/login/pop_btn_close.gif">
					</span>
				</div>
				<div class="InfoContainer">
					<h2>
					<img src="${root}/imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="50" height="50" style="margin-bottom: 10px">
					<strong>Royal Academy 로그인</strong>
					</h2>
					
					<label><b>아이디</b></label>
					<input type="hidden" name="command" value="userLogin"> 
					<input type="text"  placeholder="아이디" name="id" id="id1" required><br> 
					<label><b>비밀번호</b></label>
					<input type="password" placeholder="비밀번호" name="pw" id="pw1"required><br>
					<button type="submit" class="submit">로그인</button><br>
					<div class="login_mbr">
						<a href="javascript:;" onclick="document.getElementById('id01').style.display='none'">취소</a>
						&nbsp;&nbsp; | &nbsp;
						<a href="${root}/idpwfind">아이디/비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</form>
	</div>


	<!-- 회원가입 -->
	<div id="id02" class="modal">
		<form class="modal-content2 animate" action="${root}/userInsert.do" method="post" id="f">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="containerInfo">
				<div class="imgcontainer">
					<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">
						<img alt="팝업 닫기" src="${root}/imgs/login/pop_btn_close.gif">
					</span>
				</div>
				<div class="InfoContainer">
					<h2>
					<img src="${root}/imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="50" height="50" style="margin-bottom: 10px">
					<strong>Royal Academy 회원 가입</strong>
					</h2>
					<label><b>아이디</b></label>
					<input type="text" placeholder="아이디 ※ 영문+숫자 조합 6~14자 이내" name="id" id="id1" class="id" required><br> 
					<span class="check_error"></span> <br>
					<!-- <input type="button" id="btn_idcheck" name="btn_idcheck" value="중복확인"> -->
	
					<label><b>비밀번호</b></label>
					<input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" class="pw" name="pw" id="pw1" required>
					<span class="check_error"></span> <br>
	
					<label><b>비밀번호 확인</b></label>
					<input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" class="pw2" id="pw2" name="pw2" required>
					<span class="check_error"></span> <br>
	
					<label><b>이름</b></label>
					<input type="text" placeholder="이름"class="nm" name="nm" id="nm1" required>
					<span class="check_error"> </span> <br>
					
					<label><b>전화</b></label>
					<input type="text" placeholder="전화 ※ '-'없이 숫자(10~11자)만 입력" class="phone" name="phone" id="phone1" required>
					<span class="check_error"></span> <br>
					<label><b>주소</b></label>
					<input type="text" placeholder="주소" class="addr" name="addr" id="addr1" required>
					<span class="check_error"></span> <br>
					<label><b>이메일</b></label>
					<input type="text" placeholder="이메일" class="email" name="email" id="email1" required><br>
					<span class="check_error"></span>
					<div class="divJoin">
						<input type="button" class="join" value="회원가입" onclick="sendIt()">
						<input type="button" class="join" onclick="document.getElementById('id02').style.display='none'" value="취소">
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- 모달 끝 -->
	
</body>
</html>