<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하나금융투자 주금통서비스</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/headernavhover.css">

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

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container-fluid">
       <a href="${ pageContext.request.contextPath }/">
       <img src="resources/images/hanatujalogo.png" style="width: 300px; height: 80px">
       </a>
         <%-- <a class="navbar-brand" href="${ pageContext.request.contextPath }">Hana SP.</a> --%>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>
         
         
         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
               <li class="nav-item">
                  <div class="dropdown">
                     <a class="nav-link" aria-expanded="false" href="${ pageContext.request.contextPath }"> HOME </a>
                  </div>
               </li>

               <%-- <li class="nav-item">
               <div class="dropdown">
                    <a class="nav-link" aria-expanded="false" href="${ pageContext.request.contextPath }"> Service </a>
                  </div>
               </li> --%>

               <li class="nav-item">
                  <div class="dropdown">
                     <a class="dropdown-toggle nav-link" id="dropdownMenuButton"
                        data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false" href="about.html"> 계좌관리 </a>
                     <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="${ pageContext.request.contextPath }/account">통합계좌조회</a>
                        <div class="dropdown-divider"></div>
                        <c:choose>
             <c:when test="${ empty loginVO.account_num }">
                       <a class="dropdown-item" href="${ pageContext.request.contextPath}/create">증권계좌개설</a>
                       <%-- <a class="dropdown-item" href="${ pageContext.request.contextPath}/createInMsg">비대면계좌개설</a> --%>
                       </c:when>
                       <c:otherwise>
                        <a class="dropdown-item" href="${ pageContext.request.contextPath}/ncreate">증권계좌개설</a>
                       </c:otherwise>
                       </c:choose>
                        <a class="dropdown-item" href="${ pageContext.request.contextPath}/sAccount">증권계좌조회</a>
                     </div>
                  </div>
               </li>
               
               
               <li class="nav-item">
            <div class="dropdown">
         <a class="dropdown-toggle nav-link"  id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="about.html">
            	My 주금통
         </a>
           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
             <%-- <a class="dropdown-item" href="${ pageContext.request.contextPath }/mySP">주금통 현황</a> --%>
             <a class="dropdown-item" href="${ pageContext.request.contextPath }/autoTransfer">주금통서비스 신청</a>
             <a class="dropdown-item" href="${ pageContext.request.contextPath }/spList">주금통서비스 조회 및 해지</a>
             <a class="dropdown-item" href="${ pageContext.request.contextPath }/plus">추가이체</a>
             <%-- <a class="dropdown-item" href="${ pageContext.request.contextPath }/mail">메일</a> --%>
           </div>
         </div>
            </li>
             <li class="nav-item">
		<div class="dropdown">
		         <a class="dropdown-toggle nav-link"  id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="about.html">
		            주식관리
		         </a>
		           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		             <a class="dropdown-item" href="${ pageContext.request.contextPath }/stock">KOSPI 50</a>
		             <%-- <a class="dropdown-item" href="${ pageContext.request.contextPath }/stockChart">주가 변동 현황</a> --%>
                     <div class="dropdown-divider"></div>
		             <a class="dropdown-item" href="${ pageContext.request.contextPath }/myBasket">관심종목 조회 및 매수</a>
		             <%-- <a class="dropdown-item" href="${ pageContext.request.contextPath }/canBuyList">구매가능</a> --%>
                     <div class="dropdown-divider"></div>
		             <a class="dropdown-item" href="${ pageContext.request.contextPath }/buyList">주식 체결 목록</a>
		             <%-- <a class="dropdown-item" href="${ pageContext.request.contextPath }/sellList">매매상세</a> --%>
		             <%-- <a class="dropdown-item" href="${ pageContext.request.contextPath }/sell">주식 매도하기</a> --%>
		           </div>
		         </div>
		
		</li>
             <!-- <li class="nav-item"><div class="dropdown">
         <a class="dropdown-toggle nav-link"  id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="about.html">
            고객센터
         </a>
           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
             <a class="dropdown-item" href="#">Action</a>
             <a class="dropdown-item" href="#">Another action</a>
             <a class="dropdown-item" href="#">Something else here</a>
           </div>
         </div></li> -->
           </ul>
           <c:choose>
             <c:when test="${ empty loginVO }">
                 <a href="${ pageContext.request.contextPath }/login"><button type="button" class="btn btn-success py-2 px-1 px-md-3">Login</button></a>
                 <span style="width: 10px">  </span>
                 <a href="${ pageContext.request.contextPath }/signUp"><button type="button" class="btn btn-success py-2 px-1 px-md-3">Sign up</button></a>
              </c:when>
              <c:otherwise>
                <a href="${ pageContext.request.contextPath }/logout"><button type="button" class="btn btn-success py-2 px-1 px-md-3">Logout</button></a>
           </c:otherwise>
           </c:choose>
         </div>
       </div>
     </nav>
</body>
</html>