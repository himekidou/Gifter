<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
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
	 		<div class="d-flex justify-content-center align-items-center " style="height:450px">		
	 			<form action="taker/search" method="get" onsubmit="return formCheck();">
	 				<input type="text" id="taker_insta" name="taker_insta" placeholder="@U.N.J.O.O" style="width:500px; height:25px; font-size:18px;">
	 				<input type="image" id="btn1" src="${pageContext.request.contextPath}/resources/iconfinder_-_Magnifier-Search-Zoom-_3844432.png" width="18" height="18">
	 			</form>	
	 		</div>	 		
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
					
			<div class="d-flex justify-content-center align-items-center " style="height:450px">		
	 			<form action="taker/search" method="get" onsubmit="return formCheck();">
	 				<input type="text" id="taker_insta" name="taker_insta" placeholder="@U.N.J.O.O" style="width:500px; height:25px; font-size:18px;">
	 				<input type="image" id="btn1" src="${pageContext.request.contextPath}/resources/iconfinder_-_Magnifier-Search-Zoom-_3844432.png" width="18" height="18">
	 			</form>	
	 		</div>
	 		<br/>	 						
	 	</c:otherwise>
	 </c:choose>
</body>
</html>
