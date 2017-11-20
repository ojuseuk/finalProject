<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root}/js/jquery.min.js"></script>
</head>
<body>
	<input type="hidden" value='${requestScope.jsonTchr}' id="jsonTchr">
	<input type="hidden" value='${requestScope.jsonExam}' id="jsonExam">
	<select id="qzSbjtNm" name="sbjtNm">
		<option value="선택">선택</option>
	</select>
	<button onclick="qzSelect('${root}')">조회</button>
	
	
	<div id="test">
	
	</div>


	<script type="text/javascript">
		var jsonTchr = $('#jsonTchr').val();
		var jsonExam = $('#jsonExam').val();
		jsonTchr = JSON.parse(jsonTchr);
		jsonExam = JSON.parse(jsonExam);

		for (var i = 0; i < jsonTchr.length; i++) {
			$('#qzSbjtNm option:eq(0)').after(
					"<option value='"+jsonTchr[i].sbjtNm+"'>" + jsonTchr[i].sbjtNm
							+ "</option>");
		}

		function qzSelect(root) {

			var sbjtNm = $('#qzSbjtNm').val();
			xhttp = new XMLHttpRequest;
			xhttp.onreadystatechange = function() {

				if (this.readyState == 4 && this.status == 200) {

					var json = this.responseText;
					json = JSON.parse(json);
					console.log(json);
					
					var $form = $('<form action="'+root+'/tchrBs/qzInsert"></form>');
					var $select = $('<select id="qzExamId" name="examId"></select>');
					var $option1 = $('<option value="선택">선택</option>');
					var $table = $('<table border="1"></table>');
					var $submit = $('<input type="submit" value="문제 생성"></input>');
					var $hidden;
					
					var $tr1,$tr2,$tr3,$tr4; 
					var $td1,$td2,$td3,$td4,$td5,$td6,$td7,$td8;
					
					for(var i=0;i<json.length-1; i+=2){
						
						$tr1 = $('<tr></tr>');
						$tr2 = $('<tr></tr>');
						$tr3 = $('<tr></tr>');
						$tr4 = $('<tr></tr>');
						$td1 = $('<td>('+(i+1)+') '+json[i].TITLE.replace(/(?:\r\n|\r\n)/g, '<br />')+'</td>');
						$td2 = $('<td><div style="border:1px solid; padding:10px;">'+(json[i].CONTENT).replace(/(?:\r\n|\r\n)/g, '<br />')+'</div></td>');
						$td3 = $('<td>'+json[i].SOLUTION.replace(/(?:\r\n|\r\n)/g, '<br />')+'</td>');
						$td4 = $('<td>('+(i+2)+') '+json[i+1].TITLE.replace(/(?:\r\n|\r\n)/g, '<br />')+'</td>');
						$td5 = $('<td><div style="border:1px solid; padding:10px;">'+json[i+1].CONTENT.replace(/(?:\r\n|\r\n)/g, '<br />')+'</div></td>');
						$td6 = $('<td>'+json[i+1].SOLUTION.replace(/(?:\r\n|\r\n)/g, '<br />')+'</td>');
						$td7 = $('<td><br/></td>');
						$td8 = $('<td><br/></td>');
						
						$tr1.append($td1);
						$tr1.append($td4);
						$tr2.append($td2);
						$tr2.append($td5);
						$tr3.append($td3);
						$tr3.append($td6);
						$tr4.append($td7);
						$tr4.append($td8);
						
						$table.append($tr1);
						$table.append($tr2);
						$table.append($tr3);
						$table.append($tr4);
					}
					
					console.log(jsonExam);
					$select.append($option1);
					$form.append($select);
					for(var i=0;i<jsonExam.length;i++){
						$option1.after("<option value='"+jsonExam[i].examId+"'>"+jsonExam[i].examTitle+"("+jsonExam[i].examId+")</option>");
						
					}
					
					for(var i=0;i<json.length-1;i++){
						$hidden = $('<input type="hidden" name="id" value="'+json[i].ID+'">');
						$form.append($hidden);
					}
					
					$form.append($table);
					$form.append($submit);
					$('#test').append($form);
					
					
				}

			}
			xhttp.open("GET", root + "/tchrBs/qzSelect?sbjtNm=" + sbjtNm, true);
			xhttp.send();
		}
	</script>

</body>
</html>