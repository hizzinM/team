<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>minparkang</title>
	<link rel="stylesheet" href="/resources/css/common-style/reset.css">
	<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
	<link rel="stylesheet" href="/resources/css/common-style/contents.css">
	<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="include_collection/navigation.jsp"%>
	</div>
	
	<div id="contents">
        <div id="slide-warp">
            <div id="slide-frame-1">
                <h1>BEST SELLER</h1>
                <ul class="side-img show-img">
					<li><img src="/resources/img/20210625_PC1.jpg" alt=""></li>
					<li><img src="/resources/img/20210625_PC2.jpg" alt=""></li>
					<li><img src="/resources/img/20210630_PC1.jpg" alt=""></li>
                </ul>
            </div>
            <div id="slide-frame-2">
                <h1>NEW ARRIVALS & RESTOCK</h1>
                <ul class="slide-img">
					<li><img src="/resources/img/slide-img_01.jpg" alt=""></li>
					<li><img src="/resources/img/slide-img_02.jpg" alt=""></li>
					<li><img src="/resources/img/slide-img_03.jpg" alt=""></li>
					<li><img src="/resources/img/slide-img_04.jpg" alt=""></li>
					<li><img src="/resources/img/slide-img_05.jpg" alt=""></li>
					<li><img src="/resources/img/slide-img_06.jpg" alt=""></li>
					<li><img src="/resources/img/slide-img_07.jpg" alt=""></li>
					<li><img src="/resources/img/slide-img_08.jpg" alt=""></li>
                </ul>
            </div>
        </div>
		<div id="product-warp">
			<div id="product_column">
				<c:forEach items="${MainProduct}" var="Product" end="7">
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
		<%@ include file="include_collection/footer.jsp"%>
    </div>
	
</body>
</html>