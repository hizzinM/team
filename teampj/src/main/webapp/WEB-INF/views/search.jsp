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
<style type="text/css">
.product-list {
	width: 1600px;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: space-around;
	flex: 200px;
	flex-wrap: wrap;
}

/* 페이지 버튼 인터페이스 */
.pageMaker_wrap {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 40px;
}

.pageMaker {
	list-style: none;
	display: inline-block;
}

.pageMaker_btn {
	float: left;
	width: 40px;
	height: 40px;
	line-height: 40px;
	margin-left: 20px;
}

.active {
	border: 2px solid black;
	font-weight: 400;
}

.next, .prev {
	border: 1px solid #ccc;
	padding: 0 10px;
}

.pageMaker_btn a:link {
	color: black;
}

.pageMaker_btn a:visited {
	color: black;
}

.pageMaker_btn a:active {
	color: black;
}

.pageMaker_btn a:hover {
	color: black;
}

.next a, .prev a {
	color: #ccc;
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
		<div class="search_wrap">
			<div class="search_area">
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
	</div>
	<div align="center">
		<input id="search" name="keyword" placeholder="상품명" size="15"
			value="${pageMaker.cri.keyword }" type="text"> <br> <br>
		<strong>카테고리</strong><select id="category_no" name="category_no">
			<option value="" selected="selected">상품분류 선택</option>
			<option value=" ">New Arrivals</option>
			<option value=" ">BEST 30</option>
			<option value=" ">Outer</option>
			<option value=" ">Top</option>
			<option value=" ">Shirts</option>
			<option value=" ">Pants</option>
			<option value=" ">Suit</option>
			<option value=" ">Bag/Shoes</option>
			<option value=" ">Acc</option>
		</select> <strong>가격</strong><input id="product_price1" name="product_price1"
			placeholder="" size="15" value="" type="text"> ~ <input
			id="product_price2" name="product_price2" placeholder="" size="15"
			value="" type="text">
		<button>Search</button>
		<hr>
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
		<c:if test="${listcheck != 'empty'}">
			<table>
				<c:forEach items="${searchlist}" var="searchresult">
					<ul>
						<li><a href=""><img
								src="/resources/upload/${searchresult.uploadPath}/${searchresult.uuid}_${searchresult.fileName}"
								width="200px" height="200px"></a> <a href=""><h1>상품명</h1>
								<c:out value="${searchresult.productName}" /></a>
							<p>
								상품 가격 KRW:
								<c:out value="${searchresult.productPrice}" />
							</p>
					</ul>
				</c:forEach>
			</table>
		</c:if>

		<!-- 상품 리스트 X -->

		<c:if test="${listCheck == 'empty'}">
			<div class="table_empty">해당 상품이 없습니다.</div>
		</c:if>
	</div>
	<!-- 페이지 이름 인터페이스 영역 -->
	<div class="pageMaker_wrap">
		<ul class="pageMaker">

			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev }">
				<li class="pageMaker_btn prev"><a
					href="${pageMaker.startPage -1}">이전</a></li>
			</c:if>

			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="num">
				<li
					class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageMaker_btn next"><a
					href="${pageMaker.endPage + 1 }">다음</a></li>
			</c:if>
		</ul>
	</div>

	<form id="moveForm" action="\search" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>

	<script type="text/javascript">
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');

		/* 상품 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});
	</script>
	<script>
		let moveForm = $("#moveForm");
		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let keyword = $(".search_area input[name='keyword']").val();
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.submit();
		});
	</script>
	<div id="footer">
		<div class="footer-text">
			<p>고객센터</p>
			<p>1522-4953</p>
			<p>Mon-Fri AM 11:00 – PM 6:00</p>
			<p>Lunch time PM 13:00 – 14:00</p>
			<p>Sat.Sun.Holiday OFF</p>
			<p>은행정보</p>
			<p>농협 317-0011-4079-11</p>
			<p>국민 242437-04-006967</p>
			<p>예금주 : (주) 모던이프</p>
		</div>
		<div class="footer-text">
			<P>주식회사 모던이프</P>
			<p>대표이사 : 장재원 | 이메일 : modernif.co.kr@gmail.com</p>
			<p>16490 경기도 수원시 팔달구 인계동 1031-2 성지빌딩 701호 모던이프</p>
			<p>사업자등록번호 : 8858800485 [사업자정보확인] | 통신판매업신고번호 : 2017-수원팔달-0059호</p>
			<p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수
				있습니다. KG 이니시스 [서비스 가입사실 확인]</p>
		</div>
	</div>
	</div>
</body>
</html>