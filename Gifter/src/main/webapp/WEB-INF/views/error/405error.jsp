<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	허용되지 않은 메소드로 요청했습니다. <br/>
	<a href="<c:url value="/"/>"><input type="button" value="메인 페이지로 이동"></a>
</body>
</html>