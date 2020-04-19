<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>회원가입</title>	
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script type="text/javascript">

	function formCheck(){
		var member_id = document.getElementById("member_id").value;
		var member_pw = document.getElementById("member_pw").value;
		var member_email = document.getElementById("member_email").value;

		if(member_id.length < 3 || member_id.length > 10){
			alert("아이디는 3~10 글자를 입력하세요");
			return false; 
		}
			
		if(member_pw.length < 3 || member_pw.length > 10){
			alert("비밀번호는 3~10 글자를 입력하세요");
			return false; 
		}

		if(member_email == '' || member_email.length == 0){
			alert("이메일을 입력해주세요");
			return false;
		}
		return true; 
	}
</script>
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
			
			<div id="setting" class="container border  border-dark align-self-center align-items-center mx-auto m-5 pb-5"  style="width:320px; height:320px; background-color: white;">
			<div class="text-center">
				<h2 style="color: black;">Sign Up</h2>	
			</div>
			<div  class="d-flex justify-content-center align-items-center ">
  				<form action="signup" method="post">
  					<div class="form-group"> 			
      					<label for="id" style="color: black;">ID</label>    		
      					<input type="text" class="form-control" placeholder="3 ~ 10 글자" id="member_id" name="member_id" style="width:250px; height:25px; font-size:18px;">		
    				</div>			
    			<div class="form-group">
      				<label for="pwd" style="color: black;">Password</label>
      				<input type="password" class="form-control" placeholder="3 ~ 10 글자" id="member_pw" name="member_pw" style="width:250px; height:25px; font-size:18px;">
    			</div>
    			<div class="form-group"> 			
      				<label for="email" style="color: black;">Email</label>    		
      				<input type="email" class="form-control" placeholder="인증받을 이메일" id="member_email" name="member_email" style="width:250px; height:25px; font-size:18px;">		
    			</div>	
    			<div class="form-group text-center">
    				<input type="submit" class="btn btn-primary" id="btn1 "value="가입" onclick="return formCheck();">  			
    				&emsp; 
    				<a href="<c:url value="/"/>"><input type="button" class="btn btn-danger" id="btn2" value="취소"></a>   			 		
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
      					<a class="nav-link text-body" href="/category/bestForm" style="padding-left: 0;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory">viewCategory</a>
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