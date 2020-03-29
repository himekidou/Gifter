<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
 	#title, #form {
 		margin: 0 auto;
		text-align: center;
		width: 1510px;
 	}
</style>
</head>
<body>	
	<form action="signup" method="post" id="form">
		<div id="title">
			<h1>Sign up</h1>
		</div>
		<table style="margin-left: auto; margin-right: auto; text-align: center;">	
		<tr>
			<th>ID</th>
			<td><input type="text" placeholder="ID (3~10글자) " id="member_id" name="member_id"><br/></td>
		</tr>
		<tr>
			<th>password</th>
			<td><input type="password" placeholder="password (3~10글자) " id="member_pw" name="member_pw"><br/></td> 
		</tr>
		<tr>
			<th>e-mail</th>
			<td><input type="email" placeholder="e-mail (인증받을 이메일) " id="member_email" name="member_email"></td>
		</tr>
		<tr>
			<td><input type="submit" id="btn1 "value="가입" onclick="return formCheck();"></td>	
			<td><a href="<c:url value="/"/>"><input type="button" id="btn2" value="취소"></a></td>
		</tr>		
		</table>		
	</form>	
</body>
</html>