<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>recommendList</title>
<!-- <style type="text/css">
	table {
		width: 100%;
		border-top: 1px solid #444444;
		border-collapse: collapse;
	}

	th, td {
		border-bottom: 1px solid #444444;
		padding: 10px;
	}
</style> -->

<!-- <style type="text/css">
	.table {
		margin-left: auto;
		margin-right: auto;
	}
</style> -->

</head>
<body>
<h2 class="text-center">오늘의 추천!</h2>

<!-- <div class="row">
    <div class="col-sm-6">전체 컨테이너의 절반 크기로 띄우게 됨 -->
<table class="table table-sm" width=100 style="table-layout: fixed">
	<tr>
		<td width="180px" >
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc1}"/>" width="140" height="140">
		</td>
		<td class="align-middle">
			${recomTit1} <br>
			${recompri1}
		</td>
	</tr>
	<tr>
		<td width="180px" >
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc2}"/>" width="140" height="140">
		</td>
		<td class="align-middle">
			${recomTit2} <br>
			${recompri2}
		</td>
	</tr>
	<tr>
		<td width="180px" >
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc3}"/>" width="140" height="140">
		</td>
		<td class="align-middle">
			${recomTit3} <br>
			${recompri3}
		</td>
	</tr>
</table>
<!-- </div>
</div> -->

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>