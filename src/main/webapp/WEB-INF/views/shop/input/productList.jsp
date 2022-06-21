<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>productList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<div class="container">
  <h2 class="text-center">전체 상품 리스트</h2>
  <br/>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>대분류</th>
      <th>중분류</th>
      <th>소분류</th>
      <th>상품</th>
      <th>가격</th>
      <th>제목</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
    	<tr>
    	  <td>${vo.product1}</td>
    	  <td>${vo.product2}</td>
    	  <td>${vo.product3}</td>
    	  <td>${vo.product}</td>
    	  <td>${vo.price}</td>
    	  <td>${vo.title}</td>
    	</tr>
    </c:forEach>
    <tr><td colspan="6" class="p-0"></td></tr>
  </table>
  <p class="text-center"><input type="button" value="돌아가기" onclick="location.href='${ctp}/shop/input/productMenu';" class="btn btn-info"/></p>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>