<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${root}/styles/vendor/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문자 발송</title>
</head>
<script type="text/javascript">
	function checkValid() {
		var f = window.document.writeForm;
		console.log(f.content.value.length);
		if (f.content.value == "") {
			alert("문자내용을 입력하세요.");
			return false;
		}
		if (f.content.value.length > 80) {
			alert("80byte를 초과할 수 없습니다.");
			return false;
		}
		return true;
	}
</script>
<body>
<jsp:include page="../../../top.jsp"/>
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
            <p align="right">내  용</p>
        </td>
        <td width="450" height="20">
		<textarea name="content" cols="50" rows="10" maxlength="80"></textarea></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right">&nbsp;</p>
        </td>
        <td width="450" height="20">
        <input type=submit value="전 송">
        <input type=reset value="다시쓰기">
   		<input type="button" name="command" value="지각안내" onClick="location.href='${pageContext.request.contextPath}/sendSms?command=late'"/>
   	 </td>
    </tr>
</table>
</form>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>