<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
<c:choose>
	<c:when test="${msg2 == 'fail'}">
		가입한 아이디가 존재하지 않습니다.<br/>
		<a href="<c:url value="/"/>"><input type="button" value="메인 페이지로 이동"></a>
	</c:when>
	<c:otherwise>
		가입한 아이디는 <br/>
		<c:forEach var="item" items="${msg2}">
			${item.member_id}<br/>
		</c:forEach>		
		입니다.<br/>
		<a href="<c:url value="/member/loginForm"/>"><input type="button" value="로그인 페이지로 이동"></a>
	</c:otherwise>
</c:choose>
</body>
</html>