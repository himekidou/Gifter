<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 실패</title>	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    					<a class="nav-link text-body" href="/member/signupForm" style="padding-right: 0; font-size: 1.0416666666666667vw;">Sign Up</a>
    				</li>
  				</ul>		
			</div>
			
			
						
       </div>	
       <div class="box3">
       		<br/><br/>
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
			
			<div id="setting" class="text-center" style="color: black; background-color: white; width: 250px; height: 150px; margin: 130px;  border-radius: 10px;">
				<h4 style="color: black;">로그인 실패  </h4>
				<h4 style="color: black;">다시 로그인 하세요</h4><br/>
				<a href="<c:url value='/member/loginForm'/>"><input type="button" class="btn btn-primary" value="로그인"></a>
				&emsp;
				<a href="<c:url value='/'/>"><input type="button" class="btn btn-danger" value="취소"></a>
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