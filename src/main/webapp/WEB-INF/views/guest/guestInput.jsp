<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestInput.jsp</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <form name="myForm" method="post" class="was-validated">
  	<h2>Guestbook Write</h2>
    <div class="form-group">
      <label for="name">name</label>
      <input type="text" class="form-control" id="name" value="${vo.getName()}" name="name"/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="email">E-mail</label>
      <input type="text" class="form-control" id="email" placeholder="Enter E-mail" name="email"/>
    </div>
    <div class="form-group">
      <label for="homepage">Homepage</label>
      <input type="text" class="form-control" id="homepage" value="http://" name="homepage"/>
    </div>
    <div class="form-group">
      <label for="content">Content</label>
      <textarea rows="5" class="form-control" id="content" name="content" required></textarea>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
    	<button type="submit" class="btn btn-secondary">Submit</button>
    	<button type="reset" class="btn btn-secondary">Reset</button>
    	<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/guest/guestList';">Back</button>
    </div>
    <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>