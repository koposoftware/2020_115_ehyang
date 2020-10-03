<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<div class="container">
<table class="table table-bordered table-hover">
       <thead>
         <tr align="center">
           <th align="center">회차</th>
           <th align="center">거래명</th>
           <th align="center">거래금액</th>
           <th align="center">구분</th>
           <th align="center">거래일자</th>
         </tr>
       </thead>
       <tbody id="myTable">
       <c:forEach items="${ saList }" var="sa" varStatus="loop">
         <tr>
           <td align="center">${ sa.rownum }</td>
           <td align="center">${ sa.stockname }</td>
           <c:choose>
           	<c:when test="${'B' eq sa.type }">
           	<td align="center">- ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ sa.price }" /></td>
           		<td align="center" style="color: red">매수</td>
           	</c:when>
           	<c:when test="${'S' eq sa.type }">
           	<td align="center">+ ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ sa.price }" /></td>
          		 <td align="center" style="color: blue">매도</td>
          	</c:when>
           	<c:otherwise>
           	<td align="center">+ ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value ="${ sa.price }" /></td>
           	 	<td align="center">입금</td>
           	</c:otherwise>
           </c:choose>
           <td align="center">${ sa.reg_date }</td>
         </tr>
       </c:forEach>
       </tbody>
     </table>
</div>
</body>
</html>