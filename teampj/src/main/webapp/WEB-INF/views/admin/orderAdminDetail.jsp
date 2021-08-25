<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세조회(관리)</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css"> 
<link rel="stylesheet" href="/resources/css/admin/membermenu">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<style>
	td{
	 	vertical-align: middle;
	}
</style>
<body>
	<header>
		<div id="h_nav">
			<h1>MINPARKANG</h1>
			<div id="uesr_area">
				<h1>
					<!--${loginuser.userName}님-->
					관리자님
				</h1>
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
	<div id="content">
		<div id="table-warp">
			<h1>상품상세조회</h1>
			<div id="table-frame">
				<table>
					<thead>
						<tr>
							<th>상품상세주문ID</th>
							<th>상품이미지</th>
							<th>상품ID</th>
							<th>상품명</th>
							<th>상품사이즈</th>
							<th>상품색상</th>
							<th>가격</th>
							<th>주문수량</th>
							<th>총가격</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum" value="0" />
						<c:forEach items="${orderAdmin}" var="orderAdmin">
							<tr>
								<td><c:out value="${orderAdmin.orderDetailId}" /></td>
								<td><img
									src="/resources/upload/${orderAdmin.uploadPath}/${orderAdmin.uuid}_${orderAdmin.fileName}"
									width="200px" height="200px"></td>
								<td><c:out value="${orderAdmin.productId}" /></td>
								<td><c:out value="${orderAdmin.productName}" /></td>
								<td><c:out value="${orderAdmin.orderSize}" /></td>
								<td><c:out value="${orderAdmin.orderColor}" /></td>
								<td><fmt:formatNumber pattern="###,###,###"
										value="${orderAdmin.detailPrice}" />원</td>
								<td><c:out value="${orderAdmin.orderQty}" /></td>
								<td><fmt:formatNumber pattern="###,###,###"
										value="${orderAdmin.detailPrice *orderAdmin.orderQty}" />원 <input
									type="hidden" name="CartPrice"
									value="${orderAdmin.detailPrice *orderAdmin.orderQty}">
								</td>
							</tr>
							<c:set var="sum"
								value="${sum + (orderAdmin.detailPrice *orderAdmin.orderQty)}" />
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>