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

<style type="text/css">
	
	.box1 {
  		background: #d93c2c;
  		/* grid-row : 1/3; */
	}
	.box2 {
  		background: #f8f8d9; 
	}
	.box3 {
  		background: #005282; 
	}
	* {
  		color: white;
  		font-weight: bold;
  		margin: 0;
  		padding: 0;
	}
	.main {
  		display: grid;
  		grid-template-columns: 20% 60% 20%;
  		/* grid-template-rows: 60% 40%; */			
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
      					<a class="nav-link text-body" href="/member/logout">Logout</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/myPage">My Page</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory">viewCategory</a>
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
  				</ul>	
			</div>	
				 						
	 	</c:otherwise>
	 </c:choose>
	 
	 
	<br/><br/><br/><br/>
	
	
	<div id="list" class="d-flex justify-content-center align-items-center ">
	<form>
		<table class="table" style="width:350px; background-color: white;  border-radius: 10px;">
			<thead>
			<tr>
				<th style="color: black;">순위</th>
				<th style="color: black;">카테고리 </th>
				<th style="color: black;">횟수</th>
				<th style="color: black;">나이</th>
				<th style="color: black;">성별</th>
			</tr>
			</thead>
			<c:forEach  var="item" items="${list}" varStatus="status">
				<tbody>
				<tr>
					<td style="color: black;">${status.count}</td>
					<td style="color: black;">${item.cat_name}</td>
					<td style="color: black;">${item.cat_incre}</td>	
					<td style="color: black;">${item.info_age}</td>
					<td style="color: black;">
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
	
	</div>
		<div class="box3">
      
      </div>
      </div>
      
    
</body>
</html>