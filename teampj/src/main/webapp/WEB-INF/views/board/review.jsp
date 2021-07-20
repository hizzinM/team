<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>상품이미지</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${Reviewlist}" var="Reviewlist">
			<tr>
				<td><c:out value="${Reviewlist.reviewId}" /></td>
				<td><img src="" alt=""></td>
				<td><c:out value="${Reviewlist.reviewTitle}" /></td>
				<td><c:out value="${Reviewlist.userId}" /></td>
				<td><fmt:formatDate value="${Reviewlist.reviewWritedate}"
						pattern="yyyy/MM/dd" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div id="review-btn-wrap">
	<button type="button" class="button_style write-btn"
		onclick="location.href='/reviewWrite'">글쓰기</button>
</div>

<script>
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
