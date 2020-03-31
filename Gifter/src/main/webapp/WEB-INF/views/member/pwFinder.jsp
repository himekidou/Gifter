<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
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

</style>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	가입할 때 입력한 아이디와 이메일을 적어 주세요 <br/>
	이메일로 임시 비밀번호를 보내 드립니다 ! <br/><br/>
	 <form action="pwFind" method="post">
	 	<table>
	 	<tr>
	 		<th>ID</th>
	 		<td>
	 			<input type="text" id="member_id" name="member_id" placeholder="가입한 아이디"><br/>
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>email</th>
	 		<td>
	 			<input type="text" id="member_email" name="member_email" placeholder="abc@gmail.com">
	 		</td>
	 	</tr> 	
	 	<tr>	
	 		<td><input type="submit" id="btn" value="확인"></td>
	 		<td><a href="<c:url value='/'/>"><input type="button" value="취소"></a></td>		
	 	</tr>	 	
	 	</table>	
	 </form>
</body>
</html>