<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>admin 페이지</title>
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
			<ul>
				<li><a href="/admin/membermenu">회원 관리</a></li>
				<li><a href="/admin/ordermenu">주문 관리</a></li>
				<li><a href="/admin/goodsmenu">상품 등록</a></li>
				<li><a href="/admin/goodsmanage">상품 관리</a></li>
				<li><a href="/admin/qnamenu">문의 관리</a></li>
				<li><a href="/admin/noticemenu">공지 관리</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>