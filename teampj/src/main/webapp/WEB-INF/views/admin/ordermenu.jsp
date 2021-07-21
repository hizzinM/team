<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/admin/index.css">

<meta charset="UTF-8">
<title>주문관리</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/admin_frame.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style type="text/css">
.search_wrap{
    position: absolute;
    top: 525px;
    right: 550px;
}

</style>
</head>
<body> 
	<header>
		<div id="h_nav">
			<h1>MINPARKANG</h1>
			<div id="uesr_area">
				<h1><!--${loginuser.userName}님--> 관리자님</h1>
				<h1>어서오세요</h1>
			</div>	
			<ul>
				<li><a href="/main" class="btn-style">MAIN</a></li>
				<li><a href="/member/logout.do" class="btn-style">LOGOUT</a></li>
			</ul>
		</div>
		<nav>
			<%@ include file="include/aside.jsp"%>
		</nav>
	</header>
	<section id="container">
		<div id="container_box" style="text-align: center; font-size: 20px;">주문관리</div>
		<table class="ordertable">
				<thead>
					<tr>
						<td>주문번호</td>
						<td>수령인 ID</td>
						<td>수령인 이름</td>
						<td>수령인 개인폰번호</td>
						<td>수령인 주소</td>
						<td>수령인 상세주소</td>
						<td>수령인 우편번호</td>
						<td>주문가격</td>
						<td>주문시간</td>
					</tr>
				</thead>
			<c:forEach items="${ordermenu}" var="ordermenu">
					<tr>
						<td><c:out value="${ordermenu.orderId}"/></td>
						<td><c:out value="${ordermenu.userId}"/></td>
						<td><c:out value="${ordermenu.userName}"/></td>
						<td><c:out value="${ordermenu.orderPhone}"/></td>
						<td><c:out value="${ordermenu.orderAddress}"/></td>
						<td><c:out value="${ordermenu.orderAddressDetail}"/></td>
						<td><c:out value="${ordermenu.orderAddressNum}"/></td>
						<td><c:out value="${ordermenu.orderPrice}"/></td>
					    <td><c:out value="${ordermenu.orderDate}"/></td>
					</tr>
			</c:forEach>	
			</table><br>
			
			<div class="search_wrap">
					<div class="search_area">
						<select name="type" class="text-frame text-frame-margin">
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
							<option value="I"
								<c:out value="${pageMaker.cri.type eq 'I'?'selected':'' }"/>>주문번호</option>
							<option value="N"
								<c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>수령인아이디</option>
							<option value="D"
								<c:out value="${pageMaker.cri.type eq 'D'?'selected':'' }"/>>수령인 이름</option>
						</select> <input type="text" name="keyword" class="text-frame"
							value="${pageMaker.cri.keyword }">
						<button class="button_style">Search</button>
					</div>
				</div>
			
			
			<div class="pageInfo_wrap_order">
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

				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }"> <input
						type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
					<input type="hidden" name="type" value="${pageMaker.cri.type }">
				</form>
		

			
	</section>
	
			<script>
		let moveForm = $("#moveForm");
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/admin/ordermenu");
			moveForm.submit();
		});
		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}
			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>




</body>
</html>