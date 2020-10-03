<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가이체</title>
</head>
<body>
<!-- header -->
   <jsp:include page="/header.jsp" />
   <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>My 주금통 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">추가이체</h1>
          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section">
    
    <div class="container">
   <div class="jumbotron">
  <p class="lead" style="color: black">${ loginVO.name } 님. 차곡차곡 모아 벌써 원하는 주식을 매수하였군요!</p>
  <hr class="my-4">
  <p align="center" style="color: black">더욱 빨리 손님의 꿈을 이룰 수 있게 추가이체 서비스를 이용해보세요!</p>
  
  <div align="center">
  </div>
   </div>
   <div class="row">
    
    <div class="col-md-6">
    <form action="${ pageContext.request.contextPath }/plus" method="post">
    <div class="form-group">
      <div style="color: black"><img src="resources/images/hana.png" width="30px" height="30px">&nbsp;증권계좌에 추가이체 할 계좌를 선택해주세요.</div>
   <hr>
 
  <c:forEach items="${ regAList }" var="account" varStatus="loop">
     <input type="radio" name="fromAccount" value="${ account.account_num }">
     <label>${ account.alias } - ${ account.account_num }</label><br>
    </c:forEach>
    <hr>
    </div>
    <div class="form-group">
      <label for="pwd" style="color: black"><img src="resources/images/hana.png" width="30px" height="30px">&nbsp;추가 이체할 금액을 입력하세요.</label>
      <input type="text" class="form-control" placeholder="금액입력" name="money">
    </div>
<!--     <div class="form-group">
      <label for="pwd">매일 1000원 미만의 동전이 남지 않을 경우, 자동으로 이체할 금액을 입력해주세요.</label>
      <input type="text" class="form-control" placeholder="금액입력" name="spMoney">
    </div> -->
    <hr>
        <div class="form-group">
      <label for="pwd" style="color: black"><img src="resources/images/hana.png" width="30px" height="30px">&nbsp;주금통 시스템을 신청할 증권계좌번호입니다.</label>
      <input type="text" class="form-control" placeholder="계좌번호입력" name="toAccount" value="${ loginVO.account_num }" readonly="readonly">
    </div>
    
     <div align="center">
    <button type="submit" class="btn btn-primary">추가 이체</button>
     </div>
  </form>
    </div>
    <div class="col-md-6">
    <div>
    <h4 align="center">${ loginVO.name }님의<br>
   	 현재까지 주금통 서비스로 모은 금액 </h4>
   	 
   	 
   	 <div align="center">
   	 <div class="col-md-8 col-lg-3 justify-content-center counter-wrap ftco-animate" align="center">
            <div class="block-18 py-md-5 mb-md-4" align="center">
              <div class="text text-border d-flex align-items-center" align="center">
            <h3 align="center">₩</h3><h3 class="number color" style="color: red" data-number="${ howmuchSP }" align="center">0</h3>
              </div>
            </div>
          </div>
   	 </div>
   	 <%-- <h4 style="color: red" align="center"> <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ howmuchSP }" /></h4><h4 align="center">원 입니다.</h4> --%>
    </div>
    <div align="right">
    <img src="resources/images/shy.png">
    </div>
    </div>
    </div>
    </div>
    </section>
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