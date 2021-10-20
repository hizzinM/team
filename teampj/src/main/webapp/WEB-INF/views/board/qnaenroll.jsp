<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>minparkang</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/board/qnaenroll.css">
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div id="table-wrap">
			<h1>QNA 수정</h1>
			<form action="/board/qnaenroll" method="post">
				<table id="review-table">
					<tbody>
						<tr>
							<td>제목</td>
							<td><input name="qnaTitle" class="text-frame"></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><input name="qnaCategory" class="text-frame"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="userId" class="text-frame userId_box"
								value="${loginuser.userId}" readonly></td>
						</tr>
						<tr>
							<td colspan="2"><textarea rows="3" id="qnaContents"
									name="qnaContents"></textarea> <script>
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
					<tbody>
				</table>
				<div id="btn-box">
					<button class="button_style">등록</button>
				</div>
			</form>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>