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
			notice
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
						<td><a class="move"
							href='/board/get?bno=<c:out value="${list.bno}"/>'> <c:out
									value="${list.noticeTitle}" />
						</a></td>
						<td><c:out value="${list.userId}" /></td>
						<td><fmt:formatDate value="${list.noticeWritedate}"
								pattern="yyyy/MM/dd" /></td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${ loginuser!= null }">
				<c:if test="${ loginuser.adminck ==0 }">
				</c:if>
				<c:if test="${ loginuser.adminck ==1 }">
					<a href="/board/enroll"><input type="button" class="btn-style"
						value="글쓰기"></a>
				</c:if>
			</c:if>
			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="pageInfo_btn"><a href="${num}">${num}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
			</form>
			<br> <br>
			<%@ include file="../include_collection/footer.jsp"%>
		</div>
	</div>
	<script>
		let moveForm = $("#moveForm");

		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();

					moveForm.append("<input type='hidden' name='bno' value='"
							+ $(this).attr("href") + "'>");
					moveForm.attr("action", "/board/get");
					moveForm.submit();
				});

		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/board/notice");
			moveForm.submit();

		});

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
				if (result === "modify success") {
					alert("수정이 완료되었습니다.");
				}
				if (result === "delete success") {
					alert("삭제가 완료되었습니다.");
				}
			}
		});
	</script>
</body>
</html>