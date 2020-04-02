<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style>
	#setting {
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



	<c:choose>
		<c:when test="${msg2 == 'fail'}">
			<div id="setting" class="text-center">
				<h4>가입한 아이디가 존재하지 않습니다.</h4>
				<br/>
				<a href="<c:url value="/"/>"><input type="button" class="btn btn-outline-info" value="메인 페이지로 이동"></a>
			</div>
		</c:when>
		<c:otherwise>
			<div id="setting" class="text-center">
				<h4>가입한 아이디는 </h4>
				<c:forEach var="item" items="${msg2}">
					${item.member_id}<br/>
				</c:forEach>		
				<br/>
				<a href="<c:url value="/member/loginForm"/>"><input type="button" class="btn btn-outline-info" value="로그인 하기"></a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>