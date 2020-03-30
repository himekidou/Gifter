<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정 결과</title>
</head>
<body>	
	<c:choose>
		<c:when test="${msg4 == 'success'}">
			${member_id}님의 비밀번호가 수정 되었습니다. <br/>
			<a href="<c:url value="/"/>"><input type="button" value="메인 이동"></a>
		</c:when>
		<c:otherwise>
			비밀번호 수정에 실패했습니다. 다시 해주세요. <br/>
			<a href="<c:url value="/member/mypage"/>"><input type="button" value="마이 페이지 이동"></a>
		</c:otherwise>
	</c:choose>

	
</body>
</html>