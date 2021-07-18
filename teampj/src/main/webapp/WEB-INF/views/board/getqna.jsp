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
<
style type ="text /css ">.input_wrap {
	padding: 5px 20px;
}

label {
	display: block;
	margin: 10px 0;
	font-size: 20px;
}

input {
	padding: 5px;
	font-size: 17px;
}

textarea {
	width: 800px;
	height: 200px;
	font-size: 15px;
	padding: 10px;
}
</style>
</head>
<body>

	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div align="center">
		<div class="input_wrap">
			<div class="input_wrap">
				<!-- 번호 -->
				<c:out value="${qnaInfo.qnaId}" />
			</div>
			<div class="input_wrap">
				<!-- 카테고리 -->
				<c:out value="${qnaInfo.qnaCategory}" />
			</div>
			<div class="input_wrap">
				<!-- 제목 -->
				<c:out value="${qnaInfo.qnaTitle}" />
			</div>
			<div class="input_wrap">
				<!-- 작성자 -->
				<c:out value="${qnaInfo.userId}" />
			</div>
			<div class="input_wrap">
				<!-- 작성일 -->
				<fmt:formatDate pattern="yyyy/MM/dd" value="${qnaInfo.qnaWritedate}" />
			</div>
			<div class="input_wrap">
				<!-- 공지내용 -->
				<c:out value="${qnaInfo.qnaContents}" />
			</div>

			<div class="btn_wrap">
				<a class="btn" id="list_btn">목록 페이지</a>

				<c:if test="${ loginuser!= null }">
					<c:if test="${ loginuser.adminck ==0 }">
					</c:if>
					<c:if test="${ loginuser.adminck ==1 }">
						<a class="btn" id="modify_btn">수정 하기</a>
					</c:if>
				</c:if>

			</div>
			<form id="infoForm" action="/board/qnamodify" method="get">
				<input type="hidden" id="qnaId" name="qnaId"
					value='<c:out value="${qnaInfo.qnaId}"/>'>
			</form>
			<%@ include file="../include_collection/footer.jsp"%>
		</div>
	</div>
	<script>
		let form = $("#infoForm");

		$("#list_btn").on("click", function(e) {
			form.find("#qnaId").remove();
			form.attr("action", "/board/qna");
			form.submit();
		});

		$("#modify_btn").on("click", function(e) {
			form.attr("action", "/board/qnamodify");
			form.submit();
		});
	</script>
</body>
</html>