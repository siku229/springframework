<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestList</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
  <script type="text/javascript">
  	'use strict';
  	function delCheck(idx) {
			let ans = confirm("게시글을 삭제하시겠습니까?");
			if(ans) location.href="${ctp}/guestDelete.gu?idx=" + idx;
		}
  </script>
  <style type="text/css">
  	th {background-color: #ccc; text-align:center}
  </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%@ include file="/WEB-INF/views/include/slide2.jsp" %>
<p><br/></p>
<div class="container">
  <h2>Guestbook</h2>
  <div class="text-right mb-2 row">
  <div class="col text-right"><a href="guestInput" class="btn btn-secondary">Write</a></div>
  </div>
  <div>
	<c:forEach var="vo" items="${vos}" varStatus="st">
  	  <table class="table table-borderless m-0 p-0">
	  <tr>
  		<td>
  		No. ${curScrStartNo}
  		</td>
  		<td class="text-right">IP : ${vo.hostIp}</td>
	  </tr>
	  </table>
	  <table class="table table-bordered">
	  	<tr>
	  		<th width="20%">성명</th>
	  		<td width="30%">${vo.name}</td>
	  		<th width="20%">방문일자</th>
	  		<td width="30%">${vo.VDate}</td>
	  	</tr>
	  	<tr>
	  		<th>E-mail</th>
	  		<td colspan="3">
	  			<c:if test="${empty vo.email}">null</c:if>
	  			<c:if test="${!empty vo.email}">${vo.email}</c:if>
	  		</td>
	  	</tr>
	  	<tr>
	  		<th>Homepage</th>
	  		<td colspan="3">
	  			<c:set var="hplen" value="${fn:length(vo.homepage)}" />
	  			<c:if test="${empty vo.homepage || hplen <= 7}">null</c:if>
	  			<c:if test="${!empty vo.homepage && hplen > 7}"><a href="${vo.homepage}" target="_blank">${vo.homepage}</a></c:if>
	  		</td>
	  	</tr>
	  	<tr>
	  		<th>Content</th>
	  		<td colspan="3" style="height:200px">${fn:replace(vo.content, newLine, '<br/>')}</td>
	  	</tr>
	  </table>
	  <br>
	  <c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
	</c:forEach>
  </div>
</div>
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
	<ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}">
	  	<li class="page-item"><a href="guestList?pag=1" class="page-link text-secondary">첫페이지</a></li>
	  </c:if>
	  <c:if test="${curBlock > 0}">
	  	<li class="page-item"><a href="guestList?pag=${(curBlock-1)*blockSize + 1}" class="page-link text-secondary">이전블록</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
	    <c:if test="${i <= totPage && i == pag}">
	      <li class="page-item active"><a href="guestList?pag=${i}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= totPage && i != pag}">
	      <li class="page-item"><a href='guestList?pag=${i}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}">
	    <li class="page-item"><a href="guestList?pag=${(curBlock+1)*blockSize + 1}" class="page-link text-secondary">다음블록</a></li>
	  </c:if>
	  <c:if test="${pag != totPage}">
	  	<li class="page-item"><a href="guestList?pag=${totPage}" class="page-link text-secondary">마지막페이지</a></li>
	  </c:if>
	</ul>
</div>
<!-- 블록 페이징 처리 끝 -->
<p><br/></p>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>