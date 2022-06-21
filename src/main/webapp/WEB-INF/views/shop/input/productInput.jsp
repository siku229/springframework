<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>productInput.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  	'use strict';
    $(function() {
    	$("#product1").change(function() {
	    	let product1 = $(this).val();
    		if(product1 == "") {
    			alert("대분류를 선택하세요");
    			return false;
    		}
    		
    		$.ajax({
    			type : "post",
    			url  : "${ctp}/shop/input/productInput",
    			data : {product1 : product1},
    			success:function(res) {
    				let str = '';
    				str += '<option value="">중분류</option>';
    				for(let i=0; i<res.product2.length; i++) {
    					str += '<option>'+res.product2[i]+'</option>';
    				}
    				$("#product2").html(str);
    			},
    			error : function() {
    				alert("전송오류!");
    			}
    		});
    	});
    });
    
    $(function() {
    	$("#product2").change(function() {
	    	let product2 = $(this).val();
    		if(product2 == "") {
    			alert("중분류를 선택하세요");
    			return false;
    		}
    		
    		$.ajax({
    			type : "post",
    			url  : "${ctp}/shop/input/productInput2",
    			data : {product2 : product2},
    			success:function(res) {
    				let str = '';
    				str += '<option value="">소분류</option>';
    				for(let i=0; i<res.product3.length; i++) {
    					str += '<option>'+res.product3[i]+'</option>';
    				}
    				$("#product3").html(str);
    			},
    			error : function() {
    				alert("전송오류!");
    			}
    		});
    	});
    });
    
    function fCheck() {
    	let product1 = $("#product1").val();
    	let product2 = $("#product2").val();
    	let product3 = $("#product3").val();
    	let product = document.myForm.product.value;
    	let price = document.myForm.price.value;
    	let title = document.myForm.title.value;
    	
    	if(product1 == "" || product2 == "" || product3 =="" || product =="" || price=="" || title=="") {
    		alert("선택하세요");
    		return false;
    	}
    	myForm.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<div class="container">
  <hr/>
  <h3>등록하실 상품을 선택하세요</h3>
  <form name="myForm" action="${ctp}/shop/input/productInputOk" method="post">
    <select name="product1" id="product1">
      <option value="">대분류</option>
      <option value="전자제품">전자제품</option>
      <option value="신발류">신발류</option>
      <option value="의류">의류</option>
    </select>
    <select name="product2" id="product2">
      <option value="">중분류</option>
    </select>
    <select name="product3" id="product3">
      <option value="">소분류</option>
    </select>
    <hr/>
    <p>상품명
    	<input type="text" name="product" required autofocus/>
    </p>
    <p>가격 &nbsp;
    	<input type="text" name="price" required/>
    </p>
    <p>제목 &nbsp;
    	<input type="text" name="title" required/>
    </p>
    <input type="button" value="등록하기" onclick="fCheck()"/> &nbsp;&nbsp;
    <input type="button" value="돌아가기" onclick="location.href='${ctp}/shop/input/productMenu';"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>