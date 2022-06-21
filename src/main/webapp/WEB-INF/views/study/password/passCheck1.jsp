<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>passCheck1.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript">
		'use strict';
		function fCheck(flag) {
			let pwd = document.getElementById("pwd").value;
			if(pwd.trim() == "" || pwd.length > 10) {
				alert("비밀번호를 확인하세요.");
				document.getElementById("pwd").focus();
			} else {
				if(flag == 1) myForm.action = "${ctp}/study/password/passCheck1"; 
				else myForm.action = "${ctp}/study/password/passCheck2";
				myForm.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br></p>
<div class="container">
	<form name="myForm" method="post">
		<h2>비밀번호 암호화 연습</h2>
		<p>10자 이하로 입력</p>
		<hr>
		<p>비밀번호 : 
			<input type="password" name="pwd" id="pwd" autofocus /> &nbsp;
			<input type="button" value="암호화(숫자)" onclick="fCheck(1)" class="btn btn-secondary" /> &nbsp;
			<input type="button" value="암호화(혼합)" onclick="fCheck(2)" class="btn btn-secondary" />
		</p>
		<hr>
		<p>
			-결과-  <br>
			원본 : ${pwd}<br>
			암호화 : ${encPwd}<br>
			복호화 : ${decPwd}
		</p>
	</form>
</div>
<p><br></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>