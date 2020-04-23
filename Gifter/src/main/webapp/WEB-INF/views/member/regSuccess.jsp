<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>이메일 인증 성공</title>	
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style type="text/css">
	
	.box1 {
  		background: #fb5b17;
  		grid-row : 1/3;
	}
	.box2 {
  		background: #cccccc;
	}
	.box3 {
  		background: #4B89DC;
	}
	.box4 {
  		background: #0d7373;
	}
	.box5 {
  		background: #eee6c4;
	}
	* {
  		color: white;
  		font-weight: bold;
  		margin: 0;
  		padding: 0;
	}
	.main {
  		display: grid;
  		grid-template-columns: 1fr 1fr 1fr;
  		grid-template-rows: 70% 30%;			
  		height: 100%; 
  		width: 100%; 			
	}
	
</style>

</head>
<body> 
	<div class="main">
    	<div class="box1">
        	
      	</div>
      	
      	<div class="box2">  
      		<br/>  
        	<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>">Home</a>
    				</li>
    				<li class="nav-item">
     					<a class="nav-link text-body" href="/member/loginForm" style="padding-right: 0;">Login</a>
    				</li>
  				</ul>		
			</div>
			
			<div id="setting" class="text-center" 	style="width: 350px; height: 290px; background-color: white; margin: 80px;  border-radius: 10px;">
				<h3 style="color: black;">안녕하세요, ${param.member_id} 님</h3>
				<br/>
				<p style="color: black;">회원가입이 정상적으로 이루어 졌습니다</p>
				<br/>
				<p style="color: black;">로그인 하시면</p>
				<p style="color: black;">모든 서비스를 이용하실 수 있습니다</p>
				<br> <a href="/member/loginForm" class="btn btn-dark">로그인</a>
			</div>					
       </div>	
       <div class="box3">
       		<br/>
       		<div class="container">
				<ul class="nav justify-content-start">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style="padding-left: 0;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.0416666666666667vw;">About</a>
    				</li>
  				</ul>	
			</div>
			
			
      	</div>
      	<div class="box4">
        	
      	</div>
      	<div class="box5">
        	
    	</div>   
	</div>
</body>
</html>