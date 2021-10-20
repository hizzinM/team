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
<link rel="stylesheet" href="/resources/css/board/reviewenroll.css">
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
			<h1>리뷰 작성</h1>
			<form action="/board/enroll" method="post">
				<table id="review-table">
					<tbody>
						<tr>
							<td>Title</td>
							<td><input name="noticeTitle" class="text-frame"></td>
						</tr>
						<tr>
							<td>Content</td>
							<td><textarea rows="2" id="noticeContent"
									name="noticeContent"></textarea> <script>
										var ckeditor_config = {
											resize_enaleb : false,
											enterMode : CKEDITOR.ENTER_BR,
											shiftEnterMode : CKEDITOR.ENTER_P,
											filebrowserUploadUrl : "업로드주소"
										};
										CKEDITOR.replace("noticeContent",
												ckeditor_config);
									</script></td>
						</tr>
						<tr>
							<td>Writer</td>
							<td><input name="userId" value="${loginuser.userId}"></td>
						</tr>
					</tbody>
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