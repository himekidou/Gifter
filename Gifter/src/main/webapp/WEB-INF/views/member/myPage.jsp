<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script type="text/javascript">
	function formCheck(){		
		
		var member_pw = $("#member_pw").val();
		var pwCheck = $("#pwCheck").val();
		
		
		if(member_pw.length < 3 || member_pw.length > 10 || member_pw == ''){
			alert("비밀번호는 3~10 글자를 입력하세요.");
			return false; 
		}

		if(pwCheck.length < 3 || pwCheck.length > 10 || pwCheck == ''){
			alert("확인할 비밀번호는 3~10 글자를 입력하세요.");
			return false; 
		}

		if(member_pw != pwCheck){
			alert("비밀번호가 맞지 않습니다. 다시 입력해주세요.");
			return false;
		}

		return true; 
	}
		
</script>
<style type="text/css">
	#deleteMember{
		margin-left: auto; 
		margin-right: auto; 
		text-align: center;
	}

</style>
</head>
<body>
	<form action="/member/pwUpdate" method="post" id="form">
		<div id="title" style="margin-left: auto; margin-right: auto; text-align: center;">
			<h1>My Page</h1>
		</div>
		<table style="margin-left: auto; margin-right: auto; text-align: center;">	
		<tr>
			<th>ID</th>
			<td><input type="text" style="width: 200px; height: 25px;" placeholder="ID (3~10글자) " name="member_id" value="${info.member_id}" readonly="readonly"></td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td><input type="email" style="width: 200px; height: 25px;" placeholder="e-mail (인증받을 이메일) " name="member_email" value="${info.member_email}" readonly="readonly"></td>
		</tr>
		<tr>
			<th>password</th>
			<td><input type="password" style="width: 200px; height: 25px;" placeholder="password (3~10 letters) " id="member_pw" name="member_pw"></td> 
		</tr>
		<tr>
			<th>password check</th>
			<td><input type="password" style="width: 200px; height: 25px;" placeholder="password check (3~10 letters) " id="pwCheck" name="pwCheck"></td> 
		</tr>		
		<tr>
			<td><input type="submit" id="btn1 "value="비밀번호 수정" onclick="return formCheck();"></td>	
			<td><a href="<c:url value="/"/>"><input type="button" value="취소"></a></td>
		</tr>		
		</table>		
	</form>
	<br/>
	<div id="deleteMember">
	<a href="<c:url value="/member/deleteMemberForm"/>"><input type="button" id="btn1" value="회원 탈퇴"></a>
	</div>	
</body>
</html>