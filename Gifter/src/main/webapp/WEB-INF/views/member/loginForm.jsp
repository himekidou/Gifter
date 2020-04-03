<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
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
<style>
	#socialLoginSuccess{
		width:300px;
		height:200px;
		position:absolute;
		left:50%;
		top:50%;
		margin:-100px 0 0 -150px;  
	}
</style>
</head>
<body>
	<br>
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


	<c:choose>
		<c:when test="${member_id != null}">
			<c:if test="${member_id != null}">
				<div id="socialLoginSuccess" class="text-center">
				<h2> 로그인 성공 !! </h2>
				<br/>
				<h3>'${member_id}'님 환영합니다! </h3>
				<br/>	
				<h3><a href="/">메인 이동</a></h3>		
				</div>			
			</c:if>				
		</c:when>	
		<c:otherwise>
		
		<br/><br/><br/><br/>	
		
		<div id="setting">
			<div class="text-center">
				<h2>Login</h2>	
			</div>
			<div class="d-flex justify-content-center align-items-center">
  				<form action="/member/login" method="post">
  					<div class="form-group"> 			
      					<label for="id">ID</label>    		
      					<input type="text" class="form-control" placeholder="ID" id="member_id" name="member_id" style="width:250px; height:25px; font-size:18px;">		
    				</div>			
    				<div class="form-group">
      					<label for="pwd">Password</label>
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
				<input type="button" class="btn btn-secondary"  id="idFind" value="아이디 찾기">
				&emsp;
				<input type="button"  class="btn btn-secondary" id="pwFind" value="비밀번호 찾기">					
			</div>	
			<br/>
			<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" class="text-center"><a href="${naver_url}">
				<img width="190" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
				<br/>
				<!-- 구글 로그인 화면으로 이동 시키는 URL -->
				<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
				<div id="google_id_login" class="text-center"><a href="${google_url}"><img width="190" src="${pageContext.request.contextPath}/resources/btn_google_signin_dark_focus_web@2x.png"/></a></div>  
				<br/>	
				<!--카카오 로그인 창으로 이동  -->
				<div id="kakao_id_login" class="text-center"> 
					<a href="${kakao_url}"> 
					<img width="190" src="${pageContext.request.contextPath}/resources/kakao_account_login_btn_medium_narrow.png" /></a> 
				</div>	
		</div>
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>