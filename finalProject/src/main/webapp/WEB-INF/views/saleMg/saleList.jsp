<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="w3-container">
		<h2>Bordered Table</h2>

		<table class="w3-table w3-bordered">
			<tr>
				<th>번호</th>
				<th>년</th>
				<th>월</th>
				<th>일</th>
				<th>비용항목</th>
				<th>금액</th>
			</tr>
			<c:forEach items="${requestScope.list}" var="sale">
				<tr>
					<td>${sale.no}</td>
					<td>${sale.year}</td>
					<td>${sale.month}</td>
					<td>${sale.day}</td>
					<td>${sale.costItem}</td>
					<td>${sale.amount}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
		<div id="example">
		<div class="demo-section k-content wide">
			<div id="chart"></div>
		</div>
		<div class="box wide">
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
		${requestScope.list} ${requestScope.json} ${requestScope.object}
		 <input type="hidden" value='${requestScope.json}' id="jsonData">
	</div>

</body>
</html>
