<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hakwon example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
<jsp:include page="top.jsp"/>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-danger">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/kor.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/eng.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/math.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-danger">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/kor12.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/eng2.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">특강정보</div>
        <div class="panel-body"><img src="./imgs/img/math2.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
  </div>
</div><br><br>


<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<!-- <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script> -->
<%--  중복체크 
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_idcheck").click(function(){
			$.ajax({
				url:'/idCheck/'+$("#id").val(),
				dataType:'json',
				success:function(data){
					if(data.idcheck==true){
						$("#span_idcheck").css("color","red").html("[사용중인 아이디입니다.]");
					}else{
						$("#span_idcheck").css("color","green").html("[사용가능한 아이디입니다.]");
					}
				}
			});
		});
	});
</script> --%>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<!-- Container (The Band Section) -->
<div id="Royal Academy" class="container text-center">
  <h3>Royal Academy</h3>
  <p>  
            저희 학원은 학생들 개개인의 사고와 응용력을 파악하고 이에 맞는 개인별 학습을  할 수 있도록 합니다.<br>
            학생들의 수준에 맞는 학습 설계와 콘텐츠 제공을 통해 효율적인 성적상승의 결과물을 볼 수 있습니다.<br>
            다양한 응용과 심화된 학습콘텐츠로 목표하는 바를 이룰 수 있도록  하겠습니다.    
  </p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="./imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
     
    </div>
    <div class="col-sm-4">
      <p class="text-center"></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="./imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      
    </div>
    <div class="col-sm-4">
      <p class="text-center"></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="./imgs/img/mark3.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
     
    </div>
  </div>
</div>



<!-- Add Google Maps -->
<h1>학원위치</h1>
<div id="map" style="width:100%;height:400px;">
</div>


<!-- 구글 지도 -->
<script>

function myMap() {

        var uluru = {lat: 37.4787713, lng: 126.8810822};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
 
	}

</script>
<!-- 구글 지도 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>

<jsp:include page="footer.jsp"/>

</body>
</html>


