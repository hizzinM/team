<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<li><a href="/mypage/addCart">장바구니</a></li>
			<li><a href="/board/notice">공지사항</a></li>
			<li><a href="#">리뷰</a></li>
			<li><a href="/board/qna">고객센터</a></li>
		<br>
	</ul>
</div>
<div id="s_category">
	<ul>
		<li><a href="/category/Outer">Outer</a></li>
		<li><a href="/category/Top">Top</a></li>
		<li><a href="/category/Shirts">Shirts</a></li>
		<li><a href="/category/Pants">Pants</a></li>
		<li><a href="/category/Suit">Suit</a></li>
		<li><a href="/category/BagShoes">Bag/Shoes</a></li>
		<li><a href="/category/Acc">Acc</a></li> 
	</ul>
</div>
<div class="search_wrap">
	<div class="search_area">
		<form action="/search" method="get">
			<input type="text" name="keyword" id="search"
				value="${pageMaker.cri.keyword }" placeholder="Store item search">
			<input class="search-btn-style" type="submit" value="검색">
		</form>
	</div>
</div>

<div id="s_footer">
	<h1>고객센터 1522-4953</h1>
	<p>MON-FRI AM 11:00 – PM 6:00</p>
	<p>LUNCH TIME PM 13:00 – 14:00</p>
	<p>SAT.SUN.HOLIDAY OFF</p>
	<h1>은행정보</h1>
	<p>농협 123-4567-8910-12</p>
	<p>국민 9876-54-3210</p>
	<p>예금주 : (주) 민박강</p>
</div>

<form id="moveForm" method="get">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
</form>
<script>
		let moveForm = $("#moveForm");
		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='keyword']").val(keyword);
			let keyword = $(".search_area input[name='keyword']").val();
			moveForm.submit(); 
		});
</script>