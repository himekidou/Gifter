<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seleniumTest</title>
<style type="text/css">
	table {
		width: 100%;
		border-top: 1px solid #444444;
		border-collapse: collapse;
	}

	th, td {
		border-bottom: 1px solid #444444;
		padding: 10px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

// 페이징 (이동)
function paging(page){

	var currentPage2 = $("#currentPage").val();
	currentPage2 = page;
	
	location.href="selePageMove?currentPage="+currentPage2;
}

// 타이틀,가격 innerHTML
$(function () {
	
	var titSize = $("#titSize").val();

	for(var i = ${navi.countPerPage * (navi.currentPage-1)}; i < ${navi.countPerPage * navi.currentPage}; i++){
		
		var temp1 = "#title" + i;
		var title = $(temp1).val();
		
		var temp2 = "#price" + i;
		var price = $(temp2).val();
		
		var temp3 = "#blank" + i;
		var temp4 = "#blanks" + i;

		$(temp3).html(title);
		$(temp4).html(price);
	}

})
</script>
</head>
<body>

<table>
	<c:forEach items="${srcs}" varStatus="sta">
	<c:set var="flag" value="false"/>
		<tr>
		<c:if test="${not flag}" >
				<c:forEach items="${srcs}" var="src" begin="${navi.countPerPage * (navi.currentPage-1)}" end="${navi.countPerPage * navi.currentPage - 1}" varStatus="status">
					<c:if test="${sta.index eq status.index}">
					
						<td>
							<img alt="shoppingPhoto" src="<c:out value="${src}"/>" width="140" height="140">
						</td>
						
						<c:set var="flag" value="true"/>
						
					</c:if>
				</c:forEach>
		</c:if>
		
		<c:set var="flag" value="false"/>
		<c:if test="${not flag}" >                            
				<c:forEach items="${title}" var="tit" 
				begin="${navi.countPerPage * (navi.currentPage-1)}" end="${navi.countPerPage * navi.currentPage - 1}" varStatus="status2">
					<c:if test="${sta.index eq status2.index}">
					
						<input type="hidden" id="title${status2.index}" value="<c:out value="${tit}"/>">
						
						<td>
							<div id="blank${status2.index}"></div>
							<p>
							<div id="blanks${status2.index}"></div>
						</td>
						
						<input type="hidden" id="titSize" value="${navi.currentPage}">
						
						<c:set var="flag" value="true"/>
						
					</c:if>
				</c:forEach>
		</c:if>
		</tr>	
	</c:forEach>
</table>

<c:forEach items="${prices}" var="price" varStatus="status3">
	<input type="hidden" id="price${status3.index}" value="<c:out value="${price}"/>">
</c:forEach>
			
	<!-- 페이징 처리 -->
	<a href="javascript:paging('${navi.countPerPage - navi.pagePerGroup}')">◁◁</a>
	<a href="javascript:paging('${navi.countPerPage - 1}')">◀</a>
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<a href="javascript:paging('${counter}')">${counter}</a>
		</c:forEach>
	<a href="javascript:paging('${navi.countPerPage + 1}')">▶</a>
	<a href="javascript:paging('${navi.countPerPage + navi.pagePerGroup}')">▷▷</a>

	<input type="hidden" name="currentPage" id="currentPage">
	
</body>
</html>