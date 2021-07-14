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
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		notice
		<c:if test="${ loginuser!= null }">
			<c:if test="${ loginuser.adminck ==0 }">
			</c:if>
			<c:if test="${ loginuser.adminck ==1 }">
				<a href="/board/enroll"><input type="button" class="btn-style"
					value="글쓰기"></a>
			</c:if>
		</c:if>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	<script>
		$(document).ready(function() {
			let result = '<c:out value="${result}"/>';
			checkAlert(result);
			function checkAlert(result) {
				if (result === '') {
					reutrn;
				}
				if (result === "enrol success") {
					alert("등록이 완료되었습니다.");
				}
			}
		});
	</script>
</body>
</html>