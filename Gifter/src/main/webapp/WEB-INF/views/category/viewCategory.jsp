<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>seleniumTest</title>

<!-- <style type="text/css">
	table {
		width: 100%;
		border-top: 1px solid #444444;
		border-collapse: collapse;
	}

	th, td {
		border-bottom: 1px solid #444444;
		padding: 10px;
	}
</style> -->

<script type="text/javascript">

// 페이징 (이동)
function paging(page){

	var currentPage2 = $("#currentPage").val();
	currentPage2 = page;
	
	location.href="selePageMove?currentPage="+currentPage2;
}

// 타이틀,가격 innerHTML
$(function () {

	alert("test");
	
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

<div class="d-flex justify-content-between">
	<ul class="list-group">
	  <li class="list-group-item d-flex justify-content-between align-items-center">
	    <a href="recommendList">오늘의 상품추천</a><br>
	    <span class="badge badge-primary badge-pill">3</span>
	  </li>
	</ul>
</div>
<P>
<table class="table table-sm" width=100 style="table-layout: fixed">
	<c:forEach items="${srcs}" varStatus="sta">
	<c:set var="flag" value="false"/>
		<tr>
		<c:if test="${not flag}" >
				<c:forEach items="${srcs}" var="src" begin="${navi.countPerPage * (navi.currentPage-1)}" end="${navi.countPerPage * navi.currentPage - 1}" varStatus="status">
					<c:if test="${sta.index eq status.index}">
					
						<td class="align-middle">
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
						
						<td class="align-middle" >
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
<nav aria-label="Page navigation example">
 <div class="text-center">
 <ul class="pagination justify-content-center">
 
<%--<li class="page-item">
	<a class="page-link" href="javascript:paging('${navi.countPerPage - navi.pagePerGroup}')" aria-label="Previous">
	<span aria-hidden="true"></span>
	</a>
	</li> --%>
	
	<li class="page-item">
	<a class="page-link" href="javascript:paging('${navi.currentPage - 1}')" aria-label="Previous">
	<span aria-hidden="true">&laquo;</span>
	</a>
	</li>
	
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:choose>
				<c:when test="${counter eq navi.currentPage}">
					<li class="page-item active" aria-current="page">
      					<a class="page-link" href="javascript:paging('${counter}')">${counter}<span class="sr-only">(current)</span></a>
    				</li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="javascript:paging('${counter}')">${counter}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
	<li class="page-item">	
	<a class="page-link" href="javascript:paging('${navi.currentPage + 1}')" aria-label="Previous">
	<span aria-hidden="true">&raquo;</span>
	</a>
	</li>
	
<%--<li class="page-item">
	<a class="page-link" href="javascript:paging('${navi.countPerPage + navi.pagePerGroup}')" aria-label="Previous">
	<span aria-hidden="true">&raquo;</span>
	</a>
	</li> --%>
	
  </ul>
  </div>
</nav>

	<input type="hidden" name="currentPage" id="currentPage">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
</body>
</html>