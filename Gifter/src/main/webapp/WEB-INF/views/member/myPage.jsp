<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
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
     				 	<a class="nav-link" href="/member/myPage">My Page</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link " href="/category/bestForm">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link " href="/category/viewCategory">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link" href="/member/logout">Logout</a>
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
	<div class="text-center">
		<h2>My Page</h2>	
	</div>
	<div  class="d-flex justify-content-center align-items-center ">
  		<form action="/member/pwUpdate" method="post">
  			<div class="form-group"> 			
      			<label for="id">ID</label>    		
      			<input type="text" class="form-control"  name="member_id" value="${info.member_id}" readonly="readonly" style="width:250px; height:25px; font-size:18px;">		
    		</div>	
    		<div class="form-group"> 			
      			<label for="email">Email</label>    		
      			<input type="email" class="form-control"  name="member_email" value="${info.member_email}" readonly="readonly" style="width:250px; height:25px; font-size:18px;">		
    		</div>		
    		<div class="form-group">
      			<label for="pwd">Password</label>
      			<input type="password" class="form-control" placeholder="3 ~ 10 글자" id="member_pw" name="member_pw" style="width:250px; height:25px; font-size:18px;">
    		</div>
    		<div class="form-group">
      			<label for="pwd">Password Check</label>
      			<input type="password" class="form-control" placeholder="3 ~ 10 글자" id="pwCheck" name="pwCheck" style="width:250px; height:25px; font-size:18px;">
    		</div>	
    		
    		<div class="form-group text-center">
    			<input type="submit" class="btn btn-success" id="btn1" value="비밀번호 수정" onclick="return formCheck();">  			
    			&nbsp; &nbsp;
    			<a href="<c:url value="/"/>"><input type="button" class="btn btn-danger" id="btn2" value="취소"></a>   			 		
    		</div>
  		</form>
	</div>
	<div class=" text-center">
	<a href="<c:url value="/member/deleteMemberForm"/>">회원탈퇴</a>
	</div>
	</div>
	
</body>
</html>