<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/admin/index.css">
<meta charset="UTF-8">
<title>문의관리</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/admin_frame.css">
</head>
<body>
	<header>
		<div id="h_nav">
			<h1>MINPARKANG</h1>
			<div id="uesr_area">
				<h1><!--${loginuser.userName}님--> 관리자님</h1>
				<h1>어서오세요</h1>
			</div>
			<ul>
				<li><a href="/main" class="btn-style">MAIN</a></li>
				<li><a href="/member/logout.do" class="btn-style">LOGOUT</a></li>
			</ul>
		</div>
		<nav>
			<%@ include file="include/aside.jsp"%>
		</nav>
	</header>
	<section id="container">
		<div id="container_box">문의관리</div>
	</section>

</body>
</html>