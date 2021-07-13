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
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}

.pageInfo_wrap {
	text-align: center;
}

.search_wrap {
	text-align: center;
}

.search_area {
	display: inline-block;
	margin-top: 30px;
	margin-left: 260px;
}

.search_area input {
	height: 30px;
	width: 250px;
}

.search_area button {
	width: 100px;
	height: 36px;
}
</style>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<h1>
			<a href="/main">MINPARKANG</a>
		</h1>
		<div id="s_nav">
			<ul>
				<!-- 로그인 전 -->
				<c:if test="${loginuser == null }">
					<li><a href="/member/login">로그인</a></li>
					<li><a href="/member/join">회원가입</a></li>
					<br>
				</c:if>

				<!-- 로그인 후 -->
				<c:if test="${ loginuser!= null }">
					<li style="font-weight: bold; font-size: 11px;">${loginuser.userName}님
						어서오세요.</li>
					<br>
					<br>
					<li><a href="/member/logout">로그아웃</a></li>
					<li><a href="/mypage/myindex">마이페이지</a></li>
					<c:if test="${ loginuser.adminck ==1 }">
						<li><a href="/admin/index">관리자화면</a></li>
					</c:if>
				</c:if>
				<br>
				<li><a href="#">배송조회</a></li>
				<li><a href="#">장바구니</a></li>
				<li><a href="#">리뷰</a></li>
				<li><a href="#">고객센터</a></li>
				<br>
			</ul>
		</div>
		<div id="s_category">
			<ul>
				<%@ include file="navigation.jsp"%>
			</ul>
		</div>
		<div class="search_wrap2">
			<div class="search_area2">
				<form action="/search" method="get">
					<input type="text" name="keyword" id="search"
						value="${pageMaker.cri.keyword }" placeholder="Store item search">
					<button>Search</button>
				</form>
			</div>
		</div>
		<br>
		<div id="s_footer">
			<h1>고객센터 1522-4953</h1>
			<br>
			<p>
				MON-FRI AM 11:00 – PM 6:00<br> LUNCH TIME PM 13:00 – 14:00<br>
				SAT.SUN.HOLIDAY OFF<br>
			</p>
			<br>
			<h1>은행정보</h1>
			<br>
			<p>
				농협 123-4567-8910-12<br> 국민 9876-54-3210<br> 예금주 : (주) 민박강
			</p>
		</div>
	</div>
	<div id="container_box" align="center">
		<div>&nbsp;</div>
		<div align="center">
			<div class="search_wrap">
				<div class="search_area">
					<select name="type">
						<option value="" selected="selected"
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>상품분류
							선택</option>
						<option value="A"
							<c:out value="${pageMaker.cri.type eq A?'selected':'' }"/>>Outer</option>
						<option value="B"
							<c:out value="${pageMaker.cri.type eq 'B'?'selected':'' }"/>>Top</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>Shirts</option>
						<option value="D"
							<c:out value="${pageMaker.cri.type eq 'D'?'selected':'' }"/>>Pants</option>
						<option value="E"
							<c:out value="${pageMaker.cri.type eq 'E'?'selected':'' }"/>>Suit</option>
						<option value="F"
							<c:out value="${pageMaker.cri.type eq 'F'?'selected':'' }"/>>Bag/Shoes</option>
						<option value="G"
							<c:out value="${pageMaker.cri.type eq 'G'?'selected':'' }"/>>Acc</option>
					</select> <input type="text" name="keyword" id="search"
						value="${pageMaker.cri.keyword }"> <strong>가격</strong>
					<!--   <input id="product_price1"
						name="product_price1" placeholder="" size="15" value=""
						type="text"> ~ <input id="product_price2"
						name="product_price2" placeholder="" size="15" value=""
						type="text">-->
					<button type="button">Search</button>
				</div>
			</div>
			<hr>
			<c:if test="${listcheck != 'empty'}">
				총
				<c:out value="${pageMaker.total}" />
				개의 상품이 검색되었습니다.
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<strong>검색정렬기준</strong>
				<button>상품명순</button>
				<button>낮은가격 순</button>
				<button>높은가격 순</button>
				<br>
				<br>
				<br>
				<table>
					<c:forEach items="${searchlist}" var="searchresult">
						<ul>
							<li><a href=""><img
									src="/resources/upload/${searchresult.uploadPath}/${searchresult.uuid}_${searchresult.fileName}"
									width="200px" height="200px"></a> <a href=""><br>
									상품명: <c:out value="${searchresult.productName}" /></a>
								<p>
									상품 가격: KRW
									<c:out value="${searchresult.productPrice}" />
								</p>
						</ul>
					</c:forEach>
				</table>
			</c:if>
			<br>
			 <c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 상품이 없습니다.</div>
			</c:if>
			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
						<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn previous"><a
								href="${pageMaker.startPage-1}">Previous</a></li>
						</c:if>

						<!-- 페이지 번호 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
								href="${num}">${num}</a></li>
						</c:forEach>

						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a
								href="${pageMaker.endPage + 1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
	</form>

	<script>
		let moveForm = $("#moveForm");
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/search");
			moveForm.submit();
		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

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