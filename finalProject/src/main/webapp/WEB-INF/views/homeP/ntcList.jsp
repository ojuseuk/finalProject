<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<!-- select : true 사용하기 위한 css -->
<link rel="stylesheet" href="${root}/styles/vendor/css/select.min.css" />
</head>
<body>
<input type="hidden" value='${requestScope.json}' id="json">
<jsp:include page="../../../top.jsp"/>
<div id="demo" class="card mb-3" >
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>번호</th>
						<th>게시글 제목</th>
						<th>첨부 파일</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>번호</th>
						<th>게시글 제목</th>
						<th>첨부 파일</th>
						<th>날짜</th>
					</tr>
				</tfoot>
				<tbody>
					<tr class="odd" id="dataDefault">
						<td valign="top" colspan="6" class="dataTables_empty"
							align="center">No data available in table</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%-- <jsp:include page="../../../footer.jsp"/> --%>
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>
<script type="text/javascript">
	let json = $('#json').val();
	json = JSON.parse(json);
	let usrTp = $('#usrTp').val();
	
	function format(d) {
		return '게시글 내용 : ' + d.content;
	}
	
	$(document).ready(function(){
		let table = $('#dataTable').DataTable({
			"language": {
				    search: "검색 : " 
			},
			"destroy": true,
			"scrollY" : 250,
			"scrollCollapse" : true,
			data : json,
			columns : [ {
				"data" : "no",
				"searchable": false
			}, {
				"data" : "title"
			}, {
				"data" : "attchFile",
				"searchable": false
			}, {
				"data" : "dt",
				"searchable": false
			}]
		});
		
		$('#dataTable tbody').on( 'click', 'tr', function () {
			var tr = $(this).closest('tr');
			var row = table.row(tr);
			
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
				row.child.hide();
				tr.removeClass('shown');
	        }
	        else {
	            table.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
				row.child(format(row.data())).show();
				tr.addClass('shown');
	        }
	    } );
	 
	    $('#button').click( function () {
	        table.row('.selected').remove().draw( false );
			row.child.hide();
			tr.removeClass('shown');
	    } );
	});
</script>
</body>
</html>