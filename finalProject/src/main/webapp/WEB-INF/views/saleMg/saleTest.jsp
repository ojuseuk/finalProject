<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/styles/kendo.common.min.css" />
<link rel="stylesheet" href="${root}/styles/kendo.default.min.css" />
<link rel="stylesheet" href="${root}/styles/kendo.default.mobile.min.css" />
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/kendo.all.min.js"></script>
</head>
<body>
<jsp:include page="../../../top.jsp"/>
	<select id="year" onchange="yearSale()" name="month">
		<option value="선택">선택</option>
	</select>
	<input type="button" onclick="saleYear('${root}', 'y')" value="년 매출">
	<select id="month" name="month" onchange="monthSale()">
		<option value="선택" id="default">선택</option>
	</select>
	<input type="button" onclick="saleYear('${root}', 'm')" value="월 매출">
	<input type="date" id="day" name="day">
	<input type="button" onclick="saleYear('${root}', 'd')" value="일 매출">
	
	<div style="width: 100%;">
		<div id="demo" class="card mb-3" align="left"
			style="float: left; width: 50%">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>번호</th>
								<th>년</th>
								<th>월</th>
								<th>일</th>
								<th>비용항목</th>
								<th>금액</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>번호</th>
								<th>년</th>
								<th>월</th>
								<th>일</th>
								<th>비용항목</th>
								<th>금액</th>
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
		<div style="float: right; width: 50%" id="example">
			<div class="demo-section k-content wide">
				<div id="chart"></div>
			</div>
			<div class="box wide" style="display: none;" id="chartList">
				<div class="box-col">
					<h4>API Functions</h4>
					<ul class="options">
						<li><input id="typeColumn" name="seriesType" type="radio"
							value="column" checked="checked" autocomplete="off" /> <label
							for="typeColumn">Columns</label></li>
						<li><input id="typeBar" name="seriesType" type="radio"
							value="bar" autocomplete="off" /> <label for="typeBar">Bars</label>
						</li>
						<li><input id="typeLine" name="seriesType" type="radio"
							value="line" autocomplete="off" /> <label for="typeLine">Lines</label>
						</li>
						<li><input id="stack" type="checkbox" autocomplete="off"
							checked="checked" /> <label for="stack">Stacked</label></li>
					</ul>
					<p>
						<strong>refresh()</strong> will be called on each configuration
						change
					</p>
				</div>
			</div>
		</div>
	</div>
<script src="${root}/js/saleMg/saleManager.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>	
<br><br><br><br><br><br><br><br><br>
<jsp:include page="../../../footer.jsp"/>
</body>
</html>
