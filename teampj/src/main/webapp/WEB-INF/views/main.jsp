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
		<!-- 
		<div id="s_search">
			<form action="">
				<input type="text" id="search" name=""
					placeholder="Store item search">
			</form>
			-->

		<div id="s_search">
			<form action="admin/goodsmanage" method="get">
				<input class="input search-input" type="text" name="keyword"
					placeholder="Enter your keyword">
		</div>
		<form id="moveForm" method="get"></form>


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
	<div id="contents">
		<h1>BEST SELLER</h1>
		<ul class="side-img show-img">
			<li><img src="/resources/img/20210625_PC1.jpg" alt=""></li>
			<li><img src="/resources/img/20210625_PC2.jpg" alt=""></li>
			<li><img src="/resources/img/20210630_PC1.jpg" alt=""></li>
		</ul>
		<h1>NEW ARRIVALS & RESTOCK</h1>
		<div id="slide-frame">
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
		<div class="product-list">
			<c:forEach items="${MainProduct}" var="Product" end="7">
			<ul>
				<li><a href=""><img src="/resources/upload/${Product.uploadPath}/${Product.uuid}_${Product.fileName}"/></a>
					<a href=""><h1>상품명</h1><c:out value="${Product.productName}" /></a>
					<hr>
					<p>상품 가격 KRW:<c:out value="${Product.productPrice}"/></p>
					<p>리뷰 개수</p></li>
			</ul>

			</c:forEach>
		</div>

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