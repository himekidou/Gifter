<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>비밀번호 찾기</title>	
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script>
	$(function(){
		$("#btn").click(function(){
			var member_id = $("#member_id").val();
			var member_email = $("#member_email").val();
			if(member_id == "" || member_id.length == 0){
				alert("가입한 아이디를 입력해주세요.");
				return false;
			}		
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
	 		<br/>	 						
		
	
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
        
        <c:choose>
		<c:when test="${msg3 == 'fail'}">
			<div id="setting" class="text-center" style="color: black; margin: 145px;  border-radius: 10px;">
				<h4 style="color: black;">아이디 또는 이메일이 </h4> 
				<h4 style="color: black;">맞지 않습니다</h4><br/>
				<a href="<c:url value="/"/>"><input type="button" class="btn btn-light" value="메인 페이지 이동"></a>		
			</div>
		</c:when>
		<c:otherwise>
			<div id="setting" class="text-center" style="color: black; margin: 145px;  border-radius: 10px;">
				<h4 style="color: black;">이메일로 임시 비밀번호를 </h4>
				<h4 style="color: black;">보내드렸습니다 </h4>
				<h4 style="color: black;">확인 후 로그인 하세요</h4>
				<br/>
				<a href="<c:url value="/member/loginForm"/>"><input type="button" class="btn btn-light" value="로그인 하기"></a>
			</div>
		</c:otherwise>
	</c:choose>
        
      </div>
    </div>
</body>
</html>