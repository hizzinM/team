<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<h2>MY PAGE</h2>
			<h1>${loginuser.userName}님</h1>
			<table class="mypage_table">
				<thead class="mypage_thead">
					<tr>
						<td colspan="5">나의 주문 처리 현황</td>
					</tr>
				</thead>
				<tbody class="mypage_mid">
					<tr>
						<td>
							<p>입금전</p>
							<p>0</p>
						</td>
						<td>
							<p>배송준비중</p>
							<p>0</p>
						</td>
						<td>
							<p>배송중</p>
							<p>0</p>
						</td>
						<td>
							<p>배송완료</p>
							<p>0</p>
						</td>
						<td>
							<p>
								취소<span>0</span>
							</p>
							<p>
								교환<span>0</span>
							</p>
							<p>
								반품<span>0</span>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="mypage-btn_frame">
				<ul>
					<li>
						<div>
							<a href="/member/">
								<p>ORDER TRACKING</p>
								<p>주문내역조회</p>
							</a>
						</div>
					</li>
					<li>
						<div>
							<a href="/mypage/profile?userId=${loginuser.userId}">
								<p>PROFILE</p>
								<p>회원정보</p>
							</a>
						</div>
					</li>
					<li>
						<div>
							<a href="/member/">
								<p>ADDRESS</p>
								<p>배송 주소록 관리</p>
							</a>
						</div>
					</li>
					<li>
						<div>
							<a href="/member/">
								<p>WISHLIST</p>
								<p>관심상품</p>
							</a>
						</div>
					</li>
					<li>
						<div>
							<a href="/member/">
								<p>BOARD</p>
								<p>게시물관리</p>
							</a>
						</div>
					</li>
				</ul>
			</div>

		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>
