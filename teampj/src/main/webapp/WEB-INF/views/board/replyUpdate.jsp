<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/admin/membermenu.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="content">
		<div>글번호 : ${replyUpdate.bno}</div>

		<section id="container">
			<form name="updateForm" role="form" method="post"
				action="/board/replyUpdate">
				<input type="hidden" name="board_number" value="${replyUpdate.bno}"
					readonly="readonly" /> <input type="hidden" id="reply_number"
					name="reply_number" value="${replyUpdate.rno}" /> <label
					for="replytext">댓글 내용</label><input type="text" id="replytext"
					name="replytext" value="${replyUpdate.replyContent}" />

				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="button" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
		</form>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							var formObj = $("form[name='updateForm']");

							$(".cancel_btn")
									.on(
											"click",
											function() {
												location.href = "/board/readView?bno=${qnaInfo.bno}"
														+ reply.getBno();
											})
						})
	</script>
</body>
</html>