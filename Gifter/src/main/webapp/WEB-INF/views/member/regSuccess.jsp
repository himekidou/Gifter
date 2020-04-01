<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 성공</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style>
	#setting{
		width:300px;
		height:300px;
		position:absolute;
		left:50%;
		top:50%;
		margin:-100px 0 0 -150px;  
	}
</style>
</head>
<body>
	<div id="setting" class="text-center">
		<h3>안녕하세요, ${param.member_id} 님</h3>
		<br/>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>로그인 하시면</p>
		<p>모든 서비스를 이용하실 수 있습니다.</p>
		<br> <a href="/member/loginForm">로그인 페이지로 이동하기</a>
	</div>
</body>
</html>