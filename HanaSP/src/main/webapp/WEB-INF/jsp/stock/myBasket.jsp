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
   // 관심종목에서 삭제
   $(document).ready(function(){
         $('.delBasket').click(function(){
            
            let element = $(this).attr('id').split('-');
            alert(element[1]+"님"+element[0]+"를 관심종목에서 삭제하셨습니다.")
            
            $.ajax({
               url : '${pageContext.request.contextPath}/stock/delBasket',
               type : 'post',
               data : {
                  code : element[0],
                  id : element[1]
               }, success : function(data) {
                  /* alert('성공')
                  alert(element[0]) */
                  $('#'+element[0]+'tr').hide();
               }, error : function(){
                  alert('재시도')
               }
            })
         })
      })
      
      // id속성 지정 
   /* $(document).ready(function(){
      $(".buy").click(function(){
         let code = $(this).attr('id');
        $('#'+code).toggle();
      })  
   }) */
   
   // 가능 100%
   $(document).ready(function(){
      $(".maxBtn").click(function(){
    	  console.log($(this).attr('name'));
         let max = $(this).attr('name').split('-');
         console.log(max);
        /* alert(max[0]);
        alert(max[1]);
        alert(max[2]); */
        
        // max[0] : 잔액, max[1] : 1주가격
         let maxNum = max[0]/max[1];
        // realMaxNum : 최대 구매할 수 있는 가격
         let realMaxNum = Math.floor(maxNum)
        /* alert(maxNum); */
        let st = max[1]*realMaxNum
        /* alert(st) */
        document.getElementsByClassName("count")[0].value = realMaxNum;
        
         document.getElementsByClassName("realprice").value = st;
      })  
   })
   
   
   // 가능 50%
   $(document).ready(function(){
      $(".midBtn").click(function(){
         let max = $(this).attr('id').split('-');
        /* alert(max[0]);
        alert(max[1]);
        alert(max[2]); */
        
        // max[0] : 잔액, max[1] : 1주가격
         let maxNum = max[0]/max[1]/2;
        // realMaxNum : 최대 구매할 수 있는 가격
         let realMaxNum = Math.floor(maxNum)
        /* alert(maxNum); */
        let st = max[1]*realMaxNum
        /* alert(st) */
        document.getElementsByClassName("count")[0].value = realMaxNum;
        
         document.getElementsByClassName("realprice").value = st;
      })  
   })
   
   
   // 가능 25%
   $(document).ready(function(){
      $(".minBtn").click(function(){
         let max = $(this).attr('id').split('-');
        /* alert(max[0]);
        alert(max[1]);
        alert(max[2]); */
        
        // max[0] : 잔액, max[1] : 1주가격
         let maxNum = max[0]/max[1]/4;
        // realMaxNum : 최대 구매할 수 있는 가격
         let realMaxNum = Math.floor(maxNum)
        /* alert(maxNum); */
        let st = max[1]*realMaxNum
        /* alert(st) */
        document.getElementsByClassName("count")[0].value = realMaxNum;
        
         document.getElementsByClassName("realprice").value = st;
      })  
   })
   
   // 수량*현재가
   $(document).ready(function(){
      $('.count').keyup(function(){
        /*  alert('k'); */
        
        // count클래스의 값 keyup형태로 가져오기 // class도 name과 동일하게 중복을 허용하여 javascript를 이용하여 사용시엔 배열 인덱스를 필수로 넣어줘야함
        let c = document.getElementsByClassName("count")[0].value
        console.log(c) 
        
        //count 클래스의 id를 ${ stock.price }로 설정해서 그 값 바로 가져오기
        let p = $(this).attr('id');
        
        //가격 넣어주기
        let sprice = p*c
         /* console.log(sprice) */
         document.getElementsByClassName("realprice").value = sprice;
      })
   })
   
  
   
   
   // 매수 전 비밀번호 확인
   $(document).ready(function(){
      $(".pwChk").click(function(){
         console.log(this)
         $('.check').empty();
         $('.inputPwd').empty();
       
         let data = $(this).attr('data-target');
         let index = data[data.length-1]
         console.log(index)
        /* alert(${loginVO.password}); */
        let input = document.getElementsByClassName('inputPwd')[index].value;
        console.log(input)
        /* alert(input); */
        if(input != ${loginVO.password}){
           /* alert('다름'); */
           let msg = '비밀번호가 일치하지 않습니다.';
           $('.check').empty();
           console.log('error')
           document.getElementsByClassName("check").item(index).append(msg);
           return false;
           
        } else {
           return true;
        }
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
            <h1 class="mb-3 bread">나의 관심종목 조회 및 매수</h1>
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
           <th align="center" style="width: 10%">관심종목 삭제</th>
           <th align="center" style="width: 10%">매수하기</th>
           <th align="center" style="width: 10%">찜한 날짜</th>
         </tr>
       </thead>
       <tbody id="myTable">
       <c:forEach items="${ basketList }" var="stock" varStatus="loop">
         <tr id = "${ stock.code }tr">
           <td align="center">${ stock.name }</td>
           <td align="center">₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ stock.price }" /></td>
           <td align="center">
           <input type ="button" class="delBasket btn btn-success" id="${ stock.code }-${ stock.id }" value="관심종목에서 삭제">
           </td>
           <%-- <input type ="button" class="buyBtn btn btn-success" id="${ stock.code }-${ stock.id }-${stock.name}" value="매수"> --%>
           <td align="center"><input type="button" class="buy btn btn-success" id="${ stock.code }" name="${ loop.index }"  data-toggle="modal" data-target="#myModal${ stock.name }${ loop.index }" value="매수"></td>
          <%--  <td align="center"><input type="button" class="buy btn btn-success" id="${ stock.code }"  data-toggle="modal" data-target="#myModal${ stock.code }" value="매수"></td> --%>
           <td align="center">${ stock.reg_date }</td>
         </tr>
         
         
         <!-- 비밀번호 확인 모달 -->
         <!-- Modal -->
  <div class="modal fade" id="myModal${ stock.name }${ loop.index }" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" align="center">
          <p>증권계좌 비밀번호를 입력해주세요.</p>
          <input type="password" class ="inputPwd">
          <div class="check" style="color: red">
          
          </div>
        </div>
        <div class="modal-footer" align="center">
         <input type="button" class="pwChk btn btn-success" id="${ stock.code }"  data-toggle="modal" data-target="#myModal${ stock.code }${ loop.index }" value="확인">
        </div>
      </div>
    </div>
  </div>
         
         
         
         <!-- 매수모달 -->
                     <!-- Modal -->
  <div class="modal fade" id="myModal${ stock.code }${ loop.index }" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title">${ stock.name } 매수</h3><h4 align="right"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
        <form action="${ pageContext.request.contextPath }/buy" method="post" name="sform">
        <div align="center">
        <img src="https://ssl.pstatic.net/imgfinance/chart/item/area/day/${ stock.code }.png">
        </div>
        <input type="hidden" name="code" value="${ stock.code }">
        <div align="center">
        <br>
        <hr>
           <p style="background-color: #008c8c; color: #ffffff">고객정보</p>
        </div>
          <div class="row">
          <div class="col">
          <label for="recipient-name" class="col-form-label">Id</label>
            <input type="text" value="${ loginVO.id }" name="id" readonly class="form-control-plaintext">
          </div>
          <div class="col">
            <label for="recipient-name" class="col-form-label">증권계좌</label>
            <input type="text" value="${ loginVO.account_num }" name="account_num" readonly class="form-control-plaintext">
          </div>
          
          <div class="col">
          <label for="message-text" class="col-form-label">순자산액</label><br>
            ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${ saccbalance }" />
          </div>
          
          </div>
      <div align="center">
          <hr>
             <p style="background-color: #008c8c; color: #ffffff">매수정보</p>
      </div>
          <div class="row">
          <div class="col">
           <label for="recipient-name" class="col-form-label">종목명</label>
            <input type="text" value="${ stock.name }" name="name" readonly class="form-control-plaintext">
          </div>
          <div class="col">
          <label for="recipient-name" class="col-form-label">현재가</label><br>
            ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${ stock.price }" />
          </div>
          </div>
           
          <hr>

          <div class="row">
          <div class="col">
          <label for="recipient-name" class="col-form-label">지정가 구매</label>
          <div class="input-group">
            <input type="text" class="count form-control" id="${ stock.price }" placeholder="구매할 수량을 입력하세요." name="count" required="required" aria-label="Amount (to the nearest dollar)">
            <span class="input-group-addon">(주)</span>
            </div>
            <input type="button" value="가능 100%" class="maxBtn btn btn-success" name="${ saccbalance }-${ stock.price }-max">
            <input type="button" value="가능 50%" class="midBtn btn btn-success" name="${ saccbalance }-${ stock.price }-mid">
            <input type="button" value="가능 25%" class="minBtn btn btn-success" name="${ saccbalance }-${ stock.price }-min">
          </div>
          <div class="col">
           <label for="message-text" class="col-form-label">가격</label>
            <input type="text" class="form-control" class = "realprice" name="price" required="required" width="50%">
          </div>
        </div>
        <br>
        <div align="center">
        <hr>
          <input type="submit" class="btn btn-success" value="매수">
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