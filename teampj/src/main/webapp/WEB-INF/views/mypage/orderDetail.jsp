<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>minparkang</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/mypage/orderlist.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>

	<div id="contents">
		<h1>주문상세정보</h1>
		<div class="table-frame" style="margin-bottom:345px;">
			<c:forEach items="${orderView}" var="order" end="0">
				<h2>주문번호:${order.orderId}</h2>
			</c:forEach>
			<table class="order-wrap">
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
				<c:set var="sum" value="0" />
				<c:forEach items="${orderView}" var="orderView">
					<tbody>
						<tr>
							<td><c:out value="${orderView.orderDetailId}" /></td>


							<td><img
								src="/resources/upload/${orderView.uploadPath}/${orderView.uuid}_${orderView.fileName}"
								width="200px" height="200px"
								onerror="this.src='/resources/img/noimg.jpg'"></td>

							<td><c:out value="${orderView.productId}" /></td>

							<td><c:out value="${orderView.productName}" /></td>

							<td><c:out value="${orderView.orderSize}" /></td>

							<td><c:out value="${orderView.orderColor}" /></td>

							<td><fmt:formatNumber pattern="###,###,###"
									value="${orderView.detailPrice}" />원</td>

							<td><c:out value="${orderView.orderQty}" /></td>

							<td><fmt:formatNumber pattern="###,###,###"
									value="${orderView.detailPrice *orderView.orderQty}" />원 <input
								type="hidden" name="CartPrice"
								value="${orderView.detailPrice *orderView.orderQty}"></td>
						</tr>
					</tbody>
					<c:set var="sum"
						value="${sum + (orderView.detailPrice *orderView.orderQty)}" />
				</c:forEach>
			</table>
			<div class="btn-box"></div>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>
