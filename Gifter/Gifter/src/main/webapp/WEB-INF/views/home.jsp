<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
	<h1>선물 추천 시스템 GIFTER</h1>
	 <c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		환영합니다. ${sessionScope.member_id}님 <br/>
	 		<a href="member/logout">로그아웃</a><br/>
	 	</c:when>
	 	<c:otherwise>
	 		<a href="member/signupForm">회원가입</a><br/>
			<a href="member/loginForm">로그인</a><br/>
	 	</c:otherwise>
	 </c:choose>
</body>
</html>
