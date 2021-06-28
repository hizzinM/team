<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="/resources/css/admin/index.css">
<meta charset="UTF-8">
<title>회원관리</title>
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
				<table id=table2 border=1>
					<tr>
						<td>회원명</td>
						<td>ID</td>
						<td>연락처</td>
						<td>이메일</td>
						<td>주소</td>
						<td>가입날짜</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</section>
	</section>
</body>
</html>
