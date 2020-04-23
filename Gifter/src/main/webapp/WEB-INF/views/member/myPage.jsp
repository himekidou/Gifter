<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>	
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
	
	.box1 {
  		background: #6d6d6d;
  		/* grid-row : 1/3; */
	}
	.box2 {
  		background: #f5f5dc;
  		/* grid-row : 2/2; */ 
	}	
	
	
	* {
  		color: white;
  		font-weight: bold;
  		margin: 0;
  		padding: 0;
	}
	.main {
  		display: grid;
  		grid-template-columns: 20% 80%;
  		/* grid-template-rows: 100%; 	 */	
  		height: 100%; 
  		width: 100%;			
	}
	
</style>
</head>
<body> 
	<div class="main">
	
      <div class="box1">
       
      </div>
      
      <div class="box2">
        
        <c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
					<li class="nav-item">
      					<a class="nav-link disabled text-body" href="#">${sessionScope.member_id}'s Gifter</a> 
    				</li>
					<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>">Home</a>
    				</li>    				
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.0416666666666667vw;">About</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/logout">Logout</a>
    				</li>
				</ul>	
			</div>
			
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm">Sign Up</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm">Login</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.0416666666666667vw;">About</a>
    				</li>
  				</ul>	
			</div>	
				 						
	 	</c:otherwise>
	 </c:choose>
		
		<br/><br/>
		<div id="setting" class="container border  border-dark align-self-center align-items-center mx-auto m-5 pb-5" style="width:360px; height:430px;  background-color: white;  border-radius: 10px;">
		<div class="text-center">
			<h2 style="color: black;">My Page</h2>	
		</div>
		<div  class="d-flex justify-content-center align-items-center ">
  			<form action="/member/pwUpdate" method="post">
  				<div class="form-group"> 			
      				<label for="id" style="color: black;">ID</label>    		
      				<input type="text" class="form-control"  name="member_id" value="${info.member_id}" readonly="readonly" style="width:270px; height:25px; font-size:18px;">		
    			</div>	
    			<div class="form-group"> 			
      				<label for="email" style="color: black;">Email</label>    		
      				<input type="email" class="form-control"  name="member_email" value="${info.member_email}" readonly="readonly" style="width:270px; height:25px; font-size:18px;">		
    			</div>		
    			<div class="form-group">
      				<label for="pwd" style="color: black;">Password</label>
      				<input type="password" class="form-control" placeholder="3 ~ 10 글자" id="member_pw" name="member_pw" style="width:270px; height:25px; font-size:18px;">
    			</div>
    			<div class="form-group">
      				<label for="pwd" style="color: black;">Password Check</label>
      				<input type="password" class="form-control" placeholder="3 ~ 10 글자" id="pwCheck" name="pwCheck" style="width:270px; height:25px; font-size:18px;">
    			</div>	
    		
    			<div class="form-group text-center">
    				<input type="submit" class="btn btn btn-primary" id="btn1" value="비밀번호 수정" onclick="return formCheck();">  			
    				&nbsp; &nbsp;
    				<a href="<c:url value="/"/>"><input type="button" class="btn btn-danger" id="btn2" value="취소"></a>   			 		
    			</div>
  			</form>
		</div>
		<div class=" text-center">
			<a href="<c:url value="/member/deleteMemberForm"/>" style="color: #c80000;">회원탈퇴</a>
		</div>
		</div>

      	</div>
     
    </div>
</body>
</html>