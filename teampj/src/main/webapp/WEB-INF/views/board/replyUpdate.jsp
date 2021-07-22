<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
    <style>
        #contents {
            padding-top: 200px;
        }
        #container {
            width: 500px;
            border: 1px solid black;
            margin: 0 auto;
            text-align: center;
            padding: 50px;
            margin-bottom: 130px;
        }
        #container>h1{
            margin-bottom: 50px;;
        }
        .button_style {
            width:247px;
            display: inline-block;
        }

        .text_Warning {
            padding-bottom: 20px;
        }
        textarea{
            width:494px;
            height:200px;
            resize: none;
        }
        .btn-box{
            width:100%;
            text-align: center;
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
	<div id="contents">
		<section id="container">
			<form role="form" method="post" autocomplete="off">

				<input type="hidden" id="bno" name="bno" value="${replyUpdate.bno}"
					readonly="readonly" /> <input type="hidden" id="rno" name="rno"
					value="${replyUpdate.rno}" readonly="readonly" />

				<p>
					<label for="replyContent">글 내용</label>
					<textarea id="replyContent" name="replyContent">${replyUpdate.replyContent}</textarea>
				</p>

				<p>
					<button type="submit">수정</button>
					<button type="button" id="cancel_btn">취소</button>

					<script>
						// 폼을 변수에 저장
						var formObj = $("form[role='form']");

						// 취소 버튼 클릭
						$("#cancel_btn")
								.click(
										function() {
											self.location = "/board/getqna?bno=${replyUpdate.bno}";
										});
					</script>
				</p>
			</form>
		</section>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>

</body>
</html>