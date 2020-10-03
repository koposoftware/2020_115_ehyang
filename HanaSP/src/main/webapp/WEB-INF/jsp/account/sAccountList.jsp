<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>증권계좌조회</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
// 거래내역조회
$(document).ready(function() {
      $('.saListBtn').click(function(){
           /* alert('클릭') */
           /* alert($(this).attr('id')) */
           $.ajax({
                  url : '${pageContext.request.contextPath}/account/saList',
                  type: 'post',
                  data : {
                	  account_num : $(this).attr('id')
                  }, success : function(data) {
                      /* alert('성공') */
                     console.log(data)
                     $('#saListTbl').html(data);
                  }, error : function() {
                     alert('다시 시도해주세요.')
                     alert($(this).attr('id'))
                  }
             })
         })
      })
</script>
<body>

	<!-- header -->
	<jsp:include page="/header.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>계좌관리 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">증권계좌조회</h1>
          </div>
        </div>
      </div>
    </section>
    
	  <section class="ftco-section">
      <div class="container">
      
      <div class="page-header">
		   <h3> <img src="resources/images/piggybank.png" width="70px"> ${ loginVO.name } 회원님이 보유하신 하나금융투자 증권계좌입니다.</h3>      
		  </div>
		  <hr>
      
      
      
      
      
      
      <c:forEach items="${ SAccountList }" var="account" varStatus="loop">
      <input type="hidden" name="account_num" value="${ account.account_num }">
      <div class="row no-gutters">
	  			<div class="col-md-12 portfolio-wrap">
	  				<div class="row no-gutters align-items-center">
	  						<img src="resources/images/hana.png" style="height: 200px">
	  					<div class="col-md-7">
	  						<div class="text pt-5 pl-0 pl-lg-5 pl-md-4 ftco-animate">
	  							<div class="px-4 px-lg-4">
	  								<div class="desc">
		  								<div class="top">
			  								<span class="subheading">${ loginVO.name }</span>
				  							<h3 class="mb-4">나의 < ${ account.alias } > 계좌</h3>
			  							</div>
			  							<div class="absolute">
				  							<h4>계좌번호 : ${ account.account_num }</h4>
				  							<h4>계좌주명 : ${ account.name }</h4>
				  							<h4>잔액 : ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ account.balance }" /></h4>
			  							</div>
		  							</div>
	  							</div>
	  						</div>
	  					</div>
	  				</div>
	  			</div>
	  			</div>
	  			
	  			<div align="center">
     	<input type ="button" class="saListBtn btn btn-success" id="${ account.account_num }" value="증권계좌내역조회">
     	<a href="${ pageContext.request.contextPath }/autoTransfer"><button class="btn btn-success"> 주금통 서비스 신청하기 </button></a>
     	</div>
      </c:forEach>
      
      
      
      
    
    
    
    
    
    
    
    
    <div align="center" id="saListTbl">
          		
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