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
<title>공지관리</title>
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
		
		<div id="container_box" align="center">
		<div>&nbsp;</div>
		<h2>상품관리</h2>
		</div>
		<div align="center">
				<table>
					<thead>
						<tr>
							<th class="username_width">ID</th>
							<th class="userid_width">상품이미지</th>
							<th class="userphone_width">상품명</th>
							<th class="useremail_width">가격</th>
							<th class="useraddress_width">사이즈</th>
							<th class="useregdate_width">색깔</th>
							<th class="useregdate_width">재고</th>
						</tr>
				</thead>
				<c:forEach items="${productList}" var="product">
					<c:forEach items="${list}" var="list">
						
				<tr>
					<td><c:out value="${product.productId}"/></td>
					
					<td><img src="/upload/${list.uploadPath}/${list.uuid}/${list.fileName}" width="300px"></td>
				
					<td><c:out value="${product.productName}"/></td>
					<td><c:out value="${product.productPrice}"/></td>
					<td><c:out value="${product.productSize}"/></td>
					<td><c:out value="${product.productColor}"/></td>
					<td><c:out value="${product.productInventory}"/></td>
					
				</tr>
						
				</c:forEach>
			</c:forEach>
		</table>
			
			
		</div>
	</section>

</body>
</html>