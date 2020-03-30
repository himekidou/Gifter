<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
	로그인에 실패 했습니다. <br/>
	다시 로그인 해 주세요. <br/>
	<a href="<c:url value='/member/loginForm'/>"><input type="button" value="로그인 하기"></a>
	<a href="<c:url value='/'/>"><input type="button" value="취소"></a>
	<br/>
</body>
</html>