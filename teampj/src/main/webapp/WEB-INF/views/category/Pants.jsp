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
		<div id="product-warp">
			<div id="product_column">
				<c:forEach items="${PantsProduct}" var="Product" end="7">
					<div class="product_unit">
						<a href="/detail?productId=${Product.productId}"> <img
							class="puoduct_img"
							src="/resources/upload/${Product.uploadPath}/${Product.uuid}_${Product.fileName}"
							alt="" onerror="this.src='/resources/img/noimg.jpg'">
						</a>
						<ul>
							<li><a href="/detail?productId=${Product.productId}"><c:out
										value="${Product.productName}" /></a></li>
							<hr>
							<li><c:out value="KRW ${Product.productPrice}" /></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>