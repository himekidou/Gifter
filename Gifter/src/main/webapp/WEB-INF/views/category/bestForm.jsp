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
				var str = "<input type='submit' id='ctList2' value='next'>"
				//버튼 만들기
				$("#last").append(str); //				
			}				
		});

	});
</script>
</head>
<body>
	<c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		<a href="<c:url value="/"/>">home</a>
	 		&nbsp;
	 		<a href="member/logout">logout</a>
			&nbsp;
			<a href="member/myPage">My Page</a>
			&nbsp;
	 		<a href="category/bestForm">best</a>
			&nbsp;
	 		<br/> 
	 		<br/> 					
	 		<br/>
	 	</c:when>
	 	<c:otherwise>
	 		<a href="<c:url value="/"/>">home</a>
	 		&nbsp;
	 		<a href="member/signupForm">sign up</a>
			&nbsp;
			<a href="member/loginForm">login</a>
			&nbsp;
			<a href="category/bestForm">best</a>
			&nbsp;
			<a href="category/viewCategory">viewCategory</a>
			&nbsp;		
			<br/>	
	 		<br/>	 						
	 	</c:otherwise>
	 </c:choose>

	<form action="categoryList" method="post" id="ctForm" onsubmit="return formCheck();">
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
						<option value="not">Choose The Age of The Recipient.</option>
						<option value="10">0 ~ 9</option>
						<option value="20">10 ~ 19</option>
						<option value="30">20 ~ 29</option>
						<option value="40">30 ~ 39</option>
					</select>			
				</td>
				<td>
				</td>
				<td>
					<select name="age_range" id="age_range" required="required">
						<option value="not">Choose An Age Group.</option>
						<option value="10">Early</option>
						<option value="5">Late</option>
					</select>			
				</td>
				<td>
				</td>
				<td >
					<select name="gender" id="gender" required="required">					
						<option value="not">Please Choose Your Gender.</option>
						<option value="0">Male</option>
						<option value="1">Female</option>
					</select>	
				</td>
				<td id="last">
				</td>
			</tr>		
		</table>
	</form>
	<div id="">
		
	</div>
	<br/>
	<br/>
	<a href="<c:url value="/"/>"><input type="button" value="메인 페이지로 이동"></a></body>
</body>
</html>