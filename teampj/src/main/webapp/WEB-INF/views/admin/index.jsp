<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<style>
.indexorder {
	position: absolute;
	width: 71%;
}

.indexuser {
	position: absolute;
	width: 71%;
	top: 350px;
}
</style>
<body>
	<header>
		<div id="h_nav">
			<h1>MINPARKANG</h1>
			<div id="uesr_area">
				<h1>관리자님</h1>
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
		<div id="table-wrap">
			<table class="indexorder">
				<thead>
					<tr>
						<th colspan="9">최신주문</th>
					</tr>
					<tr>
						<th>주문번호</th>
						<th>주문자 ID</>
						<th>수령인 이름</th>
						<th>수령인 전화번호</th>
						<th>수령인 주소</th>
						<th>상세주소</th>
						<th>우편번호</th>
						<th>주문가격</th>
						<th>주문시간</th>
					</tr>
				</thead>
				<c:forEach items="${mainorder}" var="mainorder">
					<tr>
						<td><a href="/admin/orderAdminDetail?n=${mainorder.orderId}">
								<c:out value="${mainorder.orderId}" />
						</a></td>
						<td><c:out value="${mainorder.userId}" /></td>
						<td><c:out value="${mainorder.userName}" /></td>
						<td><c:out value="${mainorder.orderPhone}" /></td>
						<td><c:out value="${mainorder.orderAddress}" /></td>
						<td><c:out value="${mainorder.orderAddressDetail}" /></td>
						<td><c:out value="${mainorder.orderAddressNum}" /></td>
						<td><c:out value="${mainorder.orderPrice}" /></td>
						<td><c:out value="${mainorder.orderDate}" /></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<table class="indexuser">
				<thead>
					<tr>
						<th colspan="7">신규회원</th>
					</tr>
					<tr>
						<th>회원명</th>
						<th>ID</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>주소</th>
						<th>가입일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mainUser}" var="mainUser">
						<tr>
							<td><c:out value="${mainUser.userName}" /></td>
							<td><a
								href="/admin/AdminMemberUpdate?userId=${mainUser.userId}"><c:out
										value="${mainUser.userId}"></c:out> </a></td>
							<td><c:out value="${mainUser.phone}" /></td>
							<td><c:out value="${mainUser.email}" /></td>
							<td style="width: 450px;"><c:out
									value="${mainUser.addressNum}" />&nbsp; <c:out
									value="${mainUser.address}" />&nbsp; <c:out
									value="${mainUser.addressDetail}" /></td>
							<td><fmt:formatDate value="${mainUser.regDate}"
									pattern="yyyy년MM월dd일 HH시mm분" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>