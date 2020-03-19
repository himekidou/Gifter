<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
	#loginForm{
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
</script>
</head>
<body>
<h1>Login Form</h1>
<hr>
<br>

	<form action="login" method="post" name="frm" style="width:470px;">
		<div id="loginForm">
			<h2>로그인</h2>
			<input type="text" name="member_id" id="member_id" class="w3-input w3-border" placeholder="아이디" value="${id}"> <br>
			<input type="password" id="member_pw" name="member_pw" class="w3-input w3-border" placeholder="비밀번호" > <br>
			<input type="submit" value="로그인" onclick="return formCheck();">
			<a href="<c:url value="/"/>"><input type="button" id="btn2" value="취소"></a>
		</div>
	</form>	
	<br/>
	
	<!-- 네이버 로그인 창으로 이동 -->
	<div id="naver_id_login" style="text-align:center"><a href="naverLogin">
	<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
	<br>

</body>
</html>