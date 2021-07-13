<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네비게이션</title>
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<style>
li {
	margin-bottom: 10px;
	font-weight: bolder;
}
</style>
</head>
<body>
	<li><a href="/mypage/addCart">장바구니</a></li>
	<li><a href="/board/notice">공지사항</a></li>
	<li><a href="#">리뷰</a></li>
	<li><a href="/board/qna">고객센터</a></li>
</body>
</html>