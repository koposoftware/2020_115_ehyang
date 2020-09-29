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
<%= today %></span>&nbsp;<span class="badge badge-info float-right">실시간</span>
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
                  	<a href="${ pageContext.request.contextPath}/createInMsg">
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
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                  	<span class="fa fa-quote-left"></span>
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(images/person_3.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                  	<span class="fa fa-quote-left"></span>
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                  	<span class="fa fa-quote-left"></span>
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>







































    <section class="ftco-section ftco-no-pb ftco-no-pt bg-primary">
      <div class="container">
        <div class="row d-flex no-gutters">
          <div class="col-md-3 d-flex align-items-stretch ftco-animate">
            <div class="media block-6 services services-bg d-block text-center px-4 py-5">
            	<div class="icon d-flex justify-content-center align-items-center"><span class="flaticon-system"></span></div>
              <div class="media-body py-md-4">
                <h3>비대면계좌 개설</h3>
                <p>App 설치 없이 쉽고 빠르게,<br>하나금융투자 비대면 계좌개설</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-items-stretch ftco-animate">
            <div class="media block-6 services services-bg services-darken d-block text-center px-4 py-5">
            	<div class="icon d-flex justify-content-center align-items-center"><span class="flaticon-supervised"></span></div>
              <div class="media-body py-md-4">
                <h3>영업점계좌 개설</h3>
                <p>영업점을 방문하여 직접 계좌를 개설해보세요!</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex align-items-stretch ftco-animate">
            <div class="media block-6 services services-bg services-lighten d-block text-center px-4 py-5">
            	<div class="icon d-flex justify-content-center align-items-center"><span class="flaticon-accounting"></span></div>
              <div class="media-body py-md-4">
                <h3>은행제휴계좌 개설</h3>
                <p>하나금융투자와 제휴한 해당은행 전국 영업점을 방문하시면 어느 곳에서나 편리하게 계좌를 개설하실 수 있습니다</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-items-stretch ftco-animate">
            <div class="media block-6 services services-bg d-block text-center px-4 py-5">
            	<div class="icon d-flex justify-content-center align-items-center"><span class="flaticon-blueprint"></span></div>
              <div class="media-body py-md-4">
                <h3>온라인 상품계좌 개설</h3>
                <p>하나금융투자의 영업점, 온라인채널을 통해 개설된 계좌 또는 은행을 통해 개설한 계좌에서 거래 가능한 상품(예: 펀드매매만 가능한 계좌(수익증권)만 개설한 경우)외 주식, 파생, 해외주식, FX, 연금 등의 상품을 매매하고자 하는 경우 해당 계좌 (실명확인된 수익증권 계좌)를 근거로 추가로 상품계좌를 온라인에서 개설하는 서비스입니다.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>

    
    <section class="ftco-section ftco-no-pb ftco-no-pt">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 order-md-last d-md-flex align-items-stretch">
						<div class="img w-100 img-2 mr-md-2" style="background-image: url(resources/images/about.jpg);"></div>
						<div class="img w-100 img-2 img-overlay ml-md-2 p-4" style="background-image: url(resources/images/about-2.jpg);">
							<div class="request-quote py-5">
	    					<div class="py-2">
	    						<span class="subheading">Be Part of our Business</span>
	    						<h3>Request A Quote</h3>
	    					</div>
	    					<form action="#" class="request-form ftco-animate">
			    				<div class="form-group">
			    					<input type="text" class="form-control" placeholder="First Name">
			    				</div>
			    				<div class="form-group">
			    					<input type="text" class="form-control" placeholder="Last Name">
			    				</div>
		    					<div class="form-group">
			    					<div class="form-field">
	          					<div class="select-wrap">
	                      <div class="icon-arr"><span class="ion-ios-arrow-down"></span></div>
	                      <select name="" id="" class="form-control">
	                      	<option value="">Select Your Services</option>
	                        <option value="">Construction</option>
	                        <option value="">Renovation</option>
	                        <option value="">Interior Design</option>
	                        <option value="">Exterior Design</option>
	                        <option value="">Painting</option>
	                      </select>
	                    </div>
			              </div>
			    				</div>
		    					<div class="form-group">
			    					<input type="text" class="form-control" placeholder="Phone">
			    				</div>
		    					<div class="form-group">
			              <textarea name="" id="" cols="30" rows="2" class="form-control" placeholder="Message"></textarea>
			            </div>
			            <div class="form-group">
			              <input type="submit" value="Request A Quote" class="btn btn-primary py-3 px-4">
			            </div>
			    			</form>
	    				</div>
						</div>
					</div>
					<div class="col-lg-5 wrap-about py-md-5 ftco-animate">
	          <div class="heading-section pr-md-5">
	            <h2 class="mb-4">ArchLab</h2>

	            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	            <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.</p>
	          </div>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row pt-md-5">
          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-md-5 mb-md-4">
              <div class="text text-border d-flex align-items-center">
                <strong class="number" data-number="1000">0</strong>
                <span>Years of <br>Experienced</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-md-5 mb-md-4">
              <div class="text text-border d-flex align-items-center">
                <strong class="number" data-number="2500">0</strong>
                <span>Project <br>Done</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-md-5 mb-md-4">
              <div class="text text-border d-flex align-items-center">
                <strong class="number" data-number="500">0</strong>
                <span>Licensed <br>Architect</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-md-5 mb-md-4">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="67">0</strong>
                <span>Happy <br>Customers</span>
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