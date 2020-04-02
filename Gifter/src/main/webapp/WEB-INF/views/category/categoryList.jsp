<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 리스트</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style>
	#list{
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
	<br/><br/><br/><br/>
	<div id="list" class="d-flex justify-content-center align-items-center ">
	<form>
		<table class="table" style="width:350px;">
			<thead>
			<tr>
				<th>순위</th>
				<th>카테고리 </th>
				<th>횟수</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
			</thead>
			<c:forEach  var="item" items="${list}" varStatus="status">
				<tbody>
				<tr>
					<td>${status.count}</td>
					<td>${item.cat_name}</td>
					<td>${item.cat_incre}</td>	
					<td>${item.info_age}</td>
					<td>
					<c:if test="${item.info_gender == 0}">
						남자
					</c:if>
					<c:if test="${item.info_gender == 1}">
						여자
					</c:if>	
					</td>
				</tr>	
				</tbody>	
			</c:forEach>
		</table>
	</form>
	</div>
	
</html>