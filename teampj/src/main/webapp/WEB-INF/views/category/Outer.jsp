<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>minparkang</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/main.css">
<style type="text/css">
.Outerproduct-list {
	width: 1600px;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: space-around;
	flex: 200px;
	flex-wrap: wrap;
}
</style>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div class="product-list">
			<c:forEach items="${OuterProduct}" var="Product">
				<ul>
					<li><a href="/detail?productId=${Product.productId}"><img
							src="/resources/upload/${Product.uploadPath}/${Product.uuid}_${Product.fileName}" /></a>
						<a href="/detail?productId=${Product.productId}"><h1>상품명</h1>
							<c:out value="${Product.productName}" /></a>
						<hr>
						<p>
							상품 가격 KRW:
							<c:out value="${Product.productPrice}" />
						</p>
						<p>리뷰 개수</p></li>
				</ul>
			</c:forEach>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>