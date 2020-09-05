<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function() {
		$('.spListBtn').click(function(){
			  /* alert('클릭') */
			  /* alert($(this).attr('id')) */
			  $.ajax({
		            url : '${pageContext.request.contextPath}/account/autoTransferlist',
		            type: 'post',
		            data : {
		               from_account : $(this).attr('id')
		            }, success : function(data) {
		                /* alert('성공') */
		               console.log(data)
		               $('#listTbl').html(data);
		            }, error : function() {
		               alert('다시 시도해주세요.')
		            }
				 })
			})
		})
		
		$(document).ready(function(){
			$('.unRegBtn').click(function(){
				$.ajax({
					url : '${pageContext.request.contextPath}/account/unRegSP',
					type : 'post',
					data : {
						account_num : $(this).attr('id')
					}, success : function(data) {
						alert('성공')
						$('#${ account.account_num }').hide()
					}, error : function() {
						alert('재시도')
					}
				})
			})
		})
</script>
<style>
	.color {
		color: rgb(0,140,140);
	}
</style>
</head>
<body>

   <!-- header -->
   <jsp:include page="/header.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>주금통관리 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">주금통조회</h1>
          </div>
        </div>
      </div>
    </section>
           
           <section class="ftco-section ftco-portfolio">
       <div class="container">
       
             <div class="page-header">
		   <h3> <img src="resources/images/piggy.gif" width="100px"> ${ loginVO.name } 회원님이 현재 주금통 서비스에 등록한 계좌 정보입니다.</h3>      
		  </div>
		  <hr>

<!--        <img src="resources/images/piggy.gif">
       <img src="resources/images/piggybank.png"> -->
       

          <div class="row no-gutters">
    <c:forEach items="${ regAList }" var="account" varStatus="loop">
              <div class="col-md-6 portfolio-wrap">
                 <div class="row no-gutters align-items-center">
                 <!-- 이미지 -->
                       <div class="text pt-5 pl-0 pl-lg-5 pl-md-4 ftco-animate">
                          <div class="px-4 px-lg-4">
                             <div class="desc">
                                <div class="top" id = "${ account.account_num }">
                                   <span class="subheading">${ loginVO.name } 님의 통합계좌</span>
                                   <h3 class="mb-4 color">${ account.bank } <br> ${ account.alias } <br> ${ account.account_num } <br> 잔액 : ${ account.balance }원</h3>
                                </div>
<!--                                 <div class="absolute">
                                   <p>계좌상세를 열람하시려면 계좌를 클릭하세요</p>
                                </div> -->
                             </div>
                          </div>
                       </div>
                 </div>
                 <div align="right">
                 <br>
           	<input type ="button" class="spListBtn btn btn-success" id="${ account.account_num }" value="주금통 내역 조회">
           	<input type ="button" class="unRegBtn btn btn-success" id="${ account.account_num }" value="주금통 서비스 해지">
                 </div>
              </div>
       </c:forEach>
       
              <div class="col-md-6 portfolio-wrap">
                 <div class="row no-gutters align-items-center">
                 <!-- 이미지 -->
                       <div class="text pt-5 pr-md-5 ftco-animate">
                          <div class="px-4 px-lg-4">
                             <div class="desc text-md-right">
                                <div class="top">
                                   <span class="subheading">${ loginVO.name }님의 증권계좌</span>
                                   <h3 class="mb-4 color">하나금융투자 <br> ${ loginVO.account_num }</h3>
                                </div>

                             </div>
                          </div>
                    </div>
                 </div>
              </div>
           </div>
           </div>
           <div align="center" id="listTbl">
          		
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
