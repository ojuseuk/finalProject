<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function checkValid() {
    var f = window.document.writeForm;
		
	if ( f.content.value == "") {
	    alert( "���ڳ����� �Է��ϼ���." );
		return false;
    }
	if ( f.content.length > 80){
		alert( "80byte�� �ʰ��� �� �����ϴ�.");
		return false;
	}
    return true;
}
</script>
<body>
<form name="writeForm" method="post" action="${pageContext.request.contextPath}/sendSms" onSubmit='return checkValid()'>

<table align="center" cellpadding="5" cellspacing="2" width="600" border="1">

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#336699">
            <p align="center"><font color="white" size="3"><b>���ڹ߼�</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">�� ��</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="content" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">&nbsp;</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;"><input type=submit value=����> 
        <input type=reset value=�ٽþ���></span></b></td>
    </tr>
</table>
</body>
</html>