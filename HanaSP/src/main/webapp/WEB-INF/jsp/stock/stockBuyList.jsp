<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주식체결목록</title>
<style type="text/css">
   .color {
    color: #008c8c;
   }
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
      
// id속성 지정 
   $(document).ready(function(){
      $(".sell").click(function(){
         let code = $(this).attr('id');
        /*  $('#'+code).toggle(); */
      })  
   })
      
      // 수량*현재가
   $(document).ready(function(){
      $('.count').keyup(function(){
        /*  alert('k'); */
        let data = $(this).attr('data-target');
        let index = data[data.length-1]
        // elements[0] : 현재가, elements[1] : 최대 가능 매도 수량
        let elements = $(this).attr('id').split('-');
        /* alert(elements[0] +" : " + elements [1]); */
        console.log("data : " + data);
        console.log("index : " + index);
        // count클래스의 값 keyup형태로 가져오기 // class도 name과 동일하게 중복을 허용하여 javascript를 이용하여 사용시엔 배열 인덱스를 필수로 넣어줘야함
        let c = document.getElementsByClassName("count")[index].value
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
        let sprice = Math.round((p[0]*c)-(p[0]*c*0.005));
        let fprice = (p[0]*c);
        /* alert(p[0]*c*0.5); */
         /* console.log(sprice) */
         document.getElementsByClassName("realprice")[index].value = fprice;
         document.getElementsByClassName("realrealprice")[index].value = sprice;
         console.log("sprice : " + sprice);
         console.log("fprice : " + fprice);
        }
      })
   })
   
    // 매도 전 비밀번호 확인
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
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<span class="subheading">주식 체결 목록</span>
					<h5 class="mb-3">
						<img src="resources/images/stockGo.png" width="70px"> ${ loginVO.name }
						회원님의 주식 체결 목록
					</h5>
				</div>
			</div>

			<div class="container">
				<div class="form-group">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab"
								data-toggle="tab" href="#nav-home" role="tab"
								aria-controls="nav-home" aria-selected="true">매수</a> <a
								class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
								href="#nav-profile" role="tab" aria-controls="nav-profile"
								aria-selected="false">매도</a>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">


							<h4>총 매수금 : <fmt:formatNumber type="number"
														maxFractionDigits="3" value="${ totalBuy }" /></td></h4>
							<table class="table table-striped">
								<thead align="center">
									<tr>
										<th>종목명</th>
										<th>주문수량</th>
										<th>매수단가</th>
										<th>평가손익</th>
										<th>수익률</th>
										<th>현재가</th>
										<th>매입금액</th>
										<th>평가금액</th>
										<th>매수날짜</th>
										<th>매도</th>
									</tr>
								</thead>
								<c:forEach items="${ buyList }" var="buy" varStatus="loop">
									<c:if test="${ buy.count  ne 0 }">
										<tbody align="center">
											<tr>
												<td>${ buy.name }</td>
												<td>${ buy.count }</td>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${ buy.atprice }" /></td>
												<td><c:choose>
														<c:when test="${ (buy.nowPrice - buy.atprice) * buy.count > 0}">
															<p style="color: red">
																<fmt:formatNumber type="number" maxFractionDigits="3"
																	value="${ (buy.nowPrice - buy.atprice) * buy.count }" />
															</p>
														</c:when>
														<c:when test="${ (buy.nowPrice - buy.atprice) * buy.count < buy.price}">
															<p style="color: blue">
																<fmt:formatNumber type="number" maxFractionDigits="3"
																	value="${ (buy.nowPrice - buy.atprice) * buy.count }" />
															</p>
														</c:when>
														<c:when test="${ (buy.nowPrice - buy.atprice) * buy.count eq 0}">
															<p style="color: black">
																<fmt:formatNumber type="number" maxFractionDigits="3"
																	value="${ (buy.nowPrice - buy.atprice) * buy.count }" />
															</p>
														</c:when>
													</c:choose></td>
												<td><c:choose>
														<c:when
															test="${ (buy.nowPrice - buy.atprice) * buy.count / 1000 > 0 }">
															<p style="color: red">
																▲
																<fmt:formatNumber
																	value="${ (buy.nowPrice - buy.atprice) * buy.count / 1000 }"
																	pattern=".00" />
																%
															</p>
														</c:when>
														<c:when
															test="${ (buy.nowPrice - buy.atprice) * buy.count / 1000 < 0 }">
															<p style="color: blue">
																▼
																<fmt:formatNumber
																	value="${ (buy.nowPrice - buy.atprice) * buy.count / 1000 }"
																	pattern=".00" />
																%
															</p>
														</c:when>
														<c:otherwise>
															<p>
																	0%
															</p>
														</c:otherwise>
													</c:choose></td>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${ buy.nowPrice }" /></td>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${ buy.price }" /></td>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3"
														value="${ buy.nowPrice * buy.count }" /></td>
												<td>${ buy.reg_date }</td>
												<td><input type="button" class="sell btn btn-success"
													id="${ buy.code }" name="${ loop.index }"
													data-toggle="modal"
													data-target="#myModal${ buy.name }${ loop.index }"
													value="매도"></td>
											</tr>
										</tbody>
									</c:if>
								</c:forEach>
							</table>



						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">

							<h4>실현손익 : <fmt:formatNumber type="number"
														maxFractionDigits="3" value="${ howmuch }" /></h4>
							<table class="table table-striped">
								<thead align="center">
									<tr>
										<th>주문No</th>
										<th>종목명</th>
										<th>보유수량</th>
										<th>체결수량</th>
										<th>미체결량</th>
										<th>체결가격</th>
										<th>매도날짜</th>
									</tr>
								</thead>
								<c:forEach items="${ sellList }" var="sell" varStatus="loop">
									<tbody align="center">
										<tr>
											<td>${ sell.rownum }</td>
											<td>${ sell.name }</td>
											<td>${ sell.sell_count + sell.buy_count }</td>
											<td>${ sell.sell_count }</td>
											<td>${ sell.buy_count }</td>
											<td><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${ sell.price }" /></td>
											<td>${ sell.reg_date }</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>

						</div>
					</div>
				</div>

			</div>
		</div>




		<%--  <div class="row d-flex">
        
        <c:forEach items="${ buyList }" var="buy" varStatus="loop">
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
              <span class="fa fa-quote-left"></span>
	              <div class="testimony-wrap meta mb-3">
                  <h3 style="color: #c0c0c0">${ buy.rownum }</h3>
                            <h6 style="color: #525252"> 종목 코드 : ${ buy.code } </h6>	
                            <h5> 종목명 : ${ buy.name }</h5>
                            <h5> 매입가 : ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ buy.price / buy.count }" /></h5>
                </div>
	              <h3 class="heading">
	              <input type="button" class="sell btn btn-success" id="${ buy.name }"  data-toggle="modal" data-target="#myModal2${ buy.name }" value="수익률 보기">
	              <input type="button" class="sell btn btn-success" id="${ buy.code }"  data-toggle="modal" data-target="#myModal${ buy.name }" value="매도">
	              </h3>
              </div>
            </div>
          </div>
          </c:forEach>
          </div>
          </div>
          </section>
      
      
    <section class="ftco-section">
        
        <c:forEach items="${ buyList }" var="buy" varStatus="loop"> --%>
        <!-- 비밀번호 확인 모달 -->
         <!-- Modal -->
<%--   <div class="modal fade" id="myModal2${ buy.name }" role="dialog">
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
         <input type="button" class="sell btn btn-success" id="${ stock.code }"  data-toggle="modal" data-target="#myModal2${ buy.code }" value="확인">
        </div>
      </div>
      
    </div>
  </div> --%>
         
         
         
         <!-- 수익률모달 -->
                     <!-- Modal -->
 <%--  <div class="modal fade" id="myModal2${ buy.name }" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title">${ buy.name } 매도</h3><h4 align="right"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">

                     <c:choose>
                        <c:when test="${ buy.nowPrice * buy.count > buy.price}">
                           <h5 style="color: red">
                              평가손익 : ▲
                              <fmt:formatNumber type="number" maxFractionDigits="3"
                                 value="${ buy.nowPrice * buy.count - buy.price }" />
                           </h5>
                        </c:when>
                        <c:when test="${ buy.nowPrice * buy.count < buy.price}">
                           <h5 style="color: blue">
                              평가손익 : ▼
                              <fmt:formatNumber type="number" maxFractionDigits="3"
                                 value="${ buy.nowPrice * buy.count - buy.price }" />
                           </h5>
                        </c:when>
                        <c:otherwise>
                           <h5>
                              평가손익 : ₩
                              <fmt:formatNumber type="number" maxFractionDigits="3"
                                 value="${ buy.nowPrice * buy.count - buy.price }" />
                           </h5>
                        </c:otherwise>
                     </c:choose>
                     <c:choose>
                        <c:when test="${ buy.nowPrice * buy.count / buy.price > 1 }">
                           <h5 style="color: red">
                              수익률 : ▲
                              <fmt:formatNumber
                                 value="${ buy.nowPrice * buy.count / buy.price }"
                                 pattern=".000" />
                              %
                           </h5>
                        </c:when>
                        <c:when test="${ buy.nowPrice * buy.count / buy.price < 1 }">
                           <h5 style="color: blue">
                              수익률 : ▼
                              <fmt:formatNumber
                                 value="${ buy.nowPrice * buy.count / buy.price }"
                                 pattern="0.000" />
                              %
                           </h5>
                        </c:when>
                        <c:otherwise>
                           <h5>
                              수익률 :
                              <fmt:formatNumber
                                 value="${ buy.nowPrice * buy.count / buy.price }"
                                 pattern=".000" />
                              %
                           </h5>
                        </c:otherwise>
                     </c:choose>
                     <h5>보유수량 : ${ buy.count }</h5>
                     <h5>현재가 : ${ buy.nowPrice }</h5>
                     <h5>매입금액 : ${ buy.price }</h5>
                     <h5>평가금액 : ${ buy.nowPrice * buy.count }</h5>
                     <c:choose>
                        <c:when test="${ nowPrice * buy.count < 500000 }">
                           <h5>수수료 : 0.5 %</h5>
                        </c:when>
                        <c:otherwise>
                           <h5>수수료 : 0.15 %</h5>
                        </c:otherwise>
                     </c:choose>
                     <h5>매수 날짜 : ${ buy.reg_date }</h5>

                  </div> --%>
<!-- 
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
<%--       </div>
    </div>
    </div>
        </c:forEach> --%>
        
        <c:forEach items="${ buyList }" var="buy" varStatus="loop">
        <!-- 비밀번호 확인 모달 -->
         <!-- Modal -->
  <div class="modal fade" id="myModal${ buy.name }${ loop.index }" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" align="center">
          <p>증권계좌 비밀번호를 입력해주세요.</p>
          <input type="password" class = "inputPwd">
          <div id="check" style="color: red">
          
          </div>
        </div>
        <div class="modal-footer" align="center">
         <input type="button" class="pwChk btn btn-success" id="${ stock.code }"  data-toggle="modal" data-target="#myModal${ buy.code }${ loop.index }" value="확인">
        </div>
      </div>
      
    </div>
  </div>
         
         
         
         <!-- 매도모달 -->
                     <!-- Modal -->
  <div class="modal fade" id="myModal${ buy.code }${ loop.index }" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title">${ buy.name } 매도</h3><h4 align="right"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
        <form action="${ pageContext.request.contextPath }/sell" method="post" name="sform">
        <input type="hidden" name="howmuch" value="${ (buy.nowPrice - buy.atprice) * buy.count }">
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
            <input type="text" value="${ loginVO.id }" name="id" readonly class="form-control-plaintext">
          </div>
          <div class="col">
            <label for="recipient-name" class="col-form-label">증권계좌</label>
            <input type="text" value="${ loginVO.account_num }" name="account_num" readonly class="form-control-plaintext">
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
            <input type="text" value="${ buy.name }" name="name" readonly class="form-control-plaintext">
          </div>
          <div class="col">
           <label for="recipient-name" class="col-form-label">최대 매도 가능 수량</label>
            <input type="text" value="${ buy.count }" readonly class="form-control-plaintext" class="maxBuy">
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
            <input type="text" class="count form-control" id="${ buy.nowPrice }-${ buy.count }" placeholder="매도할 수량을 입력하세요." name="sell_count" required="required" aria-label="Amount (to the nearest dollar)" data-target="#myModal${ stock.code }${ loop.index }">
            <span class="input-group-addon">(주)</span>
            </div>
            <%-- <input type="button" value="가능 100%" class="maxBtn btn btn-success" id="${ saccbalance }-${ stock.price }-max">
            <input type="button" value="가능 50%" class="midBtn btn btn-success" id="${ saccbalance }-${ stock.price }-mid">
            <input type="button" value="가능 25%" class="minBtn btn btn-success" id="${ saccbalance }-${ stock.price }-min"> --%>
          </div>
          <div class="col">
           <label for="message-text" class="col-form-label">평가금액</label>
            <input type="text" class="form-control realprice"required="required" width="50%" >
          </div>
          <div class="col">
           <label for="message-text" class="col-form-label">실제 산정액(수수료 제외)</label>
            <input type="text" class="form-control realrealprice" name="price" required="required" width="50%" >
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