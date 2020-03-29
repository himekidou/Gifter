<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
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
</head>
<body>
	<h3>아이디 찾기</h3>
	가입할 때 입력한 이메일을 적어 주세요 <br/><br/>
	 <form action="idFind" method="post">
	 	email &nbsp; 
	 	<input type="text" id="member_email" name="member_email" placeholder="abc@gmail.com">
	 	&nbsp; <input type="submit" id="btn" value="확인">
	 	&nbsp; <a href="<c:url value='/'/>"><input type="button" value="취소"></a>
	 </form>
	
</body>
</html>