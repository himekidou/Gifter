<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script>
	$(function(){
		$("#yes").click(function(){
			$("#sign").hide();
			$("#yes").hide();
			$("#no").hide();
			var str = "";
			str += "<form action='/member/deleteMember' method='post'>";
			str += "<div class='form-group'><label for='id'>ID</label>";
			str += "<input type='text' class='form-control' name='member_id' value='${member_id}' readonly='readonly'></div>"
			str += "<div class='form-group'><label for='password'>Password</label>";
			str += "<input type='password' class='form-control' id='member_pw' name='member_pw'></div>";
			str += "<div class='form-group text-center'>";
			str += "<input type='submit' class='btn btn-primary' id='btn1' value='탈퇴' onclick='return formCheck();'>";
			str += "&emsp;";
			str += "<a href='/'><input type='button' class='btn btn-danger' value='취소'></a>";
			$("#next").append(str);
		});

		
		$("#no").click(function(){
			location.href="/";
		});		
	
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
	
</script>
<style>
	#setting{
		width:300px;
		height:300px;
		position:absolute;
		left:50%;
		top:50%;
		margin:-100px 0 0 -150px;  
	}
</style>
</head>
<body>
	<c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
					<li class="nav-item">
      					<a class="nav-link disabled" href="#">${sessionScope.member_id}'s Gifter</a> 
    				</li>
					<li class="nav-item">
      					<a class="nav-link" href="<c:url value="/"/>">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link" href="/member/logout">Logout</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link" href="/member/myPage">My Page</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link " href="/category/bestForm">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link " href="/category/viewCategory">viewCategory</a>
    				</li>
				</ul>	
			</div>
			<br/>	
	 		<br/>
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
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
			<br/>	
	 		<br/>	 						
	 	</c:otherwise>
	 </c:choose>
	
	<div id="setting">
		<div class="text-center" >
			<div id="sign">
			<h4>회원 탈퇴하시겠습니까?</h4> <br/>
			</div>
			<input type="button" class="btn btn-primary" value="네" id="yes">
			&emsp;
			<input type="button" class="btn btn-danger" value="아니요" id="no">
		</div>
		<div id="next">
	
		</div>
	</div>
	
	
</body>
</html>