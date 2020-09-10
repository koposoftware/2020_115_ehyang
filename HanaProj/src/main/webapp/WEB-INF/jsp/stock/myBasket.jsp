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
	$(document).ready(function(){
			$('.delBasket').click(function(){
				
				let element = $(this).attr('id').split('-');
				alert(element[0]+":"+element[1])
				
				alert('클릭')
				$.ajax({
					url : '${pageContext.request.contextPath}/stock/delBasket',
					type : 'post',
					data : {
						code : element[0],
						id : element[1]
					}, success : function(data) {
						alert('성공')
					}, error : function(){
						alert('재시도')
					}
				})
			})
		})
		
		// id속성 지정 
   $(document).ready(function(){
      $(".buy").click(function(){
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
            <h1 class="mb-3 bread">나의 관심종목 조회</h1>
          </div>
        </div>
      </div>
    </section>

	<section class="ftco-section">
      <div class="container">
      
      	<div class="page-header">
		   <h3> <img src="resources/images/money.png" width="70px"> ${ loginVO.name } 회원님의 주식 관심종목입니다.</h3>      
		  </div>
		 <hr>
      
        <table class="table table-bordered table-hover">
       <thead>
         <tr align="center">
           <th align="center" style="width: 15%">종목명</th>
           <th align="center" style="width: 10%">주가</th>
           <th align="center" style="width: 10%">찜한 날짜</th>
           <th align="center" style="width: 10%">관심종목 삭제</th>
           <th align="center" style="width: 10%">매수하기</th>
         </tr>
       </thead>
       <tbody id="myTable">
       <c:forEach items="${ basketList }" var="stock" varStatus="loop">
         <tr id = "${ stock.code }">
           <td align="center">${ stock.name }</td>
           <td align="center">${ stock.price }원</td>
           <td align="center">${ stock.reg_date }</td>
           <td align="center">
           <input type ="button" class="delBasket btn btn-success" id="${ stock.code }-${ stock.id }" value="관심종목에서 삭제">
           </td>
           <%-- <input type ="button" class="buyBtn btn btn-success" id="${ stock.code }-${ stock.id }-${stock.name}" value="매수"> --%>
           <td align="center"><input type="button" class="buy btn btn-success" id="${ stock.code }"  data-toggle="modal" data-target="#myModal${ stock.code }" value="매수"></td>
         </tr>
         
         
                     <!-- Modal -->
  <div class="modal fade" id="myModal${ stock.code }" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title">${ stock.name } 매수</h3><h4 align="right"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
        <form action="${ pageContext.request.contextPath }/buy" method="post">
        <div align="center">
        <img src="https://ssl.pstatic.net/imgfinance/chart/item/area/day/${ stock.code }.png">
        </div>
        <input type="hidden" name="code" value="${ stock.code }">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">고객 증권계좌번호</label>
            <input type="text" class="form-control" id="recipient-name" value="${ loginVO.account_num }" name="account_num" readonly="readonly">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">고객 id</label>
            <input type="text" class="form-control" id="recipient-name" value="${ loginVO.id }" name="id" readonly="readonly">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">종목명</label>
            <input type="text" class="form-control" id="recipient-name" value="${ stock.name }" name="name" readonly="readonly">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">지정가 구매</label>
            <input type="text" class="form-control" id="recipient-name" placeholder="구매할 수량을 입력하세요." name="count">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">가격</label>
            <input type="text" class="form-control" id="recipient-name" name="price">
          </div>
          <input type="submit" value="매수">
        </form>
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