<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script>
	$(function(){
		$("#yes").click(function(){
			$("#yes").hide();
			$("#no").hide();
			var str = "";
			str += "<form action='/member/deleteMember' method='post'><table><tr><th>ID</th><td>";
			str += "<input type='text' name='member_id' value='${member_id}' readonly='readonly'>"
			str += "</td></tr><tr><th>PW</th><td>";
			str += "<input type='text' id='member_pw' name='member_pw'>";
			str += "</td></tr><tr><td>";
			str += "<input type='submit' id='btn1' value='탈퇴' onclick='return formCheck();'>";
			str += "</td><td>";
			str += "<a href='/'><input type='button' value='취소'></a>";
			$("#next").append(str);
		});

		
		function formCheck(){		
			
			var member_pw = $("#member_pw").val();
			
			if(member_pw.length == 0 || member_pw == ''){
				alert("비밀번호를 입력해주세요.");
				return false; 
			}
			var result = confirm("탈퇴하시겠습니까?");

			if(result == false){
				return false;
			}
			
			return true; 
		}

		$("#no").click(function(){
			location.href="/";
		});		
	
	});
</script>
</head>
<body>
	정말 회원을 탈퇴하시겠습니까? <br/><br/>
	<input type="button" value="yes" id="yes">
	<input type="button" value="no" id="no">
	<div id="next">
	
	</div>
</body>
</html>