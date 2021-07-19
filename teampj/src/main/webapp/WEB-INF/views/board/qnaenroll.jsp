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
<link rel="stylesheet" href="/resources/css/main.css">
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
		<form action="/board/qnaenroll" method="post">
			<div class="input_wrap">
				<label>Title</label> <input name="qnaTitle">
			</div>
			<div class="input_wrap">
				<label>Category</label> <input name="qnaCategory">
			</div>
			<div class="input_wrap">
				<label>Content</label>
				<textarea rows="3" id="qnaContents" name="qnaContents"></textarea>
				<script>
					var ckeditor_config = {
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "주소임시"
					};

					CKEDITOR.replace("qnaContents", ckeditor_config);
				</script>
			</div>
			<div class="input_wrap">
				<label>Writer</label> <input name="userId"
					value="${loginuser.userId}">
			</div>
			<button class="btn">등록</button>
		</form>

		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>