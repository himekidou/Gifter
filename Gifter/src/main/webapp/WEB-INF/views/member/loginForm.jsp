<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>  -->
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<style type="text/css">
	#title, #loginForm, #naver_id_login, #google_id_login, #kakao_id_login, #question, #find, #loginFail{
		margin: 0 auto;
		text-align: center;
		width: 1510px;
	}
</style>
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

		$("#pwFind").click(function(){
			location.href="/member/pwFinder";
		})
	});

</script>
</head>
<body>
	
	<c:choose>
		<c:when test="${member_id != null}">
			<c:if test="${member_id != null}">
				<h2> 로그인 성공하셨습니다!! </h2>
				<h3>'${member_id}'님 환영합니다! </h3>			
			</c:if>	
				<h3><a href="/">메인 이동</a></h3>
		</c:when>	
		<c:otherwise>	
			<div id="title">
					<h1>Login</h1>
				</div>		
			<form action="/member/login" method="post" name="frm" style="width:470px;">
				<div id="loginForm">				
					<input type="text" name="member_id" id="member_id" class="w3-input w3-border" placeholder="ID"> <br>
					<input type="password" id="member_pw" name="member_pw" class="w3-input w3-border" placeholder="password" > <br/><br/>
					<input type="submit" value="login" onclick="return formCheck();">
					<a href="<c:url value="/"/>"><input type="button" id="btn2" value="취소"></a>								
				</div>
			</form>	
			<br/>
			<form>
				<div id="question">
				<input type="image" id="btn1" src="${pageContext.request.contextPath}/resources/iconfinder__question_help_faq_question_mark_4213446.png" width="22" height="22" onclick="explain()">
				</div>
			</form>	
			
			<br/>
				<div id="find">
				<input type="button" id="idFind" value="아이디 찾기">
				<input type="button" id="pwFind" value="비밀번호 찾기">	
				</div>		
			<br/>	
	
			<!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align:center"><a href="${naver_url}">
			<img width="190" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
			<br/>
			<!-- 구글 로그인 화면으로 이동 시키는 URL -->
			<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
			<div id="google_id_login" style="text-align:center"><a href="${google_url}"><img width="190" src="${pageContext.request.contextPath}/resources/btn_google_signin_dark_focus_web@2x.png"/></a></div>  
			<br/>	
			<!--카카오 로그인 창으로 이동  -->
			<div id="kakao_id_login" style="text-align: center"> 
				<a href="${kakao_url}"> 
				<img width="190" src="${pageContext.request.contextPath}/resources/kakao_account_login_btn_medium_narrow.png" /></a> 
			</div>
		</c:otherwise>
	</c:choose>
	


</body>
</html>