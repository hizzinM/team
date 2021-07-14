<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>minparkang</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/mypage/addCart.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
							<th>카트ID</th>
							<th >유저ID</th>
							<th>상품이미지</th>
							<th>상품ID</th>
							<th>상품명</th>
							<th>상품사이즈</th>
							<th>상품색상</th>
							<th>가격</th>
							<th>주문수량</th>
							<th>총가격</th>
						</tr>
					</thead>
					<c:set var="sum" value="0" />
					<c:forEach items="${cartList}" var="cartList">
						<tr>
							<td><input type="checkbox" name="RowCheck" class="RowCheck" value="${cartList.cartId}" ></td>
							<td><c:out value="${cartList.cartId}" /></td>	
							<td><c:out value="${cartList.userId}" /></td>
							<td><img src="/resources/upload/${cartList.uploadPath}/${cartList.uuid}_${cartList.fileName}" width="200px" height="200px"></td>
							<td><c:out value="${cartList.productId}" /></td>
							<td><c:out value="${cartList.productName}" /></td>
							<td><c:out value="${cartList.cartProductsize}" /></td>
							<td><c:out value="${cartList.cartProductColor}" /></td>
							<td><c:out value="${cartList.cartPrice}" />원</td>
							<td><c:out value="${cartList.cartQty}" /></td>
							
							<td><c:out value="${cartList.cartPrice *cartList.cartQty}" />원</td>
						</tr>
						<c:set var="sum" value="${sum + (cartList.cartPrice *cartList.cartQty)}" />
					</c:forEach>
				</table><br>
				<div class="listResult">
 			<div class="sum">
  			총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
 				</div>
 			<div class="orderOpne">
  			<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
 			</div>
				</div>
			<input type="button" value="주문하기" class="deletebutton button_style order_btn">
				<!--물건 삭제 버튼-->
				
			<input type="button" value="물건삭제" class="deletebutton button_style delete_btn" onclick="deleteValue();">
				

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
	
	
	
	
	
	/*상품 삭제*/
	$(function() {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;

		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue() {
		var url = "/mypage/deleteAddCart"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : "/mypage/deleteAddCart", // 전송 URL
				type : 'GET', // GET or POST 방식
				traditional : true,
				data : {
					valueArr : valueArr
				// 보내고자 하는 data 변수 설정
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("삭제 성공");
						location.replace("/mypage/addCart")
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	}
	</script>
</body>
</html>