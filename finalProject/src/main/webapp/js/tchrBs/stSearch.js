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
			
			var table = $('#dataTable').DataTable({
				
				"processing" : true,
				"ordering" : false,
				"select" : {
					style : 'os',
					items:'cell'
				},
				"data" : json,
				"columns" : [{
					"data" : "STDTNO",

				},{
					"data" : "NM",

				},{
					"data" : "EXAMTITLE",

				},{
					"data" : "SBJTNM",

				},{
					"data" : "SCORE",

				}]
			});
			
		}
		
	}
	
	xhttp.open("GET", root+"/tchrBs/stClssSearch?clssId="+clssId, true);
	xhttp.send();
		
}