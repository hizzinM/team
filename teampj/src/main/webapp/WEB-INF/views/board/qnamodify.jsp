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
<link rel="stylesheet" href="/resources/css/board/qnamodify.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>

	<div id="contents">
		<div id="table-wrap">
			<h1>QNA 수정</h1>
			<form id="modifyForm" action="/board/qnamodify" method="post">
				<table id="notice-table">
					<tbody>
						<tr>
							<td>질문 번호</td>
							<td><input name="bno" readonly="readonly"
								value='<c:out value="${qnaInfo.bno}"/>'></td>
						</tr>
						<tr>
							<td>질문 카테고리</td>
							<td><input name="qnaCategory"
								value='<c:out value="${qnaInfo.qnaCategory}"/>'></td>
						</tr>
						<tr>
							<td>질문 제목</td>
							<td><input name="qnaTitle"
								value='<c:out value="${qnaInfo.qnaTitle}"/>'></td>
						</tr>
						<tr>
							<td>질문 작성자</td>
							<td><input name="userId" readonly="readonly"
								value='<c:out value="${qnaInfo.userId}"/>'></td>
						</tr>
						<tr>
							<td>질문 등록일</td>
							<td><input name="qnaWritedate" readonly="readonly"
								value='<fmt:formatDate pattern="yyyy/MM/dd" value="${qnaInfo.qnaWritedate}"/>'></td>
						</tr>
						<tr>
							<td>질문 등록일</td>
							<td><input name="qnaWritedate" readonly="readonly"
								value='<fmt:formatDate pattern="yyyy/MM/dd" value="${qnaInfo.qnaWritedate}"/>'></td>
						</tr>
						<tr>
							<td colspan="2"><textarea rows="3" id="qnaContents"
									name="qnaContents"><c:out
										value="${qnaInfo.qnaContents}" /></textarea> <script>
											var ckeditor_config = {
												resize_enaleb : false,
												enterMode : CKEDITOR.ENTER_BR,
												shiftEnterMode : CKEDITOR.ENTER_P,
												filebrowserUploadUrl : "주소임시"
											};
											CKEDITOR.replace("qnaContents",
													ckeditor_config);
										</script></td>
						</tr>
					</tbody>
				</table>
				<div class="btn_wrap">
					<a class="btn" id="list_btn">목록 페이지</a> <a class="btn"
						id="modify_btn">수정 완료</a> <a class="btn" id="delete_btn">삭제</a> <a
						class="btn" id="cancel_btn">수정 취소</a>
				</div>
			</form>
			<form id="infoForm" action="/board/qnamodify" method="get">
				<input type="hidden" name="bno" id="bno"
					value='<c:out value="${qnaInfo.bno}"/>'> <input
					type="hidden" name="pageNum"
					value='<c:out value="${cri.pageNum}"/>'> <input
					type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			</form>
		</div>
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
			form.attr("action", "/board/qna");
			form.submit();
		});

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/board/getqna");
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