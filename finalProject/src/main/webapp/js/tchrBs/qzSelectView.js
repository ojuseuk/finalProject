/**
 * 
 */

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
			var $tableInput = $('<table></table>');
			var $select = $('<select class="form-control" style="width:100px; float: left;" id="examTp" name="examTp"></select>');
			var $option1 = $('<option value="선택">선택</option>');
			var $input1 = $('<input class="form-control" style="width:100px; float: left;" type="text" name="examTitle">');
			var $input2 = $('<input class="form-control" style="width:100px; float: left;" type="date" name="examDt">');
			var $trInput1 = $('<tr></tr>');
			var $trInput2 = $('<tr></tr>');
			var $trInput3 = $('<tr></tr>');
			
			var $tdInput1 = $('<td><span class="input-group-addon" style="width:200px">시험 이름</span></td>');
			var $tdInput11 = $('<td></td>');
			var $tdInput2 = $('<td><span class="input-group-addon" style="width:200px">시험 날짜</span></td>');
			var $tdInput22 = $('<td></td>');
			var $tdInput3 = $('<td><span class="input-group-addon" style="width:200px">시험 종류</span></td>');
			var $tdInput33 = $('<td></td>');
			
			$tdInput11.append($input1);
			$tdInput22.append($input2);
			$tdInput33.append($select);
			
			$trInput1.append($tdInput1);
			$trInput1.append($tdInput11);
			$trInput2.append($tdInput2);
			$trInput2.append($tdInput22);
			$trInput3.append($tdInput3);
			$trInput3.append($tdInput33);
			
			$tableInput.append($trInput1);
			$tableInput.append($trInput2);
			$tableInput.append($trInput3);
			var $div = $('<div></div>');
			var $table = $('<table ></table>');
			var $submit = $('<input class="w3-button w3-round-large w3-teal" style="background-color: #90909096" type="submit" value="문제 생성"></input>');
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
			
			for(var i=0;i<jsonExam.length;i++){
				$option1.after("<option value='"+jsonExam[i].CDID+"'>"+jsonExam[i].CDNM+"("+jsonExam[i].CDID+")</option>");
				
			}
			
			for(var i=0;i<json.length-1;i++){
				$hidden = $('<input type="hidden" name="id" value="'+json[i].ID+'">');
				$form.append($hidden);
			}
			
			$form.append($tableInput);
			$div.append($table);
			$form.append($div);
			$form.append($submit);
			$('#test').append($form);
			
		}

	}
	xhttp.open("GET", root + "/tchrBs/qzSelect?sbjtNm=" + sbjtNm, true);
	xhttp.send();
}