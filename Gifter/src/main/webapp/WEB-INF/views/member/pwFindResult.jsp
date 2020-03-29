<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>
	<c:choose>
		<c:when test="${msg3 == 'fail'}">
			아이디 또는 이메일이 맞지 않습니다.
			<a href="<c:url value="/"/>"><input type="button" value="메인 페이지로 이동"></a>		
		</c:when>
		<c:otherwise>
			이메일로 임시 비밀번호를 보내드렸습니다. <br/>
			확인 후 로그인 해 주세요.			<br/>
			<a href="<c:url value="/member/loginForm"/>"><input type="button" value="로그인 페이지로 이동"></a>
		</c:otherwise>
	</c:choose>
</body>
</html>