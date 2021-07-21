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
<link rel="stylesheet" href="/resources/css/board/getreview.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
    <div id="contents">
        <div id="review_wrap">
            <div id="top-box">
                <div>
                    <p class="top-box-child top-box-title"><c:out value="${reviewInfo.reviewTitle}" /><span><fmt:formatDate pattern="yyyy/MM/dd" value="${reviewInfo.reviewWritedate}" /></span></p>
                    <p class="top-box-child top-box-useId"><c:out value="${reviewInfo.userId}" /></p>
                    <p class="top-box-child"><c:out value="${reviewInfo.productName}" /></p>
                </div>
                <div>
                    <c:out value="${reviewInfo.productImg}" /><img src="#" alt="">
                </div>
            </div>
            <div id="bottom-box">
                <p><c:out value="${reviewInfo.reviewBoard}" /></p>
            </div>
            <div class="btn_box">
                <a href="board/review" class="button_style">목록</a>
            </div>
        </div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>