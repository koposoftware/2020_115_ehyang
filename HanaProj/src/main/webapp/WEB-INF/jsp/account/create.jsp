<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

// Random Code 생성
function createCode(objArr, iLength) {
    var arr = objArr;
    var randomStr = "";
   
    for (var j=0; j<iLength; j++) {
        randomStr += arr[Math.floor(Math.random()*arr.length)];
    }
   
    return randomStr
}


function getRandomNum(iLength) {
    var arr="0,1,2,3,4,5,6,7,8,9".split(",");
   
      var rnd = createCode(arr, iLength);
      document.getElementById("divRandom").value = rnd;
      return rnd;
  }
</script>
</head>
<body>
<!-- header -->
   <jsp:include page="/header.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>계좌관리 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">증권계좌개설</h1>
          </div>
        </div>
      </div>
    </section>
    
      <section class="ftco-section">
      <div class="container">
      <div class="jumbotron">
  <!-- <h1 class="display-4"></h1> -->
  <p class="lead">${ loginVO.id } 님. 개설하실 증권계좌의 정보를 입력하세요.</p>
  <hr class="my-4">
  <p align="center">서비스를 신청하기 전 이용약관을 읽어주세요.</p>
  
  <div align="center">
   <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-sm">이용약관</button>
   <div class="checkbox">
	  	<label><input type="checkbox" value="">동의</label>
		</div>
   </div>
   <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
       <div class="modal-content">
         <img src="resources/images/s1.jpg">
         <img src="resources/images/s2.jpg">
         <img src="resources/images/s3.jpg">
         <img src="resources/images/s4.jpg">
         <img src="resources/images/s5.jpg">
         <img src="resources/images/s6.jpg">
       </div>
             <div class="modal-footer">
             <div align="center">
           <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100px; height: 50px">동의</button>
             </div>
         </div>
     </div>
   </div>
   
</div>
      <form action="${ pageContext.request.contextPath }/create" method="post">
          <div class="form-group">
            <label for="inputEmail4">id</label>
            <input type="text" class="form-control" name="id" value="${ loginVO.id }" readonly="readonly">
          </div>
          <div class="form-group">
         <input type="button" style="color: #008c8c" class="btn btn-primary" value="계좌번호 랜덤생성" onclick="getRandomNum(document.getElementById('length').value)" readonly="readonly">
            <input type="text" id="length" readonly class="form-control-plaintext" style="width: 30px; display: none" value="14">
            <input type="text" class="form-control" name="account_num" id="divRandom" readonly="readonly" required="required">
          </div>
        <div class="form-group">
          <label for="inputAddress">계좌주명</label>
          <input type="text" class="form-control" id="inputAddress" name="name" value="${ loginVO.name }" readonly="readonly">
        </div>
        <div class="form-group">
          <label for="inputAddress2">비밀번호</label>
          <input type="password" class="form-control" id="inputAddress2" name="password" required="required">
        </div>
        <div class="form-row">
          <div class="form-group">
            <label for="inputCity">alias</label>
            <input type="text" class="form-control" name = "alias" required="required">
          </div>
        </div>
        <button type="submit" class="btn btn-primary">계좌생성</button>
      </form>
      </div>
      </section>
<!-- 

<div id=divRandom></div> -->
      <!-- footer -->
         <jsp:include page="/footer.jsp"></jsp:include>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<script src="${ pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/popper.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.waypoints.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/google-map.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>


</body>
</html>