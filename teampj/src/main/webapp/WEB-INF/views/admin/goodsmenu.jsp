<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/admin/index.css">
<meta charset="UTF-8">
<title>상품관리</title>
</head>
<body>
	<div class="top_gnb_area">
		<ul class="list">
			<li><a href="/main">메인 페이지</a></li>
			<li><a href="/member/logout.do">로그아웃</a></li>
		</ul>
	</div>
	<section id="container">
		<aside>
			<%@ include file="include/aside.jsp"%>
		</aside>


		<section id=content>
			<div id=title align="center">
				<h2>상품등록</h2>
			</div>
			<div align="center">
				<br> <br>
				<form action="/admin/goodsmenu" method="post" id="enrollForm">

					<div class="form_section">
						<label> </label> <input name="productId" value="0" hidden="">
					</div>
					<div class="form_section">
						<label>옷 이름</label> <input name="productName">
					</div>
					<div class="form_section">
						<label>옷 가격</label> <input name="productPrice">
					</div>
					<div class="form_section">
						<label>옷사이즈</label> <input name="productSize">
					</div>
					<div class="form_section">
						<label>옷 색깔</label> <input name="productColor">
					</div>
					<div class="form_section">
						<label>상품 재고</label> <input name="productInventory">
					</div>
					<br>
					<div class="btn_section">
						<button id="cancelBtn" class="btn">취 소</button>
						<button id="enrollBtn" class="btn enroll_btn">등 록</button>
					</div>
			</div>
			</form>
		</section>
		<script>
			let enrollForm = $("#enrollForm")

			/* 취소 버튼 */
			$("#cancelBtn").click(function() {

				location.href = "redirect:/admin/goodsmenu"

			});

			/* 상품 등록 버튼 */
			$("#enrollBtn").on("click", function(e) {

				e.preventDefault();

				enrollForm.submit();

			});
		</script>
</body>
</html>