<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.color {
	 color: #008c8c;
	}
</style>
<body>

	<!-- header -->
	<jsp:include page="/header.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>계좌관리 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">통합계좌조회</h1>
          </div>
        </div>
      </div>
    </section>
      
    <section class="ftco-section">
    
    <div class="container" style="background-color: #fbfbfb">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">통합계좌목록</span>
            <h5 class="mb-3"><img src="resources/images/money.png" width="70px"> ${ loginVO.name } 회원님이 보유하신 하나은행 통합계좌 목록입니다.</h5>
          </div>
        </div>
        
        
        <div class="col-md-8 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-md-5 mb-md-4">
              <div class="text text-border d-flex align-items-center">
                <h4>총 자산액 : </h4>
                  <br>
                <h4 class="number color" data-number="${ sumTotal }">0</h4>
              </div>
            </div>
          </div>
        
        <div class="row ftco-animate">
          <div class="col-md-12">
            <!-- <div class="carousel-testimony owl-carousel"> -->
            
            <c:forEach items="${ accountList }" var="account" varStatus="loop">
            <input type="hidden" name="account_num" value="${ account.account_num }">
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                  	<span class="fa fa-quote-left"></span>
                				<h3 style="color: #008c8c">${ account.rownum }</h3>
                    <h4 class="mb-4"><c:if test="${ 'Y' eq account.register }">
           						<span class="badge badge-info">주금통 등록</span>
           					</c:if>
                				${ account.bank }</h4>
                				<h5> 계좌번호 : ${ account.account_num }</h5>
                				<h5> 계좌별칭 : ${ account.alias }</h5>
           						<h5> 잔액 : ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ account.balance }" /></h5>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </div>
        </div>
	        <div align="center">
	     		<a href="${ pageContext.request.contextPath }/autoTransfer"><button class="btn btn-success"> 주금통 서비스 신청하기 </button></a>
	     	</div>
      <!-- </div> -->
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