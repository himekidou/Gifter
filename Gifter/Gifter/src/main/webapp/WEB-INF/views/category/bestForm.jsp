<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>best</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script>
	$(function(){
		
		$("#ctList").click(function(){
		
		var age = $('select[name=age]').val();
		var age_range = $('select[name=age_range]').val();
		var gender = $('select[name=gender]').val();
	
		if(age == null || age == ""){
			alert("나이를 선택해주세요");
			return false;
		}
		if(age_range == null || age_range == ""){
			alert("나이대를 선택해주세요");
			return false;
		}
		if(gender == null || gender == ""){
			alert("성별을 선택해주세요");
			return false;
		}
		return true;
		
		});	
	});

</script>
</head>
<body>
	<form action="categoryList" method="post" onsubmit="return formCheck();">
		<table id="ctTable">
			<tr>
				<th>AGE</th>
				<th></th>
				<th>AGE RANGE</th>
				<th></th>
				<th>GENDER</th>
				<th></th>
			</tr>
			<tr>
				<td>
					<select name="age" id="age" required="required">
						<option>Choose The Age of The Recipient.</option>
						<option value="10">1 ~ 10</option>
						<option value="20">11 ~ 20</option>
						<option value="30">21 ~ 30</option>
						<option value="40">31 ~ 40</option>
					</select>			
				</td>
				<td>
				<td>
					<select name="age_range" id="age_range" required="required">
						<option>Choose An Age Group</option>
						<option value="0">Early</option>
						<option value="5">Late</option>
					</select>			
				</td>
				<td>
				</td>
				<td>
					<select name="gender" id="gender" required="required">					
						<option>Please Choose Your Gender</option>
						<option value="0">Male</option>
						<option value="1">Female</option>
					</select>	
				</td>
				<td>
					<input type="submit" id="ctList" value="next">
				</td>
			</tr>		
		</table>
	</form>
</body>
</html>