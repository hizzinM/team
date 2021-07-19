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
	<div id="content">
		<div id="table-warp">
			<div id="table-frame">
				<table>
					<thead>
						<tr>
							<th>NO.</th>
							<th>TITLE</th>
							<th>POSTED BY</th>
							<th>DATE</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<c:if test="${ list.noticeBold ==1 }">
							<tbody style="font-weight: bold;">
								<tr>
									<td><c:out value="${list.bno}" /></td>
									<td><a href="/board/get?bno=${list.bno}"> <c:out
												value="${list.noticeTitle}">
											</c:out>
									</a></td>
									<td><c:out value="${list.userId}" /></td>
									<td><fmt:formatDate value="${list.noticeWritedate}"
											pattern="yyyy/MM/dd" /></td>
								</tr>
							</tbody>
						</c:if>
					</c:forEach>
					<c:forEach items="${list}" var="list">
						<c:if test="${list.noticeBold ==0 }">
							<tbody>
								<tr>
									<td><c:out value="${list.bno}" /></td>
									<td><a href="/board/get?bno=${list.bno}"> <c:out
												value="${list.noticeTitle}">
											</c:out>
									</a></td>
									<td><c:out value="${list.userId}" /></td>
									<td><fmt:formatDate value="${list.noticeWritedate}"
											pattern="yyyy/MM/dd" /></td>
								</tr>
							</tbody>
						</c:if>
					</c:forEach>

				</table>
				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">
							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a
									href="${pageMaker.startPage-1}">Previous</a></li>
							</c:if>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="pageInfo_btn"><a href="${num}">${num}</a></li>
							</c:forEach>

							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a
									href="${pageMaker.endPage + 1 }">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>

				<form id="moveform2" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }">
				</form>
				<c:if test="${ loginuser!= null }">
					<c:if test="${ loginuser.adminck ==0 }">
					</c:if>
					<c:if test="${ loginuser.adminck ==1 }">
						<a href="/board/enroll"><input type="button" class="btn-style"
							value="글쓰기"></a>
					</c:if>
				</c:if>
			</div>
		</div>
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