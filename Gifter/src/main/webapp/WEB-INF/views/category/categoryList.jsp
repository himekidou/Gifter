<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
      					<a class="nav-link disabled text-body" href="#" style="font-size: 1.0416666666666667vw;">${sessionScope.member_id}'s Gifter</a> 
    				</li>
					<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="font-size: 1.0416666666666667vw;">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/logout" style="font-size: 1.0416666666666667vw;">Logout</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/myPage" style="font-size: 1.0416666666666667vw;">My Page</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style="font-size: 1.0416666666666667vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="font-size: 1.0416666666666667vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.0416666666666667vw;">About</a>
    				</li>
				</ul>	
			</div>
			
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="font-size: 1.0416666666666667vw;">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm" style="font-size: 1.0416666666666667vw;">Sign Up</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm" style="font-size: 1.0416666666666667vw;">Login</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="font-size: 1.0416666666666667vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.0416666666666667vw;">About</a>
    				</li>
  				</ul>	
			</div>	
				 						
	 	</c:otherwise>
	 </c:choose>
	 
	
	
	
	<div id="list" class="d-flex justify-content-center align-items-center " style="padding-top: 80px;">
	<form>
		<table class="table" style="width:350px; background-color: white;  border-radius: 10px;">
			<thead>
			<tr>
				<th style="color: black;">순위</th>
				<th style="color: black;">카테고리 </th>
				<th style="color: black;">횟수</th>
				
			</tr>
			</thead>
			<c:forEach var="item" items="${list}" varStatus="status">
				<tbody>
				<tr>
					<td style="color: black;">
						
							${status.count}
						
					</td>
					<td style="color: black;">${item.CAT_NAME}</td>
					<td style="color: black;">${item.CAT_INCRE}</td>	
					
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