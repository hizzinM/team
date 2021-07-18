<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/mypage/myindex.css">
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
		<div class="table-frame">
			<h2>ORDER LIST</h2>
			<c:forEach items="${orderList}" var="orderList">
			<table>
				<tr>
					<td>주문번호</td>
					<td><a href="/mypage/orderDetail?n=${orderList.orderId}"><c:out value="${orderList.orderId}"></c:out></a></td>
				</tr>
				<tr>
					<td>수령인아이디</td>
					<td><c:out value="${orderList.userId}"></c:out></td>
				</tr>
				<tr>
					<td>수령인</td>
					<td><c:out value="${orderList.userName}"></c:out></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td><c:out value="${orderList.orderPhone}"></c:out></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><c:out value="${orderList.orderAddressNum}"></c:out></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><c:out value="${orderList.orderAddress}"></c:out></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><c:out value="${orderList.orderAddressDetail}"></c:out></td>
				</tr>
				<tr>
					<td>총가격</td>
					<td><c:out value="${orderList.orderPrice}"></c:out></td>
				</tr>
				<tr>
					<td>주문날짜</td>
					<td><c:out value="${orderList.orderDate}"></c:out></td>
				</tr>
			</table>
			</c:forEach>
			<div>
				
		</div>

		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>
