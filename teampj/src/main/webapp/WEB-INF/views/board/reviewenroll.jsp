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
<link rel="stylesheet" href="/resources/css/board/reviewenroll.css">
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	
	<div id="contents">
        <div id="table-wrap">
            <h1>리뷰 작성</h1>
            <form action="/board/reviewenroll" method="post">
                <table id="review-table">
                    <tbody>
                        <tr>
                            <td>제목</td>
                            <td><input name="reviewTitle" class="text-frame"></td>
                        </tr>
                        <tr>
                        	<td>작성자</td>
                        	<c:if test="${loginuser == null }">
								<td>비회원</td>
							</c:if>
							<c:if test="${loginuser != null }">
								<td>
									<input name="userName" class="text-frame userId_box" value="${loginuser.userName}" readonly>
								</td>
                            </c:if>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea id="reviewBoard" name="reviewBoard" class="text-frame"></textarea>
                                <script>
                                    var ckeditor_config = {
                                        resize_enaleb: false,
                                        enterMode: CKEDITOR.ENTER_BR,
                                        shiftEnterMode: CKEDITOR.ENTER_P,
                                        filebrowserUploadUrl: "주소임시"
                                    };
                                    CKEDITOR.replace("reviewBoard", ckeditor_config);
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td>이미지</td>
                            <td><input type="file" id="productImg" name='uploadFile' style="height: 30px;" multiple="multiple" />
                            </td>
                        </tr>
                    <tbody>
                </table>
                <div id="btn-box">
                    <button class="button_style">등록</button>
                </div>
            </form>
        </div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>