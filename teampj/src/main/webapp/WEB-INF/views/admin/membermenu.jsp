<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/admin/index.css">
<meta charset="UTF-8">
<title>회원관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
td, th {
	border: 1px solid black;
	height: 50px;
}

th {
	font-size: 17px;
}
</style>
</head>
<body>
	<div class="top_gnb_area">
		<ul class="list">
			<li><a href="/main">메인 페이지</a></li>
			<li><a href="/member/logout.do">로그아웃</a></li>
		</ul>
	</div>
	<section id="container">
		<aside>
			<%@ include file="include/aside.jsp"%>
		</aside>
		<div id="container_box">회원관리</div>

		<section id=content>
			<div>&nbsp;</div>
			<div id=title align="center">
				<h2>회원관리</h2>
			</div>
			<div align="center">
				<table>
					<thead>
						<tr>
							<th class="username_width">회원명</th>
							<th class="userid_width">ID</th>
							<th class="userphone_width">연락처</th>
							<th class="useremail_width">이메일</th>
							<th class="useraddress_width">주소</th>
						</tr>
					</thead>
					<c:forEach items="${membermenu}" var="membermenu">
						<tr>
							<td><c:out value="${membermenu.userName}" /></td>
							<td><c:out value="${membermenu.userId}" /></td>
							<td><c:out value="${membermenu.phone}" /></td>
							<td><c:out value="${membermenu.email}" /></td>
							<td><c:out value="${membermenu.addressNum}" />&nbsp;<c:out
									value="${membermenu.address}" />&nbsp;<c:out
									value="${membermenu.addressDetail}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</section>
</body>
</html>
