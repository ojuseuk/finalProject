<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hakwon example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${root}/js/jquery.min.js"></script>
<script type="text/javascript" src="${root}/js/usr/usrInsert.js"></script>
<!-- banner style -->
<!-- <style>
*{ margin:0;padding:0;text-decoration:none}
li{list-style:none}

.product_con{ position:relative; width:300px; top:100px;margin:0 auto; border:1px solid green }
.product_con .product_list{overflow:hidden;position:relative;margin-left:50px;width:200px; height:200px; border:1px solid red}
.product_con .product_list li{ position:absolute;left:0;}
.product_con .product_list li:nth-child(1){left:0px;}
.product_con .product_list li:nth-child(2){left:200px;}
.product_con .product_list li:nth-child(3){left:200px;}
.product_con .product_list li:nth-child(4){left:200px;}
.product_con .product_list li:nth-child(5){left:200px;}

.product_con .product_list li a{display:block; width:200px;height:200px;background:red;font-size:150px;color:#fff;text-align: center}
.product_con .product_list li:nth-child(1) a{background:#65f078;left:-200px;}
.product_con .product_list li:nth-child(2) a{background:#f5da5c}
.product_con .product_list li:nth-child(3) a{background:#fe719c;left:200px;}
.product_con .product_list li:nth-child(4) a{background:#10A8AB;left:200px;}
.product_con .product_list li:nth-child(5) a{background:#A1305E;left:200px;}

.product_con .btn_prev,.product_con .btn_next { position:absolute;top:100px;}
.product_con .btn_prev { left:0px;}
.product_con .btn_next { right:0px;}
.numlist {width:105px; margin:0 auto;}
</style> -->
</head>
<body>
<jsp:include page="top.jsp"/>
<!-- banner start -->
<!-- <div class="product_con"> -->
<!--     <ul class="product_list"> -->
<!--         <li><a href="#none">1</a></li> -->
<!--         <li><a href="#none">2</a></li> -->
<!--         <li><a href="#none">3</a></li> -->
<!--         <li><a href="#none">4</a></li> -->
<!--         <li><a href="#none">5</a></li> -->
<!--     </ul> -->
<!--     <a class="btn_prev" href="#none">◀prev</a> -->
<!--     <a class="btn_next" href="#none">next▶</a> -->
<!-- </div> -->
<script type="text/javascript">
// $(function(){
//     var selNum = 0,
//         $proList = $(".product_lis, li"),
//         totalNum = $proList.length,
//         $btnprev = $(".product_con .btn_prev"),
//         $btnnext = $(".product_con .btn_next"),
//         oldNum;

//     $proList.css({display:"none"});
//     $proList.eq(selNum).fadeIn(1500);

//     function prevItem() {
//         oldNum = selNum;
//         selNum = selNum - 1;
//         if(selNum < 0) {
//             selNum = totalNum - 1;
//         }
//         setting('-1');
//     }

//     function nextItem() {
//         oldNum = selNum;
//         selNum = selNum + 1;
//         if(selNum >= totalNum) {
//             selNum = 0;
//         }
//         setting('1');
//     }

//     $btnprev.on('click', prevItem);
//     $btnnext.on('click', nextItem);

//     function setting(adjust) {
//         var adjust1 = adjust * 1,
//                 adjust2 = adjust * -1;
//         if(setting.caller == indicate) {
//             if(selNum < oldNum) {
//                 adjust1 = adjust * -1,
//                         adjust2 = adjust;
//             }
//         }
//         $proList.eq(selNum).css({ left : adjust1 * 200 + 'px', display : 'block', opacity :0 })
//         $proList.eq(oldNum).stop().animate({
//                     left : adjust2 * 200 + 'px', opacity : 0}
//         );
//         $proList.eq(selNum).stop().animate({left : 0, opacity : 1},500, function(){});

//     }

//     function indicate(){
//         oldNum = selNum;
//         selNum = $(this).index();
//         if( selNum == oldNum) return;
//         setting('1')
//     }

//     $('.numlist a').on('click', indicate)

// });

</script>
<!-- banner end -->
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

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/k3.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">국어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/e4.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">영어강사</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">단과</div>
        <div class="panel-body"><img src="./imgs/img/m3.PNG" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">수학강사</div>
      </div>
    </div>
       
  </div>
 </div>

<!-- 모달 시작 -->
<!-- 로그인 -->
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="${root}/login" method="post">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <label><b>아이디</b></label>
      <input type="hidden" name="command" value="userLogin">
      <input type="text" placeholder="아이디" name="id" required>
	   <br>
      <label><b>비밀번호</b></label>
      <input type="password" placeholder="비밀번호" name="pw" required><br>
      <%-- <div id="div_Check" style="font-weight: bold;color:red;">${login_errMsg }</div>  --%>
      <button type="submit">로그인</button><br>
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
      <button type="button" class="idpwbtn" onclick="location.href='<c:url value="/idpwfind"/>'">아이디/비밀번호 찾기</button>
    </div>

    <div class="container" style="background-color:#f1f1f1">
    </div>
  </form>
</div>


<!-- 회원가입 -->
<div id="id02" class="modal" style="overflow: scroll;">
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content animate" action="${root}/userInsert.do" method="post" id="f">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
    <div class="container">
      <label><b>아이디</b></label>
      <input type="hidden" name="command" value="join">
      <input type="text" placeholder="아이디 ※ 영문+숫자 조합 6~14자 이내" class="id1" name="id" id="id1" class="id" required >
      <br>
      <span class="check_error"></span>
      <br>
      <!-- <input type="button" id="btn_idcheck" name="btn_idcheck" value="중복확인"> -->
	 

      <label><b>비밀번호</b></label>     
      <input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" class="pw" name="pw" id="pw1" required>
      <span class="check_error"></span>
      <br>
      
	  <label><b>비밀번호 확인</b></label>     
      <input type="password" placeholder="비밀번호 ※ 영문+숫자 조합 6~14자 이내" class="pw2" id="pw2" name="pw2" required>
      <span class="check_error"></span>
      <br>

      <label><b>이름</b></label>
      <input type="text" placeholder="이름" class="nm" name="nm" id="nm1" required>
      <span class="check_error"></span>
      <br>
      
      <label><b>전화</b></label>
      <input type="text" placeholder="전화 ※ '-'없이 숫자(10~11자)만 입력" class="phone" name="phone" id="phone1" required>
      <span class="check_error"></span>
      <br>
       	
      <label><b>주소</b></label>
      <input type="text" placeholder="주소" class="addr" name="addr" id="addr1" required>
      <span class="check_error"></span>
      <br>
      
      <label><b>이메일</b></label>
      <input type="text" placeholder="이메일" class="email" name="email" id="email1" required><br>
      <span class="check_error"></span>
      <br>
      
	  <div class="clearfix">
<!--         <button type="submit" class="signupbtn" style="width: 50%;"  onclick="sendit()">회원가입</button><br> -->
        <input type="button" value="회원가입" onclick="sendIt()"> 
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn" style="width: 19%;">취소</button>
      </div>
    </div>
  </form>
</div>

<!-- 모달 끝 -->
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

<!-- banner script -->
<script type="text/javascript">

</script>


<jsp:include page="footer.jsp"/>

</body>
</html>


