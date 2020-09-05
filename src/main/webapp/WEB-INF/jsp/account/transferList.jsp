<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<table class="table table-bordered table-hover">
       <thead>
         <tr align="center">
           <th align="center">회차</th>
           <th align="center">출금계좌번호</th>
           <th align="center">내용</th>
           <th align="center">금액</th>
           <th align="center">일시</th>
         </tr>
       </thead>
       <tbody id="myTable">
       <c:forEach items="${ transferList }" var="transfer" varStatus="loop">
         <tr>
           <td align="center">${ transfer.rownum }</td>
           <td align="center">${ transfer.fromAccount }</td>
           <td align="center">${ transfer.content }</td>
           <td align="center">${ transfer.money }</td>
           <td align="center">${ transfer.regDate }</td>
         </tr>
       </c:forEach>
       </tbody>
     </table>
</div>
</body>
</html>