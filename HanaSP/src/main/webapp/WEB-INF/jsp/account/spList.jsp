<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>

 let num = '';

// 거래내역 조회
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
      
// 인증번호를 문자로 받기      
      $(document).ready(function(){
    	  $('.receive').click(function(){
    		  /* alert('인증번호가 발송되었습니다.'); */
    		  
    		  $.ajax({
    			  url : '${pageContext.request.contextPath}/account/unRegSPMsg',
    			  type : 'post',
    			  
    			   success : function(data) {
    				  alert('인증번호가 발송되었습니다.');
    				  num = data;
    				  console.log('num : ' + num);
    				  /* let code = $.session("authCode", authCode);
    				  alert(code); */
    				  /* alert(authCode); */
    			  }, error : function(){
    				  alert('실패');
    			  }
    		  })
    	  })
      })
      
// 인증번호 확인
$(document).ready(function(){
	$('.unRegBtn').on('click', function(){
		/* alert('클릭'); */
		/* var session = '@Session["authCode"]'; */
		/* var code = $.session("authCode", authCode); */
		let input = $('.inputNum').val();
		console.log('input : ' + input)
		/* alert(code); */
		if(num == input) {
	        	let h = $(this).attr('id');
	            $.ajax({
	               url : '${pageContext.request.contextPath}/account/unRegSP',
	               type : 'post',
	               data : {
	            	   account_num : $(this).attr('id')
	               }, success : function(data) {
	                  alert('서비스 해지 완료');
	                  /* alert(authCode); */
	                  location.href = "${pageContext.request.contextPath}/spList";
	                $('#'+h+'div').hide();
	               }, error : function() {
	                  alert('재시도')
	                  alert(authCode);
	               }
	            })
		} else {
			alert('인증번호가 일치하지 않습니다.');
			return false;
		}
	})
})
	
// 이메일 인증번호 전송
var certificationNumber = '';

$(document).ready(function(){
   $('#emailSend').click(function(){
      
      $.ajax({
         url:'${ pageContext.request.contextPath }/unRegSPEmail',
         type:'get',
         success : function(data){
            toMail : 
            $("#sendEmailModal").modal('show');
            certificationNumber = data;
            
         },
         error : function(){
            alert("이거")
         }
      
      })
   })
})

// 이메일 인증 확인하기
$(document).ready(function(){
   
   $('#certConfirm').click(function(){
      let certification = $('#certification').val();
      certificationNumber = certificationNumber.substring(1,7);
      
      console.log(certification);
      console.log(certificationNumber);
      if(certificationNumber == certification){
         $("#completeEmailModal").modal('show');
      } else{
         alert("fail")
      }
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
              <div class="col-md-6 portfolio-wrap" id = "${ account.account_num }div">				<!-- 여기여기 -->
                 <div class="row no-gutters align-items-center">
                 <!-- 이미지 -->
                       <div class="text pt-5 pl-0 pl-lg-5 pl-md-4 ftco-animate">
                          <div class="px-4 px-lg-4">
                             <div class="desc">
                                <div class="top">
                                   <span class="subheading">${ loginVO.name } 님의 통합계좌</span>
                                   <h3 class="mb-4 color">${ account.bank }
                                    <br> ${ account.alias }
                                     <br> ${ account.account_num }
                                      <br> 잔액 : ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ account.balance }" /></h3>
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
              
              
              
                         <!-- Button trigger modal -->
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#choose">
              주금통 서비스 해지
</button>
              
              
              
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
           
           
           
           
           
 
 
 <!-- 주금통 서비스 해지시 이메일 or 문자 선택 -->          
         
 <div class="modal fade" id="choose" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">인증방식을 선택해주세요.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div align="center">
        <button type="button" class="btn btn-outline-light text-dark" style="font-size: 15pt" data-toggle="modal" data-target="#useEmail"><img src="resources/images/email.png"><br>이메일 인증</button>
        <button type="button" class="btn btn-outline-light text-dark" style="font-size: 15pt" data-toggle="modal" data-target="#usePhone"><img src="resources/images/phone.png"><br>휴대폰 인증</button>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="unRegBtn btn btn-primary" id="${ account.account_num }">확인</button>
      </div>
    </div>
  </div>
</div>        
         
   
           


<!-- 휴대폰 본인인증 -->
<c:forEach items="${ regAList }" var="account" varStatus="loop">
<div class="modal fade" id="usePhone" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">주금통 서비스 해지</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input type="text" placeholder="인증번호 입력" class="inputNum">
      <input type="button" class="receive btn btn-primary" value="인증번호 발송"><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="unRegBtn btn btn-primary" id="${ account.account_num }">확인</button>
      </div>
    </div>
  </div>
</div>
</c:forEach>
           
<!-- 이메일 본인인증 -->
<c:forEach items="${ regAList }" var="account" varStatus="loop">
<div class="modal fade" id="useEmail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">주금통 서비스 해지</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input type="text" placeholder="이메일 입력" class="inputEmail" name="toMail">
      <input type="button" class="receive btn btn-primary" value="인증번호 받기" id ="emailSend"><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="unRegBtn btn btn-primary" id="${ account.account_num }">확인</button>
      </div>
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