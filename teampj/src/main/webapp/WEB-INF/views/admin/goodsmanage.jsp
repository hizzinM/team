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
			<table class="goods_table">
				<thead>
					<tr>
						<th class="form_section">ID</th>
						<th class="form_section">상품이미지</th>
						<th class="form_section">상품명</th>
						<th class="form_section">가격</th>
						<th class="form_section">사이즈</th>
						<th class="form_section">색깔</th>
						<th class="form_section">재고</th>
					</tr>
				</thead>
				
				<c:if test="${productList.productId == ${list.productId}">
	                    	<table class="goods_table">
	                    		<thead>
	                    			<tr>
										<td class="th_column_1">상품 번호</td>
	                    				<td class="th_column_2">상품 이름</td>
	                    				<td class="th_column_3">작가 이름</td>
	                    				<td class="th_column_4">카테고리</td>
	                    				<td class="th_column_5">재고</td>
	                    				<td class="th_column_6">등록날짜</td>
	                    			</tr>
	                    		</thead>	
	                    		<c:forEach items="${productList}" var="product">
	                    		<tr>
	                    			<td><c:out value="${product.productId}"></c:out></td>
	                    			<td><img src="/resources/upload/${list.uploadPath}//${list.uuid}_${list.fileName}" width="300px"></td>
	                    			<td><c:out value="${product.productName}"></c:out></td>
	                    			<td><c:out value="${product.productSize}"></c:out></td>
	                    			<td><c:out value="${product.productColor}"></c:out></td>
	                    			<td><c:out value="${product.productInventory}"></c:out></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    </c:if>
			</table>


		</div>
	</section>

</body>
</html>