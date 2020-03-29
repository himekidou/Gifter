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
<style type="text/css">
	
</style>
</head>
<body>
	<h1>GIFTER</h1>
	 <c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		환영합니다. ${sessionScope.member_id}님 <br/><br/>
	 		<a href="<c:url value="/"/>">home</a>
	 		&nbsp;
	 		<a href="member/logout">logout</a>
			&nbsp;
	 		<a href="category/bestForm">best</a>
			&nbsp;
	 		<br/> 
	 		<br/> 		
	 		<form action="taker/search" method="get" onsubmit="return formCheck();">
	 			<input type="text" id="taker_insta" name="taker_insta" placeholder="인스타그램 ID 입력">
	 			<input type="submit" id="btn1" value="검색">	
	 		</form>		 		
	 		<br/>
	 	</c:when>
	 	<c:otherwise>
	 		<a href="<c:url value="/"/>">home</a>
	 		&nbsp;
	 		<a href="member/signupForm">sign up</a>
			&nbsp;
			<a href="member/loginForm">login</a>
			&nbsp;
			<a href="category/bestForm">best</a>
			&nbsp;
			<a href="category/viewCategory">viewCategory</a>
			&nbsp;		
			<br/>
			<br/>
			<div id="instaSearch">
	 		<form action="taker/search" method="get" onsubmit="return formCheck();">
	 			<input type="text" id="taker_insta" name="taker_insta" placeholder="@U.N.J.O.O">
	 			<input type="image" id="btn1" src="${pageContext.request.contextPath}/resources/iconfinder_-_Magnifier-Search-Zoom-_3844432.png" width="18" height="18">
	 		</form>	
	 		</div>
	 		<br/>	 						
	 	</c:otherwise>
	 </c:choose>
</body>
</html>
