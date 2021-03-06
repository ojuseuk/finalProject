<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${root}/styles/vendor/bootstrap/bootstrap.min.css" /> --%>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문자 발송</title>
</head>
<script src="${root}/js/stdtMg/sendSMS.js"></script>
<body>
<jsp:include page="../../../top.jsp"/>
<div style="width: 80%; margin: auto;">
	<form name="writeForm" method="post" action="${pageContext.request.contextPath}/sendSms" onSubmit='return checkValid()'>
		<input type="hidden" name="command" value="notice"/>
			<table class="table table-bordered" align="center" cellpadding="5" cellspacing="2" width="50%" height="50%" border="1">
	   		<tr>
	        	<td width="1220" height="20" colspan="2" align="center">
	        	    <h2>문자발송</h2>
	       		</td>
	   		</tr>
	    	<tr>
	      		<td width="150" height="20">
	            	<p align="right"><span class="input-group-addon" style="width:100px">내  용</span></p>
	       		</td>
	       		<td width="450" height="20">
					<textarea class="form-control" style="width:700px" name="content" cols="50" rows="10" maxlength="80"></textarea>
				</td>
	   	 	</tr>
	    	<tr>
	        	<td width="150" height="20">
	           		<p align="right">&nbsp;</p>
	       		 </td>
	        <td width="450" height="20">
	        <input class="w3-button w3-round w3-teal" type=submit value="전 송">
	        &nbsp;
	        <input class="w3-button w3-round w3-teal" type=reset value="다시쓰기">
	   		&nbsp;
	   		<input class="w3-button w3-round w3-teal" type="button" name="command" value="지각통보" onClick="location.href='${pageContext.request.contextPath}/sendSms?command=late'"/>
	   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	   		</td>
	    </tr>
		</table>
	</form>
</div>
<%-- <jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>