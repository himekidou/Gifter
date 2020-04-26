<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>이메일 인증 필요</title>
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
  		background: #4B89DC;
	}
	.box6 {
  		background: #fb5b17;
	}
	.box7 {
  		background: #0d7373;
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
  		grid-template-rows: 70% 20% 10%;			
  		height: 100%; 
  		width: 100%; 			
	}
	html{
		height: 100%;
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
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="font-size: 1.0416666666666667vw;">Home</a>
    				</li>
    				<li class="nav-item">
     					<a class="nav-link text-body" href="/member/loginForm" style="padding-right: 0; font-size: 1.0416666666666667vw;">Login</a>
    				</li>
  				</ul>		
			</div>
			
			<br/>
			<div id="setting" class="text-center" style="width: 350px; height: 220px; background-color: white; margin: 80px;  border-radius: 10px;">
				<h2 style="color: black;">회원가입 됐습니다</h2>
				<br/>
				<h3 style="color: black;">이메일 인증을 하면</h3> 
				<h3 style="color: black;">로그인이 가능합니다</h3><br/>
				<a href="<c:url value='/'/>"><input type="button" class="btn btn-dark" value="메인 페이지 이동"></a>
			</div>
						
       </div>	
       <div class="box3">
       		<br/>
       		<div class="container">
				<ul class="nav justify-content-start">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style="padding-left: 0; font-size: 1.0416666666666667vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="font-size: 1.0416666666666667vw;">viewCategory</a>
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
    	  
    	<div class="box6">
        
      	</div>
      	<div class="box7">
	</div>
</body>
</html>