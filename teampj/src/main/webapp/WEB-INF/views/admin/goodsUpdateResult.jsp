<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정결과</title>
<link rel="stylesheet" href="/resources/css/admin/index.css">
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
		<aside>
			<%@ include file="include/aside.jsp"%>
		</aside>
	<section id="container">
	<div id="container_box" align="center">
			<div>&nbsp;</div>
			<h2>상품수정결과</h2>
		</div>
		<div align="center">
			<table>
				<thead>
					<tr>
						<th class="username_width">ID</th>
						<th class="userid_width">상품이미지</th>
						<th class="userphone_width">상품명</th>
						<th class="useremail_width">가격</th>
						<th class="useremail_width">카테고리</th>
						<th class="useraddress_width">사이즈</th>
						<th class="useregdate_width">색깔</th>
						<th class="useregdate_width">재고</th>
						
					</tr>
				</thead>
				<tr>
					<td>${resultProduct.productId}</td>
					<td><img src="/resources/upload/${resultProduct.uploadPath}/${resultProduct.uuid}_${resultProduct.fileName}" width="200px" height="200px"></td>
					<td>${resultProduct.productName}</td>
					<td>${resultProduct.productPrice}</td>
					<td>${resultProduct.productCategory}</td>
					<td>${resultProduct.productSize}</td>
					<td>${resultProduct.productColor}</td>
					<td>${resultProduct.productInventory}</td>
				</tr>
				
			</table>
			
		</form>
	</div>
	
</body>
</html>