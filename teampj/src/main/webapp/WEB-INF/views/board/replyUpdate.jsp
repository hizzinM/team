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
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="content">
		<section id="container">
			<form role="form" method="post" autocomplete="off">

				<input type="hidden" id="bno" name="bno" value="${replyUpdate.bno}"
					readonly="readonly" /> <input type="hidden" id="rno" name="rno"
					value="${replyUpdate.rno}" readonly="readonly" />

				<p>
					<label for="replyContent">글 내용</label>
					<textarea id="replyContent" name="replyContent">${replyUpdate.replyContent}</textarea>
				</p>

				<p>
					<button type="submit">수정</button>
					<button type="button" id="cancel_btn">취소</button>

					<script>
						// 폼을 변수에 저장
						var formObj = $("form[role='form']");

						// 취소 버튼 클릭
						$("#cancel_btn")
								.click(
										function() {
											self.location = "/board/getqna?bno=${replyUpdate.bno}";
										});
					</script>
				</p>
			</form>
		</section>
	</div>

</body>
</html>