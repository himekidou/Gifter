<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
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
	<br/><br/><br/><br/>
	<div id="setting" class="container border  border-dark align-self-center align-items-center mx-auto m-5 pb-5"  style="width:350px; height:350px;">
	<div class="text-center">
		<h2>Sign Up</h2>	
	</div>
	<div  class="d-flex justify-content-center align-items-center ">
  		<form action="signup" method="post">
  			<div class="form-group"> 			
      			<label for="id">ID</label>    		
      			<input type="text" class="form-control" placeholder="3 ~ 10 글자" id="member_id" name="member_id" style="width:250px; height:25px; font-size:18px;">		
    		</div>			
    		<div class="form-group">
      			<label for="pwd">Password</label>
      			<input type="password" class="form-control" placeholder="3 ~ 10 글자" id="member_pw" name="member_pw" style="width:250px; height:25px; font-size:18px;">
    		</div>
    		<div class="form-group"> 			
      			<label for="email">Email</label>    		
      			<input type="email" class="form-control" placeholder="인증받을 이메일" id="member_email" name="member_email" style="width:250px; height:25px; font-size:18px;">		
    		</div>	
    		<div class="form-group text-center">
    			<input type="submit" class="btn btn-primary" id="btn1 "value="가입" onclick="return formCheck();">  			
    			&emsp; 
    			<a href="<c:url value="/"/>"><input type="button" class="btn btn-danger" id="btn2" value="취소"></a>   			 		
    		</div>
  		</form>
	</div>
	</div>
	
</body>
</html>