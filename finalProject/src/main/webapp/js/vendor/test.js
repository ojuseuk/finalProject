/*!
 * Start Bootstrap - SB Admin v4.0.0-beta.2 (https://startbootstrap.com/template-overviews/sb-admin)
 * Copyright 2013-2017 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-sb-admin/blob/master/LICENSE)
 */
$(document).on("click","#searchSale",function(){
	$('#dataTable').DataTable({
		data : saleList,
		columns : [ {
			data : "no"
		}, {
			data : "year"
		}, {
			data : "month"
		}, {
			data : "day"
		}, {
			data : "costItem"
		}, {
			data : "amount"
		} ]
	});
});