<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="${root}/styles/vendor/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<body>

	<div class="w3-container">
		<h2>게시판 목록</h2>
		<input type="hidden" value='${requestScope.json}' id="json">

		<div style="width: 100%;">
			<div id="demo" class="card mb-3" align="left"
				style="float: left; width: 50%">
				<div class="card-body">
					<div class="table-responsive">
						<table class="w3-table w3-bordered" id="dataTable">
							<thead>
								<tr>
									<th>게시판 번호</th>
									<th>게시판 제목</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var json = $('#json').val()
		json = JSON.parse(json);

		console.log(json);

		function format(d) {
			// `d` is the original data object for the row
			return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'
					+ '<tr>'
					+ '<td>Full name:</td>'
					+ '<td>'
					+ d.name
					+ '</td>'
					+ '</tr>'
					+ '<tr>'
					+ '<td>Extension number:</td>'
					+ '<td>'
					+ d.extn
					+ '</td>'
					+ '</tr>'
					+ '<tr>'
					+ '<td>Extra info:</td>'
					+ '<td>And any further details here (images etc)...</td>'
					+ '</tr>' + '</table>';
		}

		var table = $('#dataTable').DataTable({
			"scrollY" : 250,
			"scrollCollapse" : true,
			data : json,
			columns : [ {
				"className" : 'details-control',
				"orderable" : false,
				"data" : null,
				"defaultContent" : ''
			}, {
				"data" : "no"
			}, {
				"data" : "title"
			}, {
				"data" : "id"
			} ],
			"order" : [ [ 1, 'asc' ] ]
		});

		$('#dataTable tbody').on('click', 'td.details-control', function() {
			var tr = $(this).closest('tr');
			var row = table.row(tr);

			if (row.child.isShown()) {
				// This row is already open - close it
				row.child.hide();
				tr.removeClass('shown');
			} else {
				// Open this row
				row.child(format(row.data())).show();
				tr.addClass('shown');
			}
		});
	</script>


</body>
</html>