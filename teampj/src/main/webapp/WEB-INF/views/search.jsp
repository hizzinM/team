<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>minparkang</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/search.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div class="search_frame">
			<div id="search-box">
				<input type="text" name="keyword" id="search_frame" class="keyword-input-frame" value="${pageMaker.cri.keyword }">
				<button type="button" id="search-btn" class="button_style">검색</button>
			</div>
			<div class="select_box">
				<span>카테고리</span> <select name="type"
					class="button_style select-input-frame">
					<option value="" selected="selected"
						<c:out value="${pageMaker.cri.type == null?'selected':''}" />>상품분류선택</option>
					<option value="A"
						<c:out value="${pageMaker.cri.type eq A?'selected':'' }" />>Outer</option>
					<option value="B"
						<c:out value="${pageMaker.cri.type eq 'B'?'selected':'' }" />>Top</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }" />>Shirts</option>
					<option value="D"
						<c:out value="${pageMaker.cri.type eq 'D'?'selected':'' }" />>Pants</option>
					<option value="E"
						<c:out value="${pageMaker.cri.type eq 'E'?'selected':'' }" />>Suit</option>
					<option value="F"
						<c:out value="${pageMaker.cri.type eq 'F'?'selected':'' }" />>Bag/Shoes</option>
					<option value="G"
						<c:out value="${pageMaker.cri.type eq 'G'?'selected':'' }" />>Acc</option>
				</select>
			</div>
			<div class="price_box">
				<span>가격</span> <input id="product_price1" name="product_price1"
					class="button_style price-input-frame" placeholder="" size="15"
					value="" type="text"> <span>~</span> <input
					id="product_price2" name="product_price2"
					class="button_style price-input-frame" placeholder="" size="15"
					value="" type="text">
			</div>
		</div>
		<div class="result-frame">
			<p>
				총
				<c:out value="${pageMaker.total}" />
				개의 상품이 검색되었습니다.
			</p>
			<button class="result-btn">상품명순</button>
			<button class="result-btn">낮은가격 순</button>
			<button class="result-btn">높은가격 순</button>
		</div>
		<div class="product_frame">
			<c:if test="${listcheck != 'empty'}">
				<div id="product_column">
					<div class="product_unit">
						<c:forEach items="${searchlist}" var="searchresult">
							<a href=""> <img src="/resources/upload/${searchresult.uploadPath}/${searchresult.uuid}_${searchresult.fileName}" alt="" onerror="this.src='/resources/img/noimg.jpg'">
							</a>
							<ul>
								<li><a href=""> 상품명: <c:out
											value="${searchresult.productName}" />
								</a></li>
								<hr>
								<li>상품 가격: KRW <c:out value="${searchresult.productPrice}" />
								</li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<!-- <c:if test="${listCheck == 'empty'}">
                <div class="table_empty">등록된 상품이 없습니다.</div>
            </c:if> -->
		</div>

		<div class="pageInfo_frame">
			<ul class="pageInfo">
				<!-- 이전페이지 버튼-->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a
						href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>

				<!-- 페이지 번호 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a
						href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
		<%@ include file="include_collection/footer.jsp"%>
	</div>
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
	</form>

	<script>
		$(".search_frame button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_frame select").val();
			let keyword = $(".search_frame input[name='keyword']").val();

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}
			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='amount']").val(10);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
</body>
</html>