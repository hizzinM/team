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
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<h1>게시판 등록</h1>
		<form action="/board/enroll" method="post">
			<div class="input_wrap">
				<label>Title</label> <input name="noticeTitle">
			</div>
			<div class="input_wrap">
				<label>Content</label>
				<textarea rows="3" name="noticeContent"></textarea>
			</div>
			<div class="input_wrap">
				<label>Writer</label> <input name="userId">
			</div>
			<button class="btn">등록</button>
		</form>

		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>