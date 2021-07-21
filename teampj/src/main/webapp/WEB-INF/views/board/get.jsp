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
<link rel="stylesheet" href="/resources/css/board/get.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	
    <div id="contents">
        <div id="notice_wrap">
            <div id="top-box">
                <div>
                    <p class="top-box-child top-box-title"><c:out value="${noticeInfo.noticeTitle}" /><span><fmt:formatDate pattern="yyyy/MM/dd" value="${noticeInfo.noticeWritedate}" /></span></p>
                    <p class="top-box-child top-box-useId"><c:out value="${noticeInfo.bno}" /></p>
                    <p class="top-box-child"><c:out value="${noticeInfo.userId}" /></p>
                </div>
            </div>
            <div id="bottom-box">
                <p><c:out value="${noticeInfo.noticeContent}" /></p>
            </div>
			<div class="btn_box">
				<a class="button_style" id="list_btn">목록 페이지</a>
				<c:if test="${ loginuser!= null }">
					<c:if test="${ loginuser.adminck ==0 }"></c:if>
					<c:if test="${ loginuser.adminck ==1 }">
						<a class="button_style" id="modify_btn">수정 하기</a>
					</c:if>
				</c:if>
			</div>
			<form id="infoForm" action="/board/modify" method="get">
				<input type="hidden" id="bno" name="bno"
					value='<c:out value="${noticeInfo.bno}"/>'>
			</form>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	
	<script>
		let form = $("#infoForm");

		$("#list_btn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/board/notice");
			form.submit();
		});

		$("#modify_btn").on("click", function(e) {
			form.attr("action", "/board/modify");
			form.submit();
		});
	</script>
</body>
</html>