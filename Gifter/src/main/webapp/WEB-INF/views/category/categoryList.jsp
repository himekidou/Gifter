<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 리스트</title>


</head>
<body>
	<h1>
	순위(1~10위) 
	</h1>
	<form>
		<table border="1">
			<tr>
				<th>카테고리 이름</th>
				<th>총 횟수</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
			<c:forEach  var="item" items="${list}">
				<tr>
					<td>${item.cat_name}</td>
					<td>${item.cat_incre}</td>	
					<td>${item.info_age}</td>
					<td>
					<c:if test="${item.info_gender == 0}">
						남자
					</c:if>
					<c:if test="${item.info_gender == 1}">
						여자
					</c:if>	
					</td>
				</tr>		
			</c:forEach>
		</table>
	</form>
	<br/>
	<a href="<c:url value="/"/>"><input type="button" value="메인 페이지로 이동"></a></body>
</html>