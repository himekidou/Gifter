<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>best</title>
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
				var str = "<input type='submit' id='ctList2' class='btn btn-secondary' value='next >' onclick='return formCheck();'>"
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
	
	<div class="d-flex justify-content-center align-items-center " style="height:300px">		
	<form action="categoryList" method="post" id="ctForm">
		<table id="ctTable">
			<tr>
				<th>AGE</th>
				<th></th>
				<th>AGE RANGE</th>
				<th></th>
				<th>GENDER</th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<td>
					<select name="age" id="age" required="required">
						<option value="not">Choose The Age of The Recipient</option>
						<option value="10">0 ~ 9</option>
						<option value="20">10 ~ 19</option>
						<option value="30">20 ~ 29</option>
						<option value="40">30 ~ 39</option>
					</select>	
					&emsp;		
				</td>
				<td>
				</td>
				<td>
					<select name="age_range" id="age_range" required="required">
						<option value="not">Choose An Age Group</option>
						<option value="10">Early</option>
						<option value="5">Late</option>
					</select>
					&emsp;			
				</td>
				<td>
				</td>
				<td >
					<select name="gender" id="gender" required="required">					
						<option value="not">Please Choose Your Gender</option>
						<option value="0">Male</option>
						<option value="1">Female</option>
					</select>	
					&emsp;
				</td>
				<td id="last">
				</td>
			</tr>		
		</table>
	</form>
	<br/>
	<br/>
	</div>
</body>
</html>