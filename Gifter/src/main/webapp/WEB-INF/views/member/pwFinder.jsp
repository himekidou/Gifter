<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
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
	 	</c:otherwise>
	 </c:choose>
	 
	<br/><br/><br/><br/><br/><br/>
	
	<div id="setting">
		<div class="text-center" >
			<h3>비밀번호 찾기</h3>
			가입할 때 입력한 아이디와 이메일을 적어 주세요 <br/>
			이메일로 임시 비밀번호를 보내 드립니다 ! <br/><br/>
		</div>
		<div class="d-flex justify-content-center align-items-center ">
	 		<form action="pwFind" method="post">
	 			<div class="form-group"> 
	 				<label for="id">ID</label>   
	 				<input type="text" class="form-control" id="member_id" name="member_id" placeholder="가입한 아이디" style="width:250px; height:25px; font-size:16px;">
	 			</div>
	 			<div class="form-group"> 
	 				<label for="email">email</label> 
	 				<input type="text" class="form-control" id="member_email" name="member_email" placeholder="abc@gmail.com" style="width:250px; height:25px; font-size:16px;">
	 			</div>
	 			<div class="form-group text-center">	
	 				<input type="submit" class="btn btn-primary" id="btn" value="확인">
	 				&emsp;
	 				<a href="<c:url value='/'/>"><input type="button" class="btn btn-danger" value="취소"></a>	
	 			</div>
	 		</form>
	 	</div>
	 </div>
</body>
</html>