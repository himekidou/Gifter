<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>로그인</title>	
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script type="text/javascript">
	function formCheck(){
		var member_id = $("#member_id").val();
		var member_pw = $("#member_pw").val();

		if(member_id == ''){
			alert("아이디를 입력해주세요");
			return false;
		}
		if(member_pw == ''){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		return true;
	}	 

 	function explain(){
 		alert("가입한 ID와 비밀번호를 입력하시면 됩니다.");		
 	}

	$(function(){
		$("#idFind").click(function(){
			location.href="/member/idFinder";
		})
		
		$("#idFind2").click(function(){
			location.href="/member/idFinder";
		})

		$("#pwFind").click(function(){
			location.href="/member/pwFinder";
		})

		$("#pwFind2").click(function(){
			location.href="/member/pwFinder";
		})
	});

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
    					<a class="nav-link text-body" href="/member/signupForm" style="padding-right: 0;">Sign Up</a>
    				</li>
  				</ul>		
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
			
			<c:choose>
			
		<c:when test="${member_id != null}">
			<c:if test="${member_id != null}">
				<div id="socialLoginSuccess" class="text-center">
					<br/><br/><br/>
					<h2 style="color: black;"> 로그인 성공 </h2>
					<br/>
					<h3 style="color: black;">'${member_id}'님 환영합니다. </h3>
					<br/>	
					<h2><a href="/"><input type="button" class="btn btn-link" value="메인 페이지 이동" style="color: black"></a></h2>		
				</div>			
			</c:if>				
		</c:when>	
		<c:otherwise>
			
		
		<div id="setting" class="container border  border-dark align-self-center align-items-center mx-auto m-5 pb-5"  style="width:370px; height:370px; background-color: white;">
			<div class="text-center">
				<h2 style="color: black;">Login</h2>	
			</div>
			<div class="d-flex justify-content-center align-items-center">
  				<form action="/member/login" method="post">
  					<div class="form-group"> 			
      					<label for="id" style="color: black;">ID</label>    		
      					<input type="text" class="form-control" placeholder="ID" id="member_id" name="member_id" style="width:250px; height:25px; font-size:18px;">		
    				</div>			
    				<div class="form-group">
      					<label for="pwd" style="color: black;">Password</label>
      					<input type="password" class="form-control" placeholder="Password" id="member_pw" name="member_pw" style="width:250px; height:25px; font-size:18px;">
    				</div> 
    				<div class="form-group text-center">
    					<input type="submit" class="btn btn-primary" id="btn1 "value="로그인" onclick="return formCheck();">  			
    					&emsp; &nbsp;
    					<a href="<c:url value="/"/>"><input type="button" class="btn btn-danger" id="btn2" value="취소"></a>   			 		
    				</div>
  				</form>
			</div>
			<div class="text-center">
				<input type="button" class="btn btn-outline-secondary"  id="idFind" value="아이디 찾기">
				&emsp;
				<input type="button"  class="btn btn-outline-secondary" id="pwFind" value="비밀번호 찾기">					
			</div>	
			
			<br/>
			<div class="text-center">
				<!-- 네이버 로그인 창으로 이동 -->
				<a href="${naver_url}">
				<img width="35" src="${pageContext.request.contextPath}/resources/icon/Log in with NAVER_Icon_Green (1).png"/></a>		
				&emsp;
				<!-- 구글 로그인 화면으로 이동 시키는 URL -->
				<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
				<a href="${google_url}">
				<img width="45" src="${pageContext.request.contextPath}/resources/icon/btn_google_light_normal_ios.png"/></a>			
				&emsp;
				<!--카카오 로그인 창으로 이동  -->
				<a href="${kakao_url}"> 
				<img width="35" src="${pageContext.request.contextPath}/resources/icon/kakaolink_btn_small.png" /></a> 
			</div>	
		</div>
		</c:otherwise>
	</c:choose>
			
      	</div>
      	<div class="box4">
        	
      	</div>
      	<div class="box5">
        	
    	</div>   
	</div>
</body>
</html>