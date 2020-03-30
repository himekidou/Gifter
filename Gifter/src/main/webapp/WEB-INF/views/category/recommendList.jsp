<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		width: 100%;
		border-top: 1px solid #444444;
		border-collapse: collapse;
	}

	th, td {
		border-bottom: 1px solid #444444;
		padding: 10px;
	}
</style>
</head>
<body>
<h2>오늘의 추천!</h2>

<table>
	<tr>
		<td>
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc1}"/>" width="140" height="140">
		</td>
		<td>
			${recomTit1} <br>
			${recompri1}
		</td>
	</tr>
	<tr>
		<td>
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc2}"/>" width="140" height="140">
		</td>
		<td>
			${recomTit2} <br>
			${recompri2}
		</td>
	</tr>
	<tr>
		<td>
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc3}"/>" width="140" height="140">
		</td>
		<td>
			${recomTit3} <br>
			${recompri3}
		</td>
	</tr>
</table>

</body>
</html>