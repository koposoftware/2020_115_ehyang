<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }

  </style>
<script>

// 검색
   $(document).ready(function(){
     $("#myInput").on("keyup", function() {
       var value = $(this).val().toLowerCase();
       $("#myTable tr").filter(function() {
         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
       });
     });
   });
   
//   관심종목에 추가
   $(document).ready(function() {
    
      $('.addFavoriteBtn').click(function() {
         let btn = this;
         // 종목명-고객id-종목코드 값에서 '-'를 뺀 것을 elements에 넣음
         let elements = $(this).attr('id').split('-');
         /* alert(elements[0] + ' : ' + elements[1] + ' : ' + elements[2]) */
         alert(elements[1] + '님 ' + elements[0] + '을(를) 관심종목으로 선택하셨습니다.')
         
         $.ajax({
            url : '${pageContext.request.contextPath}/stock/addFavorite',
            type: 'post',
            data : {
               id : elements[1],
               code : elements[2],
               name : elements[0],
               price : elements[3]
            }, success : function() {
               /* alert('성공') */
               $(btn).attr('disabled', true)
            }, error : function() {
               alert('다시 시도해주세요.')
            }
         });
      })
   })
   
// 그래프  
   $(document).ready(function(){
      $(".chart").click(function(){
         let code = $(this).attr('id');
        /*  $('#'+code).toggle(); */
      })  
   })
</script>
</head>
<body>
<!-- header -->
   <jsp:include page="/header.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>주식관리 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">전체 주식 조회</h1>
          </div>
        </div>
      </div>
    </section>
    
     <section class="ftco-section">
      
      <div class="container">
      
      <div class="jumbotron">
  <!-- <h1 class="display-4"></h1> -->
  <p class="lead">${ loginVO.name } 님. 주식 캔들차트(봉차트)가 궁금하신가요?</p>
  <hr class="my-4">
  <p align="center">주식을 처음 시작하는 당신을 위하여 주금통에서 주식 캔들(봉)차트 읽는 법을 알려드릴게요.<br> 간단히 참고하여 매수를 원하는 관심종목을 등록해보세요!</p>
  
  <div align="center">
   <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-sm">캔들(봉)차트란?</button>
   </div>
   <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
       <div class="modal-content">
         <img src="resources/images/stock1.jpg">
         <img src="resources/images/stock2.jpg">
         <img src="resources/images/stock3.jpg">
         <img src="resources/images/stock4.jpg">
         <img src="resources/images/stock5.jpg">
         <img src="resources/images/stock6.jpg">
         <img src="resources/images/stock7.jpg">
         <img src="resources/images/stock8.jpg">
         <img src="resources/images/stock9.jpg">
         <img src="resources/images/stock10.jpg">
       </div>
             <div class="modal-footer">
             <div align="center">
           <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100px; height: 50px">확인</button>
             </div>
         </div>
     </div>
   </div>
</div>
      
      
      	<div class="page-header">
		   <h3> <img src="resources/images/stock.png" width="70px"> 주식 정보를 살펴보고 원하는 종목을 관심종목에 추가해보세요!</h3>      
		  </div>
		 <hr>      
      
        <input class="form-control" id="myInput" type="text" placeholder="원하는 종목을 검색하세요">
        <br>
       <div align="right">
       <span class="badge badge-info">최근 업데이트 </span>&nbsp ${ stockRegdate } 기준
       </div>
        <table class="table table-bordered table-hover">
       <thead>
         <tr align="center">
           <th align="center" style="width: 15%">종목명</th>
           <th align="center" style="width: 10%">분류</th>
           <!-- <th align="center" style="width: 10%">기준</th> -->
           <th align="center" style="width: 10%">주가</th>
           <th align="center" style="width: 10%">차트</th>
           <th align="center" style="width: 10%">선택</th>
         </tr>
       </thead>
       <tbody id="myTable">
       <c:forEach items="${ stockList }" var="stock" varStatus="loop">
         <tr>
           <td align="center">${ stock.name }</td>
           <td align="center">${ stock.category }</td>
           <%-- <td align="center">${ stock.reg_date }</td> --%>
           <td align="center">${ stock.price }</td>
           <td align="center"><input type="button" class="chart btn btn-success" id="${ stock.code }"  data-toggle="modal" data-target="#myModal${ stock.code }" value="차트"></td>
           <td align="center"><input type="button" class="addFavoriteBtn btn btn-success" id="${ stock.name }-${ loginVO.id }-${ stock.code }-${ stock.price}" <c:if test="${stock.flag == 1 }">disabled </c:if> value="관심종목으로 등록"></td>
         </tr>
             <!-- Modal -->
  <div class="modal fade" id="myModal${ stock.code }" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">${ stock.name }의 주가변동 그래프</h4><pre>&nbsp&nbsp${ stock.reg_date }기준 </pre>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        
        <div class="modal-body">
         <%-- <div class="chartByStockCode" id ="${ stock.code }"><br><img id="img_chart_area" src="https://ssl.pstatic.net/imgfinance/chart/item/area/day/${ stock.code }.png"></div> --%>
        
        <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
    <h4>선차트</h4>
      <img src="https://ssl.pstatic.net/imgfinance/chart/item/area/day/${ stock.code }.png">
    </div>
    <div class="carousel-item">
    <h4>일봉차트</h4>
      <img src="https://ssl.pstatic.net/imgfinance/chart/item/candle/day/${ stock.code }.png">
    </div>
    <div class="carousel-item">
    <h4>주봉차트</h4>
      <img src="https://ssl.pstatic.net/imgfinance/chart/item/candle/week/${ stock.code }.png">
    </div>
    <div class="carousel-item">
    <h4>월봉차트</h4>
      <img src="https://ssl.pstatic.net/imgfinance/chart/item/candle/month/${ stock.code }.png">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
  <img src="resources/images/left-arrow.png" width="50px">
    <!-- <span class="carousel-control-prev-icon"></span> -->
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <img src="resources/images/right-arrow.png" width="40px">
  </a>
</div>
        </div>
        
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    </div>
       </c:forEach>
       </tbody>
     </table>
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