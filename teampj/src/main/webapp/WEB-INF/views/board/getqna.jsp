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
<link rel="stylesheet" href="/resources/css/board/getqna.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div id="review_wrap">
			<div id="top-box">
				<div>
					<p class="top-box-child top-box-title">
						<c:out value="${qnaInfo.qnaTitle}" />
						<span> <fmt:formatDate pattern="yyyy/MM/dd"
								value="${qnaInfo.qnaWritedate}" />
						</span>
					</p>
					<p class="top-box-child top-box-useId">
						<c:out value="${qnaInfo.userId}" />
					</p>
					<p class="top-box-child">
						<c:out value="${qnaInfo.bno}" />
					</p>
					<p class="top-box-child">
						<c:out value="${qnaInfo.qnaCategory}" />
					</p>
				</div>
				<div>
					<c:out value="${reviewInfo.productImg}" />
					<img src="${MyReviewlist.productImg}" alt="">
				</div>
			</div>
			<div id="bottom-box">
				<p>
					<c:out value="${qnaInfo.qnaContents}" />
				</p>
			</div>
			<div class="btn_box">
				<a id="list_btn" class="button_style">목록</a>
				<c:if test="${ loginuser!= null }">
					<c:if test="${ loginuser.adminck ==0 }">
					</c:if>
					<c:if test="${ loginuser.adminck ==1 }">
						<a id="modify_btn" class="button_style">수정 하기</a>
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="reply_wrap">
			<div class="reply-read-box">
				<c:forEach items="${reply}" var="reply">
					<div class="reply-read-unit">
						<div class="text-box">
							<p>${reply.userId}<span><fmt:formatDate
										value="${reply.replyWritedate}" pattern="yyyy-MM-dd" />2021-07-21</span>
							</li>
							<p>${reply.replyContent }</p>
						</div>
						<div class="btn-box">
							<button type="button" class="replyUpdate button_style reply_btn"
								data-rno="${reply.rno}">수정</button>
							<button type="button" class="replyDelete button_style reply_btn"
								data-rno="${reply.rno}">삭제</button>
						</div>
					</div>
				</c:forEach> 
			</div>
			<div class="reply-write-box">
				<form method="post" action="/reply/write">
					<div>
						<p>
							<label>작성자</label> <input type="text" name="userId"
								value="${loginuser.userId}">
						</p>
						<textarea name="replyContent"></textarea>
					</div>
					<div>
						<input type="hidden" name="bno" value="${qnaInfo.bno}">
						<button type="submit" class="button_style submit_btn">댓글
							작성</button>
					</div>
				</form>
			</div>
			<!-- 덧글끝 -->
			<form id="infoForm" action="/board/qnamodify" method="get">
				<input type="hidden" id="bno" name="bno"
					value='<c:out value="${qnaInfo.bno}"/>'>
			</form>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	<script>
		let form = $("#infoForm");

		$("#list_btn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/board/qna");
			form.submit();
		});

		$("#modify_btn").on("click", function(e) {
			form.attr("action", "/board/qnamodify");
			form.submit();
		});

		$(".replyUpdate").click(
				function() {
					self.location = "/board/replyUpdate?bno=${qnaInfo.bno}"
							+ "&rno=" + $(this).attr("data-rno");
				});

		$(".replyDelete").click(
				function() {
					self.location = "/board/replyDelete?bno=${qnaInfo.bno}"
							+ "&rno=" + $(this).attr("data-rno");
				});
	</script>
</body>
</html>
