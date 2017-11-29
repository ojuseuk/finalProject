	var clssInfo = $("#json").val();
	var root = $("#root").val();
	clssInfo = JSON.parse(clssInfo);

	$('#dataTable').DataTable({
		"scrollY" : 250,
		"scrollCollapse" : true,
		data : clssInfo,
		columns : [ {
			"data" : "clssNm"
		}, {
			"data" : "nm"
		}, {
			"data" : "strtDt",
			"render" : function(data, type, row, meta){
				return data + "~" + row.endDt;
			}
		}, {
			"data" : "paidDt"
		}, {
			"data" : "clssroom"
		} ]
	});