<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/stock/kospi',
			success : function(data) {
				
				let list = JSON.parse(data);
				console.log(list);
				
				$(list).each(function(){
					
				let str = '';
				if(this.arrow == '하락'){
				str += '<strong style="color: #000000">'+'코스피 KOSPI'+'</strong>';
				str += '&nbsp;&nbsp;&nbsp;'
				str += '<strong style="color: blue; font-size: 15pt">' + this.k_index + '</strong>';
				str += '&nbsp;&nbsp;&nbsp;'
				str += '<span style="color: blue; font-size: 15pt">' + '▼' + '</span>';
				str += '<span style="color: blue; font-size: 15pt">' + this.updown + '</span>';
				str += '&nbsp;&nbsp;&nbsp;'
				str += '<span style="color: blue; font-size: 15pt">' + '-' + '</span>';
				str += '<span style="color: blue; font-size: 15pt">' + this.percent + '</span>';
				
				} else {
				str += '<strong style="color: #000000">'+'코스피 KOSPI'+'</strong>';
				str += '&nbsp;&nbsp;&nbsp;'
				str += '<strong style="color: red; font-size: 20pt">' + this.k_index + '</strong>';
				str += '&nbsp;&nbsp;&nbsp;'
				str += '<span style="color: red; font-size: 15pt">' + '▲' + '</span>';
				str += '<span style="color: red; font-size: 15pt">' + this.updown + '</span>';
				str += '&nbsp;&nbsp;&nbsp;'
				str += '<span style="color: red; font-size: 15pt">' + '+' + '</span>';
				str += '<span style="color: red; font-size: 15pt">' + this.percent + '</span>';
				}
				
				$('#kospiDiv').append(str);
				})
				
			} ,error : function() {
				alert('재시도');
			}
		})
	})
</script>

  <body>
	<!-- header -->
	  <jsp:include page="header.jsp" />
    <!-- END nav -->
    
    <section class="hero-wrap" style="background-image: url('resources/images/bg_1.jpg');" data-stellar-background-ratio="0.3">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center d-flex">
          <div class="ftco-animate d-flex align-items-end">
          	<div class="text">
	            <h1 class="mb-4" style="font-family: 'paybooc-Bold'">주식의<span style="padding: 5pt">첫 걸음</span>하나금융투자&nbsp;&nbsp;</h1>
	            <p style="font-size: 18px;">당신의 주식 저금통. 하나 주금통</p>
	            <div class="d-flex meta">
		            <!-- <div class=""><p class="mb-0"><a href="#" class="btn btn-primary py-3 px-2 px-md-4">Explore Projects</a></p></div>
		            <a href="#" class="d-flex align-items-center button-link">
		            	<div class="button-video d-flex align-items-center justify-content-center">
			            	<span class="fa fa-play"></span>
			            </div>
			            <span>Watch our video</span>
		            </a>-->
		          </div>
            </div>
          </div>
          
          <!-- <div class="text">
	            <h1 class="mb-4" style="font-family: 'paybooc-Bold'; color: #008c8c">Hana <span style="color: #008c8c">Stock</span> Piggy Bank</h1>
	            <p style="font-size: 18px;"> 안녕하세요 :) 하나 주금통서비스입니다.</p>
	            <div class="d-flex meta">
		            <div class=""><p class="mb-0"><a href="#" class="btn btn-primary py-3 px-2 px-md-4">Explore Projects</a></p></div>
		            <a href="#" class="d-flex align-items-center button-link">
		            	<div class="button-video d-flex align-items-center justify-content-center">
			            	<span class="fa fa-play"></span>
			            </div>
			            <span>Watch our video</span>
		            </a>
		          </div>
            </div> -->
            <div class="p-3 ml-auto" style="background-color: #f9f9f9;  
   border-radius: 0.35rem;
   box-shadow: 0 0.5rem 1.75rem 0 rgba(58, 59, 69, 0.5) !important;">
   <strong style="color: #000000; font-size: 18pt">오늘의 증시</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="float-right" style="font-size: 5pt; color: #000000"><%

  Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E a hh:mm:ss");
 
 String today = sf.format(now);
%>
 <%-- <%= now %><br> --%>
 <%= today %> </span>&nbsp;<span class="badge badge-info float-right">실시간</span>
   <hr>
   <div id="kospiDiv">
   
   </div>
          <img width="500px" height="200px" src="https://t1.daumcdn.net/finance/chart/kr/daumindex/i/D0011001.png">
          <!-- <strong style="color: blue; font-size: 20pt">연습용</strong> -->
          </div>
        </div>
      </div>
    </section>















<section class="ftco-section testimony-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">처음오셨나요?</span>
            <!-- <h2 class="mb-3">하나금융투자의 편리한 시스템을 만나보세요 :)</h2> -->
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                  	<span class="fa fa-quote-left"></span>
                  	<div>
                  	<a href="https://www.hanaw.com/main/customer/openAccount/CS_180100_P.cmd">
                  	<img src="resources/images/createaccount.png">
                  	</a>
                  	</div>
                  	<br>
                    <p class="mb-4"style="font-family: 'paybooc-Bold'; color: black" align="center">App 설치 없이 쉽고 빠르게,<br>하나금융투자 비대면 계좌개설</p>
                    <!-- <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div> -->
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                  	<span class="fa fa-quote-left"></span>
                  	<div>
                  	<a href="https://www.hanaw.com/corebbs5/eventIng/view/view.cmd?bbsSeq=344">
                  	<img src="resources/images/dd.png">
                  	</a>
                  	</div>
                  	<br>
                    <p class="mb-4"style="font-family: 'paybooc-Bold'; color: black" align="center">하나 고배당 금융테크랩 V2 출시</p>
                    <!-- <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div> -->
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                  	<span class="fa fa-quote-left"></span>
                  	<div>
                  	<a href="https://www.hanaw.com/corebbs5/eventIng/view/view.cmd?bbsSeq=345">
                  	<img src="resources/images/sgx.png">
                  	</a>
                  	</div>
                  	<br>
                    <p class="mb-4"style="font-family: 'paybooc-Bold'; color: black" align="center">싱가포르거래소(SGX)에서 수수료$2.9로<br>거래하고 경품도 받자!</p>
                    <!-- <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div> -->
                  </div>
                </div>
              </div>
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