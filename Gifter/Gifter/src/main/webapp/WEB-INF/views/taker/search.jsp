<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<style>
  table, th, td {
    border: 1px solid #bcbcbc;
  }
  table {
    width: 300px;
    height: 200px;
  }
  th {
    width: 50px;
    height: 50px;
  }
</style>
<script>
	$(function() {
		$("#btn1").click(function(){
			var str = '';
			str += "<form><table border='1'>";
			str += "<tr><th>4위</th>";
			str += "<th>5위</th>";
			str += "<th>6위</th></tr>";
			str += "<tr><td>음료수</td>";
			str += "<td>과자</td>";
			str += "<td>과일</td></tr>";
			str += "</table></form>";
			$("#first").append(str);
			$("#btn1").fadeOut();
		});
		
	})
</script>
</head>
<body>
	여기는 검색 결과인 카테고리별 순위 10개에 대한 정보를 보여주는 곳입니다.<br/>
	${member_id}님이 검색한 인스타그램 ID는 ${taker_insta}입니다.<br/>
	<br/>
	<form id="first">
		<table border="1">
			<tr>
				<th>1위</th>			
				<th>2위</th>			
				<th>3위</th>			
			</tr>	
			<tr>
				<td>화장품</td>
				<td>스마트폰</td>
				<td>옷</td>
			</tr>	
		</table>
	</form>
	<input type="button" id="btn1" value="더보기"><br/><br/>
	<a href="<c:url value="/"/>"><input type="button" id="btn2" value="메인 이동"></a>
</body>
</html>