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
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/k1.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/e1.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/m1.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/k2.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/e3.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/m2.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
       
  </div>
 </div>

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


