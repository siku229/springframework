<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>productMenu.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <form name="myForm" class="text-center">
    <h2>MENU</h2>
    <hr/>
    <p>
      <input type="button" value="상품등록" onclick="location.href='${ctp}/shop/input/productInput';" class="btn btn-secondary"/> &nbsp; &nbsp;
      <input type="button" value="상품리스트" onclick="location.href='${ctp}/shop/input/productList';" class="btn btn-secondary"/>
    </p>
    <hr/>
    <p id="demo"></p>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>