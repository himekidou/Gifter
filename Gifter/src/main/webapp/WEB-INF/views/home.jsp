<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script type="text/javascript">
	function formCheck(){
		var taker_insta = document.getElementById("taker_insta");

		
		if(taker_insta.value == '' || taker_insta.value.length == 0){
			alert("인스타그램 ID를 입력해주세요");
			return false;
		}		
		return true;
	}
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style type="text/css">
	
	.box1 {
  		background: white;
  		grid-row : 1/3;
	}
	.box2 {
  		background: #ff7f00;
  		
  		
  		
	}
	.box3 {
  		background: brown;
  		
	}
	* {
  		color: white;
  		font-weight: bold;
  		margin: 0;
  		padding: 0;
	}
	.main {
  		display: grid;
  		grid-template-columns: 60% 40%;
  		grid-template-rows: 70% 30%;			
  		height: 100%; 
  		width: 100%;			
	}
	
	input::-webkit-input-placeholder {
  		color: black;
	}
	input:-moz-placeholder {
  		color: black;
	}
	
</style>
</head>
<body>

	 <div class="main">
      <div class="box1">
      
        <c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
					<li class="nav-item">
      					<a class="nav-link disabled text-body" href="#" style="font-size: 1.0416666666666667vw;">${sessionScope.member_id}'s Gifter</a> 
    				</li>
					<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="color: black; font-size: 1.0416666666666667vw;">Home</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/myPage" style="color: black; padding-right: 0; font-size: 1.0416666666666667vw;">My Page</a>
    				</li>
    				
				</ul>	
			</div>	
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="color: black; font-size: 1.0416666666666667vw;">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm" style="color: black; font-size: 1.0416666666666667vw;">Sign Up</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm" style="color: black; padding-right: 0; font-size: 1.0416666666666667vw;">Login</a>
    				</li>
  				</ul>	
			</div>						
	 	</c:otherwise>
	 </c:choose>    
	  
        <br/><br/>    
		<div class="d-flex justify-content-center align-items-center " style="height:29.296875vw">		
	 		<form action="taker/search" method="get" onsubmit="return formCheck();">
	 			<input type="text" id="taker_insta" name="taker_insta" placeholder="@U.N.J.O.O"  style="width:32.552083333333336vw; height:1.6276041666666667vw; font-size:1.6276041666666667vw; color: black;">
	 			<input type="image" id="btn1" src="${pageContext.request.contextPath}/resources/iconfinder_-_Magnifier-Search-Zoom-_3844432.png" style="width: 1.6276041666666667vw; height:1.6276041666666667vw;" >
	 		</form>	
	 	</div>
      </div>
      
      <div class="box2">
      	<c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-start">				
    				<li class="nav-item" style="padding-left: 0">
      					<a class="nav-link text-body" href="/category/bestForm" style="color: black; padding-left: 0; font-size: 1.0416666666666667vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="color: black; font-size: 1.0416666666666667vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/logout" style="color: black; font-size: 1.0416666666666667vw;">Logout</a>
    				</li>
				</ul>	
			</div>	
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-start">
    				
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style="color: black; padding-left: 0; font-size: 1.0416666666666667vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="color: black; font-size: 1.0416666666666667vw;">viewCategory</a>
    				</li>
  				</ul>	
			</div>						
	 	</c:otherwise>
	 </c:choose>   
        
        <div class="text-left" style="color: black; font-size: 2.6041666666666665vw; color: black; padding-left: 6.510416666666667vw; padding-right: 6.510416666666667vw; padding-bottom: 1.6276041666666667vw; letter-spacing: 0.1953125vw;">
        <br/><br/>
        	Enter the<br/>
        	InstaGram ID of<br/>
        	the person you<br/>
        	want to present.
        </div>
      </div>
      
      <div class="box3 text-center" style="font-size: 8vw; color: black; padding-top: ;">
        Gifter
      </div>
    </div>
	 
</body>
</html>
