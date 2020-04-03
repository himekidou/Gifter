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
	 	<div class="container">
			<ul class="nav justify-content-end">
    			<li class="nav-item">
      				<a class="nav-link" href="<c:url value="/"/>">Home</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link" href="/member/signupForm">Sign Up</a>
    			</li>
    			<li class="nav-item">
     				 <a class="nav-link" href="/member/loginForm">Login</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link " href="/category/bestForm">Best</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link " href="/category/viewCategory">viewCategory</a>
    			</li>
  			</ul>	
		</div>	
		<br/>	
	 	<br/>	 						
	 	 
	<div id="setting" class="text-center">
		<h3>안녕하세요, ${param.member_id} 님</h3>
		<br/>
		<p>회원가입이 정상적으로 이루어 졌습니다</p>
		<br>
		<p>로그인 하시면</p>
		<p>모든 서비스를 이용하실 수 있습니다</p>
		<br> <a href="/member/loginForm" class="btn btn-outline-info">로그인</a>
	</div>
</body>
</html>