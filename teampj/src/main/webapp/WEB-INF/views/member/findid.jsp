<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<link rel="stylesheet" href="/resources/css/common-style/reset.css">
	<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
	<link rel="stylesheet" href="/resources/css/common-style/contents.css">
	<link rel="stylesheet" href="/resources/css/member/find_style.css">
</head>
<body>
    <header>
        <nav>
            <!--
            <ul>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">언어설정</a></li>
            </ul>
            -->
        </nav>
    </header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
    <div id="contents">
        <div class="content-frame">
            <div class="form-frame" style="padding:243px 0;">
                <form action="/member/findidAfter" method="post">
                    <div>
                        <h3>아이디 찾기</h3>
                    </div>
                    <div>
                        <hr>
                        <p>
                            <label><span class="font_style">Email</span></label>
                            <input class="text-frame" type="text" id="email" name="email" placeholder="회원가입한 이메일주소를 입력하세요" required>
                        </p><hr>
                        <p>
                            <button type="submit" id="findBtn" class="btn-style">find</button>
                            <button type="button" onclick="history.go(-1);" class="btn-style">Cancel</button>
                        </p>
                    </div>
                </form>
            </div>
        </div>
		<%@ include file="../include_collection/footer.jsp"%>
    </div>
</body>
</html>