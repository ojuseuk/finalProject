<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td.details-control {
	background: url('../imgs/grid/plus.JPG') no-repeat center center;
	cursor: pointer;
}

tr.shown td.details-control {
	background: url('../imgs/grid/minus.JPG') no-repeat center center;
}
</style>
</head>
<!-- dataTable 기본 css -->
<link rel="stylesheet"
	href="${root}/styles/vendor/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<!-- select : true 사용하기 위한 css -->
<link rel="stylesheet"
	href="${root}/styles/vendor/css/dataTables.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/css/select.min.css" />

<!-- jquery사용을 위한 js -->
<script src="${root}/js/jquery.min.js"></script>
<!-- dataTable 기본 js -->
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- datatable select 사용을 위한 js -->
<script src="${root}/js/vendor/datatables/select.min.js"></script>
<body>
<input type="hidden" value='${requestScope.json}' id="json">
<input type="hidden" value='${root}' id="root">
<input type="hidden" value="${requestScope.result }" id="result">
<h2>게시판 목록</h2>
	
	
<div class="container-fluid">
	<div id="demo" class="card mb-3">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>게시판 번호</th>
							<th>게시판 제목</th>
							<th>작성자</th>
							<th>작성 날짜</th>
							<th>상세 보기</th>
							<th>수정 하기</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<button onclick="location.href='${root}/homeP/qnaInsertView?no=0'">게시글 생성</button>
		</div>
	</div>
</div>
	<button onclick="location.href=www.naver.com">링크</button>
	<script type="text/javascript">
		var json = $('#json').val()
		json = JSON.parse(json);
		console.log(json);
		var root = $('#root').val();
		var result = $('#result').val();
		alert(result);

		function format(d) {
			return '게시글 내용 : ' + d.content + '<br>'
					+ '<button onclick="location.href=\'' + root
					+ '/homeP/qnaInsertView?no=' + d.no + '&gpNum=' + d.gpNum
					+ '&seqNum=' + d.seqNum + '&seqLv=' + d.seqLv
					+ '\'">댓글 달기</button>';
		}

		var table = $('#dataTable').DataTable({
			"processing" : true,
			"ordering" : false,
			"select" : {
				style : 'single'
			},
			"data" : json,
			"columns" : [ {
				"data" : "no"/* ,
				"width" : "5%" */
			}, {
				"data" : "title",
				/* "width" : "30%", */
				"render" : function(data, type, row, meta) {
					var str = "";
					if(row.seqLv > 0){
						for (var i = 0; i < row.seqLv; i++) {
							str += "&nbsp&nbsp&nbsp";
						}
						str+="└>";
					}
					return str + data + '(' + row.seqLv + ')';

				}
			}, {
				"data" : "id"/* ,
				"width" : "15%" */
			}, {
				"data" : "dt"/* ,
				"width" : "15%" */
			}, {
				"className" : 'details-control',
				"width" : "10%",
				"orderable" : false,
				"data" : null,
				"defaultContent" : ''
			},{
				"data" : null,
				"render" : function(data, row, type, meta){
					
					return '<button onclick="location.href=\''+root+'/homeP/qnaUpdateView?no='+data.no+'\'">수정 하기</button>';
				}
			} ]
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