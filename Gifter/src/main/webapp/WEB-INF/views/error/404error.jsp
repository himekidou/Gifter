<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style>
	#setting{
		width:300px;
		height:30px;
		position:absolute;
		left:50%;
		top:50%;
		margin:-100px 0 0 -150px;  
	}
</style>
</head>
<body>
	<div id="setting" class="text-center">
		<h5>페이지가 존재하지 않습니다</h5> <br/>
		<a href="<c:url value="/"/>"><input type="button" class="btn btn-outline-info" value="메인 페이지로 이동"></a>
	</div>
</body>
</html>