<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강좌 관리</title>
<link rel="stylesheet" href="${root}/styles/vendor/datatables/dataTables.bootstrap4.css" />
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/vendor/datatables/jquery.dataTables.js"></script>
<script src="${root}/js/vendor/datatables/dataTables.bootstrap4.js"></script>	
</head>
<body>
<jsp:include page="../../../top.jsp"/>
 	<form action="clssInsert.do" id="frmClss">
		<fieldset style="width: 40%">
			<legend>교육 과정</legend>
			<table>
				<tr>
					<td>과목명 :</td>
					<td><select name="sbjtNm" id="sbjtNm" required onchange="crsSelect('${root}', this.value);
																			 tchrSelectBySbjtNm('${root}', this.value)">
							<option value="">과목 선택</option>
							<c:forEach items="${requestScope.sbjtList}" var="data">
								<option value=${data.sbjtNm}>${data.sbjtNm}</option>
							</c:forEach>
						</select></td>
				</tr>  
				<tr>
					<td>과정명 :</td>
					<td><select name="crsId" id="crsId">
					
						</select>
					</td>
					<td align="right"><input type="button" value="해당 과정 강좌 리스트 " onclick="clssSelectByCourse('${root}', document.getElementById('crsId').value)">
					</td>
					
				</tr>
			</table>
		</fieldset>
		<fieldset style="width: 40%">
			<legend>강좌 정보</legend>
			<table>
				<tr>
					<td>강좌 ID :</td>
					<td><input type="text" name="clssId" id="clssId"/></td>
				</tr>
				</tr>
					<td>강좌명 :</td>
					<td><input type="text" name="clssNm" id="clssNm"/></td>
				</tr>
				<tr>
					<td>강좌 기간 : </td>
					<td><input type="date" name="strtDt" placeholder="시작일자" id="strtDt"/>부터</td>
					<td><input type="date" name="endDt" placeholder="종료일자" id="endDt"/>까지</td>
				</tr>
				<tr>
					<td>수업시간 :</td>
					<td><input type="time" name="strtTm" placeholder="시작시각" id="strtTm"/></td>
					<td><input type="time" name="endTm" placeholder="종료시각" id="endTm"/></td>
				</tr>
				<tr>
					<td>수강인원 :</td>
					<td><input type="number" name="capa" id="capa"/></td>
				</tr>
				<tr>
					<td>강의실 :</td>
					<td><input type="text" name="clssroom" id="clssroom"/></td>
				</tr>
			</table>
		</fieldset><br>
		<input type="reset" value="화면 초기화"> 
 		<input type="submit" value="강좌 개설"> 
		<input type="button" value="수정 내용 저장" onclick="clssUpdate()">
		<input type="button" value="강사 배정" onclick="tchrShow()">
		<input type="button" onclick="javascript:history.back()" value="이전 화면으로"><br>
		<br>
		<div>
		<fieldset style="width: 75%" id="fsTchr" hidden>				
			<legend>강사 정보</legend>
			<table style="float:left">
				<tr>
					<td>강사명 :</td>
					<td>
						<select name="tchrNo" id="tchrNo" onchange="tchrSelect('${pageContext.request.contextPath}', this.value)">
							<option value="">강사 선택</option>

						</select>
<%-- 						<select name="tchrNm" id="tchrNm" required onchange="tchrSelect('${pageContext.request.contextPath}', this.value)">
							<option value="">강사 선택</option>
							<c:forEach items="${requestScope.tchrList}" var="data">
								<option value=${data.tchrNo}>${data.tchrNm}</option>
							</c:forEach>
						</select> --%>
					</td>
					
				</tr>
					<td>강의료 :</td>
					<td><input type="number" name="slr" id="slr">  
				<tr>
				</tr>
				<tr>
					<td>강사 소개 : </td>
					<td><textarea name = "tchrIntro" id="tchrIntro" cols = "50" rows = "7" 
                              placeholder="200자 이내"></textarea></td>
                    </td>
					<td><div id="tchrPhoto"></div> </td>
				</tr>
				<tr>
					<td colspan="3">
					
						<input type="button" value="화면초기화" id="btnClear">
						<input type="button" value="저장" onclick="assgnTchr('${pageContext.request.contextPath}')">
						<input type="button" value="닫기" onclick="tchrClose()">
					</td>
				</tr>
			</table>
			
			<!-- name="assgnTchr" id="assgnTchr" --> 
			
			<!-- 강사 리스트 DataTable -->
			<div id="divDtTchr" class="card mb-3" style="position:absolute; left:50%; width:400px; display:inline-block;">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dtTchr">
							<thead >
								<tr>
									<th>과목</th>
									<th>강사명</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 강사 리스트 DataTable -->	
		</fieldset>
		</div>
	</form>
	
	<input type = "hidden" id="jsonList" value='${requestScope.jsonList}'>
	<input type = "hidden" id="root" value='${root}'>

		<!-- 강좌 리스트 DataTable -->
		<div id="demo" class="card mb-3" style="position:absolute; top:45%; left:750px; width:700px; height:200px; display:inline-block;">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable">
						<thead >
							<tr>
								<th>강좌 ID</th>
								<th>과목</th>
								<th>과정명</th>
								<th>강좌명</th>
								<th>개강일</th>
								<th>수강인원</th>
								<th>강의실</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 과정 리스트 DataTable -->


		
	<script type="text/javascript">
		var xhttp = new XMLHttpRequest();
		var xhttp2 = new XMLHttpRequest();
		var data;
		var header = document.querySelector('meta[id="_csrf_header"]').getAttribute('content');
		var token = document.querySelector('meta[id="_csrf"]').getAttribute('content');
		var data2;
		var root = document.getElementById("root").value;
		var jsonList = document.getElementById("jsonList").value;
		jsonList = JSON.parse(jsonList);
		
		/* 화면 초기화 */
		$(document).ready(function() {
            $('#btnClear').click(function() {
                location.reload();
            });
        });

		
		/* 강좌 리스트 DataTable 채우기*/
		$(document).ready(function(){
			$('#dataTable').DataTable({
				"language": {
					    search: "검색 : " ,
			            "thousands": ","
				},
				"scrollY" : 330,
				"scrollCollapse" : true,
				data : jsonList,
				columns : [ {
						"data" : "clssId",
						"searchable": false,
						"render" : function(data, type, row, meta){

							data  = '<div align="center"><input type="button" value="' + data + '" onclick="clssSelect(\''+ root + '\', \''+data+'\');'
// 							                                                                    + 'tchrAssnSelectList(\'' + root + '\', \'' + data + '\');';
							                                                                    + 'tchrAssnSelect(\'' + root + '\', \'' + data + '\')"></div>';
							return data;
						}
					}, {
						"data" : "sbjtNm"
					}, {
						"data" : "crsNm"
					}, {
						"data" : "clssNm"
					}, {
						"data" : "strtDt"
					}, {
						"data" : "capa",
						"render" : function(data){
							data = '<div align="right">' + data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '</div>';	
							return data;
						}
					}, {
						"data" : "clssroom"
					}]
			});
		});
		
		/* 강좌 수정 */
		function clssUpdate(){
			document.getElementById("frmClss").action = "${root}/clssUpdate";
			document.getElementById("frmClss").submit();
		}


		/* 강사 배정 */
		function assgnTchr(root){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					alert(data);
				}
			}
			
			tchrNo = document.getElementById("tchrNo").value;
			clssId = document.getElementById("clssId").value;
			/* chrg = document.getElementById("chrg").value; */
			slr = document.getElementById("slr").value;
			
			params  = "tchrNo=" + tchrNo + "&";
			params += "clssId=" + clssId + "&";
			/* params += "chrg=" + chrg + "&"; */
			params += "slr=" + slr ;
			
			xhttp.open("POST", root + "/assgnTchr", true);
			/* post 사용시에 필수로필요한 Content-Type */
			xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			
			/* spring-security를 사용할 경우 해아할 setRequestHeader */
			xhttp.setRequestHeader(header, token);
			alert(params);
			xhttp.send(params);
		}
		
		function tchrClose(){
			document.getElementById("fsTchr").hidden = true;
		}
		
		function tchrShow(){
			document.getElementById("fsTchr").hidden = false;
		}
		
		
		
		/* 강사번호로 TB_TCHR 검색 */
		function tchrSelect(root, tchrNo){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("tchrIntro").value = data.tchrIntro;
					
					tag = '<img src="${pageContext.request.contextPath}/imgs/img/';
					tag += data.tchrPt + '" style="width:150px;height:150px;">';
					
					console.log(tag);
					document.getElementById("tchrPhoto").innerHTML = tag;
				}
			}
			xhttp.open("GET", root + "/tchrSelect?tchrNo=" + tchrNo, true);
			xhttp.send();
		}
		
		/* 특정 과정의 강좌 리스트 조회 */
		function clssSelectByCourse(root, crsId){
			document.getElementById("frmClss").action = "${pageContext.request.contextPath}/clssSelectByCourse";
			document.getElementById("frmClss").submit();
		}
		
		/* 강좌ID로 강사 배정 조회. 리스트에서 특정 강좌 선택 시 */
		function tchrAssnSelect(root, clssId){
			xhttp2.onreadystatechange = function(){
				console.log(xhttp2.readyState);
				console.log(xhttp2.status);
				if (xhttp2.readyState == 4 && xhttp2.status == 200) {
					var data2 = xhttp2.responseText;
					console.log("xhttp2.responseText : " + xhttp2.responseText);
					console.log("data2.length : " + data2.length);
					data2 = JSON.parse(data2);
					console.log("data2.length 파싱 후 : " + data2.length);
					$('#dtTchr').dataTable().fnDestroy();
					
					if(data2.length == 0){ 			/* 강사가 배정되지 않은 경우 */
						tchrSelectBySbjtNm(root, document.getElementById("sbjtNm").value);
						document.getElementById("slr").value = "";
						document.getElementById("tchrIntro").value = "";
// 						$("#imgTchr").remove();
//  						$('#dtTchr').remove();
					} else if(data2.length == 1){								/* 강사가 배정된 경우 */
						console.log("parsing 후 data2 : " + data2[0]);
						document.getElementById("slr").value = data2[0].slr;
						document.getElementById("tchrIntro").value = data2[0].tchrIntro;
						
						tag = '<option value="' + data2[0].tchrNo + '">' + data2[0].nm + '</option>';
						document.getElementById("tchrNo").innerHTML = tag;
						
						tag = '<img id="imgTchr" src="${pageContext.request.contextPath}/imgs/img/';
						tag += data2[0].tchrPt + '" style="width:150px;height:150px;">';
						document.getElementById("tchrPhoto").innerHTML = tag;
						
						
					}	
					/* 강사 리스트 DataTable 채우기*/
		 			$('#dtTchr').DataTable({
		 				"language": {
		 					    search: "검색 : " ,
		 			            "thousands": ","
		 				},
		 				"scrollY" : 330,
		 				"scrollCollapse" : true,
		 				data : data2,
		 				columns : [ {
		 						"data" : "sbjtChrg"
		 					}, {
		 						"data" : "nm"
		 					}]
		 			});		
				}
			}
			xhttp2.open("GET", root + "/tchrAssnSelect?clssId=" + clssId, true);
			xhttp2.send();
		}
		
		/* 강좌ID로 강좌 조회 */
		function clssSelect(root, clssId){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					document.getElementById("sbjtNm").value = data.sbjtNm;
					document.getElementById("crsId").value = data.crsId;
					document.getElementById("clssId").value = data.clssId;
					document.getElementById("clssNm").value = data.clssNm;
					document.getElementById("strtDt").value = data.strtDt;
					document.getElementById("endDt").value = data.endDt;
					document.getElementById("strtTm").value = data.strtTm;
					document.getElementById("endTm").value = data.endTm;
					document.getElementById("capa").value = data.capa;
					document.getElementById("clssroom").value = data.clssroom;
					
					tag = '<option value="' + data.crsId + '">' + data.crsNm + '</option>';
					document.getElementById("crsId").innerHTML = tag;
					
				}
			}
			xhttp.open("GET", root + "/clssSelect?clssId=" + clssId, true);
			xhttp.send();
		}
		
		/* 과목명으로 강사 리스트 조회 */
		function tchrSelectBySbjtNm(root, sbjtNm){
			xhttp2.onreadystatechange = function(){
				if (xhttp2.readyState == 4 && xhttp2.status == 200) {
					data2 = xhttp2.responseText;
					data2 = JSON.parse(data2);
					var tag = '<option>강사 선택</option>';
					for (var i = 0; i < data2.length; i++) {
						tag += '<option value="' + data2[i].tchrNo + '">' + data2[i].nm + '</option>';
					}
					
					document.getElementById("tchrNo").innerHTML = tag;
				}
			}							
			xhttp2.open("GET", root + "/tchrSelectBySbjtNm?sbjtNm=" + sbjtNm, true);
			xhttp2.send();
		}
		
		/* 과목명으로 과정 리스트 조회 */
		function crsSelect(root, sbjtNm){
			xhttp.onreadystatechange = function(){
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					data = xhttp.responseText;
					data = JSON.parse(data);
					var tag = '<option>과정 선택</option>';
					for (var i = 0; i < data.length; i++) {
						tag += '<option value="' + data[i].crsId + '">' + data[i].crsNm + '</option>';
					}
					
					document.getElementById("crsId").innerHTML = tag;
				}
			}
			xhttp.open("GET", root + "/crsSelectBySbjtNm?sbjtNm=" + sbjtNm, true);
			xhttp.send();
		}
	</script>
	

	
<jsp:include page="../../../footer.jsp"/>	
</body>
</html>