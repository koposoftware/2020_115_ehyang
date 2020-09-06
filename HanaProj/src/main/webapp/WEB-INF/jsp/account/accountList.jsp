<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
      <div class="container">
      
		   <div class="page-header">
		   <h3> <img src="resources/images/money.png" width="70px"> ${ loginVO.name } 회원님이 보유하신 하나은행 통합계좌 목록입니다.</h3>      
		  </div>
		  <hr>
      <h4 class="color">총 자산 : ${ sumTotal }원</h4>
        <table class="table table-bordered table-hover">
       <thead>
         <tr>
           <th align="center">은행</th>
           <th align="center">계좌번호</th>
           <th align="center">계좌별칭</th>
           <th align="center">잔액</th>
           <!-- <th align="center">등록</th> -->
         </tr>
       </thead>
       <tbody id="myTable">
       <c:forEach items="${ accountList }" var="account" varStatus="loop">
       <input type="hidden" name="account_num" value="${ account.account_num }">
         <tr>
           <td align="center">
           <c:if test="${ 'Y' eq account.register }">
           <span class="badge badge-info">주금통 등록</span>
           </c:if>
                ${ account.bank }</td>
           <td align="center">${ account.account_num }</td>
           <td align="center">${ account.alias }</td>
           <td align="center">${ account.balance }</td>
           <%-- <td align="center">${ account.register }</td> --%>
         </tr>
         
       </c:forEach>
       </tbody>
     </table>

     	<div align="center">
     	<a href="${ pageContext.request.contextPath }/autoTransfer"><button class="btn btn-success"> 주금통 서비스 신청하기 </button></a>
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