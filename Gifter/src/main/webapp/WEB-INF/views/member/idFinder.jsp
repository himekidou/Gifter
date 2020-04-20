<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>아이디 찾기</title>	
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script>
	$(function(){
		$("#btn").click(function(){
			var member_email = $("#member_email").val();
			if(member_email == "" || member_email.length == 0){
				alert("가입한 이메일을 입력해주세요.");
				return false;
			}
			return true;					
		});
	});
</script>
<style type="text/css">
	
	.box1 {
  		background: #5e7e9b;
  		/* grid-row : 1/3; */
	}
	.box2 {
  		background: #e9e9e9;
	}
	.box3 {
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
  		grid-template-columns: 20% 40% 40%;
  		/* grid-template-rows: 60% 40%; */			
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
      					<a class="nav-link text-body" href="/member/signupForm" style="padding-right: 0;">Sign Up</a>
    				</li>
    				
  				</ul>	
			</div>	
			<br/>	
	 			 						
		
	
	<div id="setting" class="border border-dark  align-items-center" style="width:320px; height:280px; margin: 145px; background-color: white;  border-radius: 10px;">
	<div class="text-center" style="color: black;">
	<br/>
	<h3 style="color: black;">아이디 찾기</h3>
	가입할 때 입력한 이메일을 적어 주세요 <br/><br/>
	</div>
	<div class="d-flex justify-content-center align-items-center ">
	 <form action="idFind" method="post">
	 	<div class="form-group">
	 		<label for="email" style="color: black;">Email</label> 
	 		<input type="text" class="form-control" id="member_email" name="member_email" placeholder="abc@gmail.com">
	 	</div>
	 	<div class="form-group text-center">
	 		<input type="submit" id="btn" class="btn btn-primary" value="확인">
	 		&emsp;
	 		<a href="<c:url value='/'/>"><input type="button" class="btn btn-danger" value="취소"></a>
	 	</div>
	 </form>
	</div>
	</div>
      </div>
      <div class="box3">
         <br/>	
	 		<div class="container">
				<ul class="nav justify-content-start">
    				
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm" style="padding-left: 0;">Login</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory">viewCategory</a>
    				</li>
  				</ul>	
			</div>	
			<br/>	
	 		<br/>	
        
      </div>
    </div>
</body>
</html>