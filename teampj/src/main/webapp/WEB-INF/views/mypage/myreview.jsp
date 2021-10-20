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
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
						<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${MyReviewlist}" var="MyReviewlist">
						<tr>
							<td><input type="checkbox" name="RowCheck" class="RowCheck" value="${MyReviewlist.reviewId}"></td>
							<td><img src="/resources/upload/${MyReviewlist.uploadPath}/${MyReviewlist.uuid}_${MyReviewlist.fileName}" alt="" id="reviewimg" style="width: 160px"></td>
							<td><c:out value="${MyReviewlist.productName}" /></td>
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
			<input type="button" value="리뷰삭제" class="deletebutton button_style delete_btn" onclick="deleteValue()">
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
		/*상품 삭제*/
		$(function() {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;

			$("input[name='allCheck']").click(function() {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function() {
				if ($("input[name='RowCheck']:checked").length == rowCnt) {
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue() {
			var url = "/board/reviewdelete"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0) {
				alert("선택된 글이 없습니다.");
			} else {
				var chk = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url : "/board/reviewdelete", // 전송 URL
					type : 'GET', // GET or POST 방식
					traditional : true,
					data : {
						valueArr : valueArr
					// 보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("삭제 성공");
							location.replace("/mypage/myreview")
						} else {
							alert("삭제 실패");
						}
					}
				});
			}
		}
	</script>
</body>
</html>