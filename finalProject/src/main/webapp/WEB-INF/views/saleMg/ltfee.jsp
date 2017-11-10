<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<div class="w3-container">
 
  <h2> 종합반 </h2>
  <table class="w3-table w3-bordered">
    <tr>
      <th>강사 이름</th>
      <th>강사 월급</th>
    </tr>
	<c:forEach items="${requestScope.listTchr}" var="tchr">
		<tr>
	      <td>${tchr.nm}</td>
	      <td>${tchr.slr}</td>
	    </tr>
    </c:forEach>
  </table>
  
  <h2> 특강반 </h2>
  <table class="w3-table w3-bordered">
    <tr>
      <th>강사 이름</th>
      <th>강사 월급</th>
    </tr>
	<c:forEach items="${requestScope.listSsn}" var="ssn">
	    <tr>
	      <td>${ssn.nm}</td>
	      <td>${ssn.slr}</td>
	    </tr>
	</c:forEach>
  </table>
</div>

</body>
</html>