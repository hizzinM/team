<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰</title>
	<link rel="stylesheet" href="/resources/css/common-style/reset.css">
	<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
	<link rel="stylesheet" href="/resources/css/common-style/contents.css">
	<link rel="stylesheet" href="/resources/css/mypage/myreview.css">
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
    <div id="contents">
        <h1>REVIEW</h1>
        <div id="table_wrap">
			<table>
				<thead>
					<tr>
						<th>상품이미지</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${MyReviewlist}" var="MyReviewlist">
						<tr>
							<td><img src="/resources/upload/${MyReviewlist.productImg}" alt=""></td>
							<td>
							<a href="/mypage/myreviewget?rno=${MyReviewlist.reviewId}"> 
								<c:out value="${MyReviewlist.reviewTitle}" />
							</a>
							</td>
							<td><c:out value="${MyReviewlist.userId}" /></td>
							<td><fmt:formatDate value="${MyReviewlist.reviewWritedate}"
									pattern="yyyy/MM/dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
        <div id="btn-wrap">
            <div class="pageInfo_area">
                <ul id="pageInfo" class="pageInfo">
                    <!-- 각 번호 페이지 버튼 -->
                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class="pageInfo_btn">
                            <a href="${num}">${num}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <form id="moveForm" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
                <input type="hidden" name="amount"  value="${pageMaker.cri.amount }">
            </form>
        </div>
        <%@ include file="../include_collection/footer.jsp"%>
	</div>
		<script>
		let moveform3 = $("#moveform3");
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveform3.find("input[name='pageNum']").val($(this).attr("href"));
			moveform3.attr("action", "/mypage/review");
			moveform3.submit();
		});

		$(document).ready(function() {
			let result = '<c:out value="${Myresult}"/>';
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