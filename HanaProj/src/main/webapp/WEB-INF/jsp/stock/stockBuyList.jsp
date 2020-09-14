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
<script src="//code.jquery.com/jquery.min.js"></script>
<script>

// 수익률 조회
$(document).ready(function() {
      $('.rateBtn').click(function(){
           
    	  // 종목코드 - 매수금 - 매수량
           let elements = $(this).attr('id').split('-');
           /* alert(elements); */
           $.ajax({
                  url : '${pageContext.request.contextPath}/stock/rate',
                  type: 'post',
                  data : {
                     code : elements[0]
                  }, success : function(data) {
                      /* alert('성공')  */
                     /* console.log(data) */
                     $('#rateCount').empty();
                     $('#rateTbl').empty();
                     let str = elements[1]/elements[2];
                     /* alert(str) */
                     
                     $('#rateTbl').html(data);
                      $('#rateCount').append(str);
                  }, error : function() {
                     alert('다시 시도해주세요.')
                  }
             })
         })
      })
      
// id속성 지정 
   $(document).ready(function(){
      $(".sell").click(function(){
         let code = $(this).attr('id');
        /*  $('#'+code).toggle(); */
      })  
   })
      
      $(document).ready(function() {
    	  $('.sell').click(function(){
    		  /* alert('클릭'); */
    		  $.ajax({
    			  url : '${pageContext.request.contextPath}/stock/rate',
                  type: 'post',
                  data : {
                	  code : elements[0]
                  }, success : function(data) {
                	  let str = elements[0]
                	 /* alert(elements[0]); */
                	  $('#nowPriceHere').append(str)
                  }, error : function() {
                	  alert('다시시도해주세요');
                  }
    		  })
    	  })
      })
      
      // 수량*현재가
   $(document).ready(function(){
      $('.count').keyup(function(){
        /*  alert('k'); */
        
        // elements[0] : 현재가, elements[1] : 최대 가능 매도 수량
        let elements = $(this).attr('id').split('-');
        /* alert(elements[0] +" : " + elements [1]); */
        
        // count클래스의 값 keyup형태로 가져오기 // class도 name과 동일하게 중복을 허용하여 javascript를 이용하여 사용시엔 배열 인덱스를 필수로 넣어줘야함
        let c = document.getElementsByClassName("count")[0].value
        /* console.log(c)  */
        // ${ buy.price }-${ buy.count } (현재가, 수량)
        let p = $(this).attr('id').split('-');
        /* alert("p:"+p[0]+p[1]); */
        if(elements[1] < c){
        	alert('최대 매도 수량을 초과하였습니다.');
        	$('.count').val('');
        }
        	else {
        
        //count 클래스의 id를 ${ stock.price }로 설정해서 그 값 바로 가져오기
        /* console.log(typeof c); */
        //가격 넣어주기
        var sprice = p[0]*c
         /* console.log(sprice) */
         document.getElementById("realprice").value = sprice;
        }
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>주식관리 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">주식체결목록</h1>
          </div>
        </div>
      </div>
    </section>
      
    <section class="ftco-section">
    
    <div class="container" style="background-color: #fbfbfb">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">통합계좌목록</span>
            <h5 class="mb-3"><img src="resources/images/stockGo.png" width="70px"> ${ loginVO.name } 회원님의 주식 체결 목록입니다.</h5>
          </div>
        </div>
        
        
<%--         <div class="col-md-8 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-md-5 mb-md-4">
              <div class="text text-border d-flex align-items-center">
                <h4>총 자산액 : </h4>
                  <br>
                <h4 class="number color" data-number="${ sumTotal }">0</h4>
              </div>
            </div>
          </div> --%>
        
        <div class="row ftco-animate">
          <div class="col-md-12">
            <!-- <div class="carousel-testimony owl-carousel"> -->
            
            <c:forEach items="${ buyList }" var="buy" varStatus="loop">
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                  	<span class="fa fa-quote-left"></span>
                				<h3 style="color: #008c8c">${ buy.rownum }</h3>
                				종목 코드 : ${ buy.code }
                				<h5> 종목명 : ${ buy.name }</h5>
                				<h5> 보유수량 : ${ buy.count }</h5>
           						<h5> 매수금 : ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ buy.price }" /></h5>
           						<h5> 평가금액 : ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ buy.nowPrice * buy.count }" /></h5>
                				<h5> 매수 날짜 : ${ buy.reg_date }</h5>
                				
                				<c:choose>
                				<c:when test="${ buy.nowPrice * buy.count / buy.price >= 1 }">
                				<h5 style="color: red"> 수익률 : <fmt:formatNumber value="${ buy.nowPrice * buy.count / buy.price }" pattern=".000"/>%</h5>
                				</c:when>
								<c:otherwise>
								<h5 style="color: blue"> 수익률 : <fmt:formatNumber value="${ buy.nowPrice * buy.count / buy.price }" pattern=".000"/>%</h5>
								</c:otherwise>
								</c:choose>
                				<input type="button" class="rateBtn btn btn-success" id ="${ buy.code }-${ buy.price }-${ buy.count }"value="수익률 보기">
                				<input type="button" class="sell btn btn-success" id="${ buy.code }"  data-toggle="modal" data-target="#myModal${ buy.name }" value="매도">
                				
                  </div>
                <div id="rateTbl">
                				
               	</div>
                <div id ="rateCount">
                
                </div>
              </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
        
        <c:forEach items="${ buyList }" var="buy" varStatus="loop">
        <!-- 비밀번호 확인 모달 -->
         <!-- Modal -->
  <div class="modal fade" id="myModal${ buy.name }" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" align="center">
          <p>증권계좌 비밀번호를 입력해주세요.</p>
          <input type="password">
        </div>
        <div class="modal-footer" align="center">
         <input type="button" class="sell btn btn-success" id="${ stock.code }"  data-toggle="modal" data-target="#myModal${ buy.code }" value="확인">
        </div>
      </div>
      
    </div>
  </div>
         
         
         
         <!-- 매수모달 -->
                     <!-- Modal -->
  <div class="modal fade" id="myModal${ buy.code }" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title">${ buy.name } 매도</h3><h4 align="right"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
        <form action="${ pageContext.request.contextPath }/sell" method="post" name="sform">
        <div align="center">
        <img src="https://ssl.pstatic.net/imgfinance/chart/item/area/day/${ buy.code }.png">
        </div>
        <input type="hidden" name="code" value="${ buy.code }">
       <div align="center">
        <br>
        <hr>
            <p style="background-color: #008c8c; color: #ffffff">고객정보</p>
        </div>
          <div class="row">
          <div class="col">
          <label for="recipient-name" class="col-form-label">Id</label>
            <input type="text" id="recipient-name" value="${ loginVO.id }" name="id" readonly class="form-control-plaintext">
          </div>
          <div class="col">
            <label for="recipient-name" class="col-form-label">증권계좌</label>
            <input type="text" id="recipient-name" value="${ loginVO.account_num }" name="account_num" readonly class="form-control-plaintext">
          </div>
          
          <%-- <div class="col">
          <label for="message-text" class="col-form-label">잔액</label><br>
            ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${ price }" />${ price }
          </div>  --%>
          
          </div>
      <div align="center">
          <hr>
             <p style="background-color: #008c8c; color: #ffffff">매도정보</p>
      </div>
          <div class="row">
          <div class="col">
           <label for="recipient-name" class="col-form-label">종목명</label>
            <input type="text" id="recipient-name" value="${ buy.name }" name="name" readonly class="form-control-plaintext">
          </div>
          <div class="col">
           <label for="recipient-name" class="col-form-label">최대 매도 가능 수량</label>
            <input type="text" id="recipient-name" value="${ buy.count }" readonly class="form-control-plaintext" id="maxBuy">
          </div>
          <div class="col">
          <label for="recipient-name" class="col-form-label">현재가</label><br>
          	<!-- <input type="text" id="nowPriceHere" value="42300" readonly class="form-control-plaintext"> -->
            ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${ buy.nowPrice }"/>
          </div>
          </div>
           
          <hr>

          <div class="row">
          <div class="col">
          <label for="recipient-name" class="col-form-label">지정가 매도</label>
          <div class="input-group">
            <input type="text" class="count form-control" id="${ buy.nowPrice }-${ buy.count }" placeholder="매도할 수량을 입력하세요." name="count" required="required" aria-label="Amount (to the nearest dollar)">
            <span class="input-group-addon">(주)</span>
            </div>
            <%-- <input type="button" value="가능 100%" class="maxBtn btn btn-success" id="${ saccbalance }-${ stock.price }-max">
            <input type="button" value="가능 50%" class="midBtn btn btn-success" id="${ saccbalance }-${ stock.price }-mid">
            <input type="button" value="가능 25%" class="minBtn btn btn-success" id="${ saccbalance }-${ stock.price }-min"> --%>
          </div>
          <div class="col">
           <label for="message-text" class="col-form-label">평가금액</label>
            <input type="text" class="form-control" id = "realprice" name="price" required="required" width="50%" >
          </div>
        </div>
        <br>
        <div align="center">
        <hr>
          <input type="submit" class="btn btn-success" value="매도">
        </div>
        </form>
        </div>
<!-- 
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
    </div>
    </div>
        </c:forEach>
        
        
        
        
        
        
        
        
        
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