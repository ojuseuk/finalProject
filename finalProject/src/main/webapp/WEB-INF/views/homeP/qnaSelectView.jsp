<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style type="text/css">
td.details-control {
	background: url('${root}/imgs/grid/datailBtn.png') no-repeat center center;
	cursor: pointer;
}

tr.shown td.details-control {
	background: url('${root}/imgs/grid/datailBtn.png') no-repeat center center;
}

</style>

<!-- dataTable 기본 css -->
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script type="text/javascript" src="${root}/js/jquery.min.js"></script> 
</head>
<body>
<input type="hidden" value='${requestScope.json}' id="json">
<input type="hidden" value='${root}' id="root">
<input type="hidden" value="${requestScope.result }" id="result">
<jsp:include page="../../../top.jsp"/>
<br/>
<h2 align="center">게시판 목록</h2>
<div class="container-fluid" style="width: 80%; margin: auto;">
	<div id="demo" class="card mb-3">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" style="text-align: center;">
					<thead style="background-color: #90909096; align:center">
						<tr>
							<th>게시판 번호</th>
							<th>게시판 제목</th>
							<th>작성자</th>
							<th>작성 날짜</th>
							<th>상세 보기</th>
							<th>수정 하기</th>
						</tr>
					</thead>
					<tbody style="background-color: white;">
					</tbody>
				</table>
			</div>
		</div>
		<div style="text-align:center">
			<button class="w3-button w3-border" style="background-color: #90909096" onclick="location.href='${root}/homeP/qnaInsertView?no=0'">게시글 생성</button>
		</div>
	</div>
</div>
<Div st> 
</Div>
	<!-- dataTable 기본 js -->
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script type="text/javascript">
		var json = $('#json').val()
		json = JSON.parse(json);
		console.log(json);
		var root = $('#root').val();
		var result = $('#result').val();
		alert(result);

		function format(d) {
			return '게시글 내용 : ' + d.content + '<br>'
					+ '<button class="w3-button w3-border" style="background-color: #90909096" onclick="location.href=\''
					+ root
					+ '/homeP/qnaInsertView?no=' + d.no + '&gpNum=' + d.gpNum
					+ '&seqNum=' + d.seqNum + '&seqLv=' + d.seqLv
					+ '\'">댓글 달기</button>';
		}

		var table = $('#dataTable').DataTable({
			
			"processing" : true,
			"ordering" : false,
			"select" : {
				style : 'os',
				items:'cell'
			},
			"data" : json,
			"columns" : [{
				"data" : "no",
				"render" :function(data, type, row, meta){
// 					console.log(row.title);
					return '<div align="center">'+data+'</div>';
				}
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
				"data" : "dt",
				"render" : function(data){
					
					return data.substring(0,4) + "-"+data.substring(4,6) + "-"+data.substring(6,8);
				}
			}, {
				"className" : 'details-control',
				"width" : "10%",
				"orderable" : false,
				"data" : null,
				"defaultContent" : ''
			},{
				"data" : null,
				"render" : function(data, row, type, meta){
					
					return '<button class="w3-button w3-border" style="background-color: #90909096" onclick="location.href=\''+root+'/homeP/qnaUpdateView?no='+data.no+'\'">수정 하기</button>';
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
				tr.next().css('background', 'yellow');
				tr.addClass('shown');
			}

		});
	</script>
</body>
</html>