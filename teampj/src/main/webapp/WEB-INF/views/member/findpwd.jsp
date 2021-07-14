<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/member/find_style.css">
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/member/findpw",
				type : "POST",
				data : {
					id : $("#userId").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
<title>비밀번호 찾기</title>
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
                <h3>비밀번호 찾기</h3>
                <hr>
                <p>
                    <label><span class="font_style">아이디</span></label>
                    <input type="text" id="userId" class="text-frame" name="userId" placeholder="회원가입한 아이디를 입력하세요" required>
                </p><hr>
               
                <p>
                    <label><span class="font_style">이메일</span></label>
                    <input type="text" id="email" class="text-frame" name="email" placeholder="회원가입한 이메일주소를 입력하세요" required>
                </p><hr>
                <p class="w3-center">
                    <button type="button" id="findBtn" class="btn-style">find</button>
                    <button type="button" onclick="history.go(-1);" class="btn-style">go to login</button>
                </p>
            </div>
        </div>
		<%@ include file="../include_collection/footer.jsp"%>
    </div>
</body>
</html>