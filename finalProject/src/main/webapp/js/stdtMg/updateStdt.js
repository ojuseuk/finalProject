var stdtInfo = $("#json").val();
	var root = $("#root").val();
	stdtInfo = JSON.parse(stdtInfo);

	$('#dataTable').DataTable({
		"scrollY" : 250,
		"scrollCollapse" : true,
		data : stdtInfo,
		columns : [ {
			"data" : "id"
		}, {
			"data" : "stdtNo",
		}, {
			"data" : "nm",
		}, {
			"data" : "addr",
		}, {
			"data" : "email",
		}, {
			"data" : "prntPhone",
		}, {
			"data" : "clssNm",
		}, {
			"data" : "retryCnt",
		}, {
			"data" : "paidDt",
		} ]
	});
	
	$("#updateBtn").click(function(){
		$('#dataTable').dataTable().fnDestroy();
		$('#dataTable').DataTable({
			"scrollY" : 250,
			"scrollCollapse" : true,
			data : stdtInfo,
			columns : [ {
				"data" : "id",
			}, {
				"data" : "stdtNo",
				"render" : function(data, type, row, meta){
					 return "<input id='stdtNo' type='hidden' name='stdtNo' value='" + row.stdtNo + "'>" + data;
					}
			}, {
				"data" : "nm",
			}, {
				"data" : "addr",
			}, {
				"data" : "email",
			}, {
				"data" : "prntPhone",
				"render" : function(data, type, row, meta){
				 return "<input id='prntPhone' type='text' name='prntPhone' value='" + row.prntPhone + "'>" + data;
				}
			}, {
				"data" : "clssNm",
				"render" : function(data, type, row, meta){
				 return "<input id='clssNm' type='text' name='clssId' value='" + row.clssId + "'>" + data;
				}
			}, {
				"data" : "retryCnt",
			}, {
				"data" : "paidDt",
			} ]
		});
		document.getElementById("updateForm").innerHTML = '<input id="saveBtn" type="submit" value="저장">';
	});