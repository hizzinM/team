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
a {
	text-decoration: none;
}

table {
	border-collapse: collapse;
	width: 1000px;
	margin-top: 20px;
	text-align: center;
}

td, th {
	border: 1px solid black;
	height: 50px;
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
	<div class="table_wrap">
		<div align="center">
			notice <a href="/board/enroll" class="top_btn">게시판 등록</a>
			<table>
				<thead>
					<tr>
						<th class="bno_width">번호</th>
						<th class="title_width">제목</th>
						<th class="writer_width">작성자</th>
						<th class="regdate_width">작성일</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.bno}" /></td>
						<td><c:out value="${list.noticeTitle}" /></td>
						<td><c:out value="${list.userId}" /></td>
						<td><fmt:formatDate value="${list.noticeWritedate}"
								pattern="yyyy년MM월dd일 HH시mm분" /></td>
					</tr>
				</c:forEach>
			</table>
			<br> <br>
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