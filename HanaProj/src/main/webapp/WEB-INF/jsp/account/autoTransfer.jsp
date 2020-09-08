<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- header -->
	<jsp:include page="/header.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>주금통 관리 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">주금통 서비스 신청</h1>
          </div>
        </div>
      </div>
    </section>

<section class="ftco-section">
      <div class="container">
      <div class="jumbotron">
  <!-- <h1 class="display-4"></h1> -->
  <p class="lead">${ loginVO.name } 님. 주금통 서비스를 신청 해주셔서 감사합니다.</p>
  <p>매일 오후 6시 777원이 증권계좌로 자동이체됩니다. <br>
  	 내가 원하는 주식을 더 빠르게 매수할 수 있는 방법! <br>
  	 <a href="#">주금통 시스템</a>에 대해 더 알아보고싶다면 클릭하세요!
  </p>
  <hr class="my-4">
  <p align="center">서비스를 신청하기 전 이용약관을 읽어주세요.</p>
    
    <div align="center">
   <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-sm">이용약관</button>
   </div>
  
  <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
       <div class="modal-content">
         <img src="resources/images/n1.jpg">
         <img src="resources/images/n2.jpg">
         <img src="resources/images/n3.jpg">
       </div>
             <div class="modal-footer">
             <div align="center">
           <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100px; height: 50px">동의</button>
             </div>
         </div>
     </div>
   </div>
  </div>
  
 <div class="container">
  
  <form action="${ pageContext.request.contextPath }/autoTransfer" method="post">
    <div class="form-group">
      <div>주금통 시스템에 등록할 통합 계좌를 선택해주세요.</div>
   <hr>
 
  <c:forEach items="${ accountNotRegList }" var="account" varStatus="loop">
	  <input type="radio" name="fromAccount" value="${ account.account_num }">
	  <label>${ account.alias } - ${ account.account_num }</label><br>
    </c:forEach>
    <hr>
    </div>
    <div class="form-group">
      <label for="pwd">처음 이체할 금액을 입력하세요.</label>
      <input type="text" class="form-control" placeholder="금액입력" name="money">
    </div>
    <div class="form-group">
      <label for="pwd">매일 1000원 미만의 동전이 남지 않을 경우, 자동으로 이체할 금액을 입력해주세요.</label>
      <input type="text" class="form-control" placeholder="금액입력" name="spMoney">
    </div>
    <hr>
        <div class="form-group">
      <label for="pwd">주금통 시스템을 신청할 증권계좌번호입니다.</label>
      <input type="text" class="form-control" placeholder="계좌번호입력" name="toAccount" value="${ loginVO.account_num }" readonly="readonly">
    </div>
    
     <div align="center">
    <button type="submit" class="btn btn-primary">주금통 서비스 신청</button>
     </div>
  </form>
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