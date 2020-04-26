<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>recommendList</title>

<style type="text/css">
* {
  	color: 	#955050;
  	font-weight: bold;
  	margin: 0;
  	padding: 0;
}

body {
	background-color:	#ff8080;
}

table {
	/* background: #53cec2; */
	background : #ffcec2;
	table-layout:fixed; 
	margin-left:auto;
	margin-right:auto;
}

.ths {
	width:180px;
	scope:row;
}

.table td, .table th {
    padding: .75rem;
    vertical-align: top;
    border-top: 10px solid #ff8080;
}

a {
	color : #ff8080;
}

a:hover {
	text-decoration: none;
	color: #ff4d4d;
}

.pagination a {
  	color : #ff8080;
  	border-radius: 5px;
}

.pagination a.active {
  	color : red;
  	border-radius: 5px;
}

.page-item.active .page-link {
    color: #fff;
    background-color: pink;
    border-color: #ff8080;
}

.pagination a:hover {
	background-color: #cfafaf;
	color : #ff4d4d;
}

.pagination a:focus {
	background-color: pink;
}

/* body {margin:0;}
 #wrap {margin:0 auto;text-align:center;}
 #quick_bg {margin:0 auto;text-align:center;width:1130px;position:relative;}
 #quick {position:absolute;z-index:2;top:15px;width:153px;right:0px;}
 #container {position:relative;} */
 
</style>
</head>
<body>

<!-- <div id="wrap">
	<div id="container">
		<div id="quick_bg">
			<div id="quick">
				<a href="#form">test중</a>
			</div>
		</div>
	</div>
</div> -->

	<!-- 배너 -->
	<div class="bg-secondary"> 
		<div class="container">
			<ul class="nav justify-content-end">
				<li class="nav-item">
      				<a class="nav-link text-body" href="<c:url value="/"/>" style="color:white; font-size: 1.0416666666666667vw;">Home</a>
    			</li>
    			<li class="nav-item">
     			 	<a class="nav-link text-body" href="/member/myPage" style="color:white; padding-right: 0; font-size: 1.0416666666666667vw;">My Page</a>
    			</li>
			</ul>	
		</div>	
	</div>

<p>
<h2 class="text-center">Today's Recommendation!</h2>
<p>
<div class="container">
<table class="table table-hover" style="width:750px;">
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc1}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit1} <br>
			${recompri1}
		</td>
		<td class="col-2"></td>
	</tr>
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc2}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit2} <br>
			${recompri2}
		</td>
		<td class="col-2"></td>
	</tr>
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc3}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit3} <br>
			${recompri3}
		</td>
		<td class="col-2"></td>
	</tr>
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc4}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit4} <br>
			${recompri4}
		</td>
		<td class="col-2"></td>
	</tr>
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc5}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit5} <br>
			${recompri5}
		</td>
		<td class="col-2"></td>
	</tr>
</table>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- <script type="text/javascript">
var quick_menu = $('#quick');
var quick_top = 470;

quick_menu.css('top', $(window).height() );
$(document).ready(function(){
quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 200 ); 
$(window).scroll(function(){
quick_menu.stop();
quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 );
});
});
</script> -->

</body>
</html>