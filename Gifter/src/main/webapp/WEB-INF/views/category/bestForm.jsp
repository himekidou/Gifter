<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Best</title>	
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script>	
	$(function(){			
		$("#age, #age_range, #gender").mouseup(function(){
			var age = $('select[name=age]').val();
			var age_range = $('select[name=age_range]').val();
			var gender = $('select[name=gender]').val();
			
			if(age != "not" && age_range != "not" && gender != "not"){		
				if($("#ctList2").length == 1){
					return false;
				}
				var str = "<input type='submit' id='ctList2' class='btn btn-secondary pull-right' value='next >' onclick='return formCheck();'>"
				//버튼 만들기
				$("#last").append(str); //				
			}		
				
		});
	});

	function formCheck(){	
		var age = $('select[name=age]').val();
		var age_range = $('select[name=age_range]').val();
		var gender = $('select[name=gender]').val();

		if(age == 'not' || age_range == 'not' || gender == 'not'){
			alert("3개 모두 선택해주세요.");
			return false;
		}
		return true;
	}
</script>
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
     				 	<a class="nav-link text-body" href="/member/myPage">My Page</a>
    				</li>
    				
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/logout">Logout</a>
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
      					<a class="nav-link text-body" href="<c:url value="/"/>">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm">Sign Up</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm">Login</a>
    				</li>
    				
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory">viewCategory</a>
    				</li>
  				</ul>	
			</div>	
			<br/>	
	 		<br/>	 						
	 	</c:otherwise>
	 </c:choose>
	
	<br/><br/><br/><br/>
	<div class="d-flex justify-content-center container border border-dark align-self-center align-items-center mx-auto m-5 pb-5"  style="width:800px; height:220px; background-color: white;  border-radius: 10px;">		
	<form action="categoryList" method="post" id="ctForm" >
		<table id="ctTable">
			<tr>
				<th style="color: black;">AGE</th>
				<th></th>
				<th style="color: black;">AGE RANGE</th>
				<th></th>
				<th style="color: black;">GENDER</th>
				<th></th>
			</tr>
			<tr>
				<td>
					<select name="age" id="age" required="required" style="color: black;">
						<option value="not" style="color: black;">Choose The Age of The Recipient</option>
						<option value="10" style="color: black;">0 ~ 9</option>
						<option value="20" style="color: black;">10 ~ 19</option>
						<option value="30" style="color: black;">20 ~ 29</option>
						<option value="40" style="color: black;">30 ~ 39</option>
					</select>	
					&emsp;		
				</td>
				<td>
				</td>
				<td>
					<select name="age_range" id="age_range" required="required" style="color: black;">
						<option value="not" style="color: black;">Choose An Age Group</option>
						<option value="10" style="color: black;">Early</option>
						<option value="5" style="color: black;">Late</option>
					</select>
					&emsp;			
				</td>
				<td>
				</td>
				<td >
					<select name="gender" id="gender" required="required" style="color: black;">					
						<option value="not" style="color: black;">Please Choose Your Gender</option>
						<option value="0" style="color: black;">Male</option>
						<option value="1" style="color: black;">Female</option>
					</select>	
					&emsp;
				</td>
				<td>
				</td>		
		</table>
		<br/>	
		<div id="last" align="right">
		
		</div>
	</form>
	</div>
      </div>
      <div class="box3">
      
      </div>
    </div>
</body>
</html>