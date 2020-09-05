<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .chartByStockCode {
      display: none
   }

</style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
   
// 그래프  
   $(document).ready(function(){
      $(".chart").click(function(){
         let code = $(this).attr('id');
         $('#'+code).toggle();
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
            <h1 class="mb-3 bread">주가 변동 현황</h1>
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
  <p align="center">주식을 처음 시작하는 당신을 위하여 주금통에서 주식 캔들(봉)차트 읽는 법을 알려드릴게요.<br> 간단히 참고하여 관심종목을 등록해보세요!</p>
  
  <div align="center">
   <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-sm">캔들(봉)차트란?</button>
   </div>
   <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
       <div class="modal-content">
         <img src="resources/images/s1.jpg">
         <img src="resources/images/s2.jpg">
         <img src="resources/images/s3.jpg">
         <img src="resources/images/s4.jpg">
         <img src="resources/images/s5.jpg">
         <img src="resources/images/s6.jpg">
       </div>
             <div class="modal-footer">
             <div align="center">
           <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100px; height: 50px">동의</button>
             </div>
         </div>
     </div>
   </div>
</div>
      
      	<div class="page-header">
		   <h3> <img src="resources/images/stock.png" width="70px"> 주식 일봉, 주봉, 월봉 차트를 확인해보세요.</h3>      
		  </div>
		 <hr>      
      
        <input class="form-control" id="myInput" type="text" placeholder="원하는 종목을 검색하세요">
        <br>
        <table class="table table-bordered table-hover">
       <thead>
         <tr align="center">
           <th align="center" style="width: 10%">종목명</th>
           <th align="center" style="width: 10%">현재가</th>
           <th align="center" style="width: 10%" colspan="3">봉차트</th>
         </tr>
       </thead>
       <tbody id="myTable">
       <c:forEach items="${ chartList }" var="stock" varStatus="loop">
         <tr>
           <td align="center">${ stock.name }</td>
           <td align="center">${ stock.price }원</td>
           <td align="center"><input type="button" class="chart btn btn-success" id="${ stock.code }"  data-toggle="modal" data-target="#myModal${ stock.code }" value="일봉"></td>
           <td align="center"><input type="button" class="chart btn btn-success" id="${ stock.code }W"  data-toggle="modal" data-target="#myModal${ stock.code }W" value="주봉"></td>
           <td align="center"><input type="button" class="chart btn btn-success" id="${ stock.code }M"  data-toggle="modal" data-target="#myModal${ stock.code }M" value="월봉"></td>
         </tr>
             <!-- Modal -->
  <div class="modal fade" id="myModal${ stock.code }" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">${ stock.name }의 일봉 그래프</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
         <div class="chartByStockCode" id ="${ stock.code }"><br><img id="img_chart_area" src="https://ssl.pstatic.net/imgfinance/chart/item/candle/day/${ stock.code }.png"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    </div>
    
    
      <div class="modal fade" id="myModal${ stock.code }W" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">${ stock.name }의 주봉 그래프</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
         <div class="chartByStockCode" id ="${ stock.code }W"><br><img id="img_chart_area" src="https://ssl.pstatic.net/imgfinance/chart/item/candle/week/${ stock.code }.png"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    </div>
    
    
      <div class="modal fade" id="myModal${ stock.code }M" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">${ stock.name }의 월봉 그래프</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
         <div class="chartByStockCode" id ="${ stock.code }M"><br><img id="img_chart_area" src="https://ssl.pstatic.net/imgfinance/chart/item/candle/month/${ stock.code }.png"></div>
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