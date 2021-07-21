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
<script src="/resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
.input_wrap {
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

#delete_btn {
	background-color: #f3e3e7;
}
</style>
</head>
<body>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div align="center">
		<form id="modifyForm" action="/board/modify" method="post">
			<div class="input_wrap">
				<label>게시판 번호</label> <input name="bno" readonly="readonly"
					value='<c:out value="${noticeInfo.bno}"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 제목</label> <input name="noticeTitle"
					value='<c:out value="${noticeInfo.noticeTitle}"/>'>
			</div>
			<div class="input_wrap">
				<label>중요공지 등록</label> <input name="noticeBold"
					value='<c:out value="${noticeInfo.noticeBold}"/>'>
			</div>
			0=일반 1=중요
			<div class="input_wrap">
				<label>게시판 작성자</label> <input name="userId" readonly="readonly"
					value='<c:out value="${noticeInfo.userId}"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 등록일</label> <input name="noticeWritedate"
					readonly="readonly"
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${noticeInfo.noticeWritedate}"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 내용</label>
				<textarea rows="3" id="noticeContent" name="noticeContent"><c:out
						value="${noticeInfo.noticeContent}" /></textarea>
				<script>
					var ckeditor_config = {
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "주소임시"
					};
					CKEDITOR.replace("noticeContent", ckeditor_config);
				</script>
			</div>

			<div class="btn_wrap">
				<a class="btn" id="list_btn">목록 페이지</a> <a class="btn"
					id="modify_btn">수정 완료</a> <a class="btn" id="delete_btn">삭제</a> <a
					class="btn" id="cancel_btn">수정 취소</a>
			</div>
		</form>
		<form id="infoForm" action="/board/modify" method="get">
			<input type="hidden" id="bno" name="bno"
				value='<c:out value="${noticeInfo.bno}"/>'> <input
				type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount"
				value='<c:out value="${cri.amount}"/>'>
		</form>
		<div>
			<%@ include file="../include_collection/footer.jsp"%>
		</div>
	</div>
	<script>
		let form = $("#infoForm");
		let mForm = $("#modifyForm");

		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/board/notice");
			form.submit();
		});

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/board/get");
			form.submit();
		});

		/* 삭제 버튼 */
		$("#delete_btn").on("click", function(e) {
			form.attr("action", "/board/delete");
			form.attr("method", "post");
			form.submit();
		});
	</script>
</body>
</html>