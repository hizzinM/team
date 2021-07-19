<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/board/notice.css">
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
		<h1>NOTICE</h1>
		<div id="table_wrap">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="list">
					<tbody>
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
					</tbody>
				</c:forEach>
			</table>
		</div>
		<div id="btn-wrap">
			<c:if test="${ loginuser!= null }">
				<c:if test="${ loginuser.adminck ==0 }">
				</c:if>
				<c:if test="${ loginuser.adminck ==1 }">
					<div class="btn-box">
						<button type="button" class="button_style write-btn"
							onclick="location.href='/board/enroll' ">글쓰기</button>
					</div>
				</c:if>
			</c:if>
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="pageInfo_btn"><a href="${num}">${num}</a></li>
					</c:forEach>
				</ul>
			</div>
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
			</form>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>

	<script>
		let moveform2 = $("#moveform2");
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveform2.find("input[name='pageNum']").val($(this).attr("href"));
			moveform2.attr("action", "/board/notice");
			moveform2.submit();
		});

		$(document).ready(function() {
			let result = '<c:out value="${result}"/>';
			checkAlert(result);
			console.log(result);
			function checkAlert(result) {
				if (result === '') {
					return;
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