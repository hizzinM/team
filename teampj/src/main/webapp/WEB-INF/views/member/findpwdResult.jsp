<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기 결과</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link rel="stylesheet" href="/resources/css/common-style/reset.css">
	<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
	<link rel="stylesheet" href="/resources/css/common-style/contents.css">
	<link rel="stylesheet" href="/resources/css/member/find_style.css">
    <style>
        hr{
            margin:10px 0;
        }
        .font_style{
            font-size:15px;
            margin-right:20px;
        }
        .form-frame{
            padding:235px 0;
        }
    </style>
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
            <div class="form-frame">
            	<div>
            		<h3>비밀번호 찾기</h3>
            	</div>
            	<div>
            		<hr>
            		<p><span class="font_style">userId</span><span class="font_style">${findpwd}</span></p><hr>
            
            		<a href="/member/login"><button type="button" id="findBtn" class="btn-style">LOGIN</button></a>
            		<a href="/main"><button type="button" class="btn-style">HOME</button></a>
            	</div>
			</div>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>
