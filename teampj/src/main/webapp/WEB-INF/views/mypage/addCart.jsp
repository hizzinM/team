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
<style type="text/css">

table {
	width: 60%;
	border: 1px solid #d3d8e1;
	text-align: center;
	border-collapse: collapse;
}

th, td {
	padding: 10px 5px;
	border: 1px solid #e9ebf0;
	font-size: 17px;
}
</style>
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
				<%@ include file="../smallmenu.jsp"%>
				<br>
			</ul>
		</div>
		<div id="s_category">
			<ul>
				<%@ include file="../navigation.jsp"%>
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

		<div class="product-list">
			
			<table style="border:1px black solid;">
					<thead> 
						<tr>
							<th><input type="checkbox" name="allCheck" id=allCheck /></th>
							<th class="username_width">카트ID</th>
							<th class="useremail_width">유저ID</th>
							<th class="userphone_width">상품ID</th>
							<th class="userphone_width">상품이미지</th>
							<th class="useremail_width">상품명</th>
							<th class="useraddress_width">상품사이즈</th>
							<th class="useregdate_width">상품색상</th>
							<th class="useregdate_width">가격</th>
							<th class="useregdate_width">주문수량</th>
						</tr>
					</thead>
					<c:forEach items="${cartList}" var="cartList">
						<tr>
							<td><input type="checkbox" name="RowCheck" class="RowCheck"
								value="${cartList.cartId}"></td>
							<td><c:out value="${cartList.cartId}" /></td>	
							<td><c:out value="${cartList.userId}" /></td>
							<td><img src="/resources/upload/${cartList.uploadPath}/${cartList.uuid}_${cartList.fileName}" width="200px" height="200px"></td>
							<td><c:out value="${cartList.productId}" /></td>
							<td><c:out value="${cartList.productName}" /></td>
							<td><c:out value="${cartList.cartProductsize}" /></td>
							<td><c:out value="${cartList.cartProductColor}" /></td>
							<td><c:out value="${cartList.cartPrice}" /></td>
							<td><c:out value="${cartList.cartQty}" /></td>
						</tr>
					</c:forEach>
				</table>
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
	<script>
		let moveForm = $("#moveForm");
		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let keyword = $(".search_area input[name='keyword']").val();
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.submit();
		});
	</script>
</body>
</html>