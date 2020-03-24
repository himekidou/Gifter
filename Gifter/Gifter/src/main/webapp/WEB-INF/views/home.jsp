<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script type="text/javascript">
	function formCheck(){
		var taker_insta = document.getElementById("taker_insta");
		if(taker_insta.value == '' || taker_insta.value.length == 0){
			alert("인스타그램 ID를 입력해주세요");
			return false;
		}		
		return true;
	}
</script>
</head>
<body>
	<h1>선물 추천 시스템 GIFTER</h1>
	 <c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		환영합니다. ${sessionScope.member_id}님 
	 		<br/>
	 		<p>선물할 인스타그램 ID를 입력해 주세요.</p>	 		
	 		<form action="taker/search" method="get" onsubmit="return formCheck();">
	 			<input type="text" id="taker_insta" name="taker_insta" placeholder="인스타그램 ID 입력">
	 			<input type="submit" id="btn1" value="검색">	
	 		</form>	
	 		<a href="category/bestForm">best</a><br/>
	 		<a href="member/logout">logout</a><br/>
	 	</c:when>
	 	<c:otherwise>
	 		<p>선물할 인스타그램 ID를 입력해 주세요.</p>	 		
	 		<form action="taker/search" method="get" onsubmit="return formCheck();">
	 			<input type="text" id="taker_insta" name="taker_insta" placeholder="인스타그램 ID 입력">
	 			<input type="submit" id="btn1" value="검색">	
	 		</form>	
	 		<br/>	 			
 			<a href="member/signupForm">sign up</a><br/>
			<a href="member/loginForm">login</a><br/>
			<a href="category/bestForm">best</a><br/>
	 	</c:otherwise>
	 </c:choose>
</body>
</html>
