<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정 결과</title>	
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
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
		
		<br/><br/><br/><br/>
		<c:choose>
		<c:when test="${msg4 == 'success'}">
			<div id="setting" class="text-center" style="width: 350px; height: 160px; background-color: white; margin-left: 390px; margin-top: 135px; border-radius: 10px;">
				<h4 style="color: black;">${member_id}님의</h4>
				<h4 style="color: black;">비밀번호가 수정 됐습니다</h4>
				<br/>
				<a href="<c:url value="/"/>"><input type="button" class="btn btn-dark" value="메인 이동"></a>
			</div>
		</c:when>
		<c:otherwise>
			<div id="setting2" class="text-center" style="width: 350px; height: 240px; background-color: white; margin-left: 390px; margin-top: 135px;  border-radius: 10px;">
				<h4 style="color: black;">비밀번호 수정에</h4> 
				<h4 style="color: black;">실패했습니다</h4>
				<h4 style="color: black;">다시 해주세요</h4>
				<br/>
				<a href="<c:url value="/member/mypage"/>"><input type="button" class="btn btn-dark" value="마이 페이지 이동"></a>
			</div>
		</c:otherwise>
	</c:choose>

      	</div>
     
    </div>
</body>
</html>