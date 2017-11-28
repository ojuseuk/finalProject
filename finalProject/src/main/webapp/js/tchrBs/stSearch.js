/**
 * 
 */

var json = $('#json').val();

json = JSON.parse(json);

// 		$("#search tr:eq(0)").after("<tr><td colspan='5' style='text-align: center;''>학생 정보가 없습니다.</td></tr>");		
for(var i=0;i<json.length;i++){
	$("#clss option:eq(0)").after("<option value='" + json[i] + "'>" + json[i] + "</option>");
}

function stSearch(root){
	
	var clssId = $('#clss').val();
	var xhttp = new XMLHttpRequest();
	$("table[id='search'] tr").not("[id='default']").remove();
	if(clssId == '선택'){
		$("#search tr:eq(0)").after("<tr><td colspan='5' style='text-align: center;''>학생 정보가 없습니다.</td></tr>");
	}
	xhttp.onreadystatechange = function(){
		
		if(this.readyState == 4 && this.status == 200){
			var json = this.responseText;
			json = JSON.parse(json);
			
			var $table = $('<table class="w3-table w3-bordered"></tbale>');
			var $tr;
			var $td1, $td2, $td3, $td4, $td5;
			for(var i=0;i<json.length;i++){
				$tr = $('<tr></tr>');
				$td1 = $('<td></td>');
				$td2 = $('<td></td>');
				$td3 = $('<td></td>');
				$td4 = $('<td></td>');
				$td5 = $('<td></td>');
				
				$td1.append(json[i].STDTNO);
				$td2.append(json[i].NM);
				$td3.append(json[i].EXAMTITLE);
				$td4.append(json[i].SBJTNM);
				$td5.append(json[i].SCORE);
				
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3);
				$tr.append($td4);
				$tr.append($td5);
				$('#search tr:eq(0)').after($tr);
// 						$table.append($tr);
						
			}
			
		}
		
	}
	
	xhttp.open("GET", root+"/tchrBs/stClssSearch?clssId="+clssId, true);
	xhttp.send();
		
}