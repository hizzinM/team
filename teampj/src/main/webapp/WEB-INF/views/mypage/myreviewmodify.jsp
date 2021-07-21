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
<script src="/resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
.input_wrap {
	padding: 5px 20px;
}

label {
	display: block;
	margin: 10px 0;
	font-size: 20px;
}

input {
	padding: 5px;
	font-size: 17px;
}

textarea {
	width: 800px;
	height: 200px;
	font-size: 15px;
	padding: 10px;
}

#delete_btn {
	background-color: #f3e3e7;
}
</style>
</head>
<body>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div id="table-wrap">
			<h1>리뷰 수정</h1>
			<form id="modifyForm" action="/mypage/myreviewmodify" method="post">
				<table id="review-table">
					<tbody>
						<tr>
							<td>제목</td>
							<td><input name="reviewTitle" class="text-frame"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="userName" class="text-frame userId_box"
								value="${loginuser.userName}" readonly></td>
						</tr>
						<tr>
							<td colspan="2"><textarea id="reviewBoard" name="reviewBoard" class="text-frame"></textarea> 
								<script>
									var ckeditor_config = {
										resize_enaleb : false,
										enterMode : CKEDITOR.ENTER_BR,
										shiftEnterMode : CKEDITOR.ENTER_P,
										filebrowserUploadUrl : "주소임시"
									};
									CKEDITOR.replace("reviewBoard", ckeditor_config);
								</script>
							</td>
						</tr>
						<tr>
							<td>이미지</td>
							<td><input type="file" id="productImg" name='uploadFile' style="height: 30px;" multiple="multiple" /></td>
						</tr>
						<tr>
							<td>이미지</td>
							<td><input type="text" name='reviewId' value="${MyreviewInfo.reviewId}"></td>
						</tr>
					<tbody>
				</table>
				
				<div class="btn_wrap">
					<a class="btn" id="list_btn">목록 페이지</a> 
					<a class="btn" id="modify_btn">수정 완료</a> 
					<a class="btn" id="delete_btn">삭제</a> <a class="btn" id="cancel_btn">수정 취소</a>
				</div>
				
			</form>
			
			<form id="infoForm" action="/mypage/myreviewmodify" method="get">
				<input type="hidden" id="rno" name="rno" value='<c:out value="${MyreviewInfo.reviewId}"/>'> 
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'> 
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			</form>
		</div>
		<div>
			<%@ include file="../include_collection/footer.jsp"%>
		</div>
	</div>
	<script>
		let form = $("#infoForm");
		let mForm = $("#modifyForm");

		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e) {
			form.find("#rno").remove();
			form.attr("action", "/mypage/myreview");
			form.submit();
		});

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/mypage/myreviewget");
			form.submit();
		});

		/* 삭제 버튼 */
		$("#delete_btn").on("click", function(e) {
			form.attr("action", "/mypage/myreview");
			form.attr("method", "post");
			form.submit();
		});
	</script>
</body>
</html>