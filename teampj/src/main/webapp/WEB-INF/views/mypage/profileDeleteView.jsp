<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancel").on("click", function() {

			location.href = "/";

		})

		$("#submit").on("click", function() {
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
		});

	})
</script>
<body>
	<section id="container">
		<div align="center">
			<br>
			<form action="/mypage/profileDelete" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label> <input
						class="form-control" type="text" id="userId" name="userId"
						value="${loginuser.userId}" readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="password">패스워드</label> <input
						class="form-control" type="password" id="password" name="password" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label> <input
						class="form-control" type="text" id="userName" name="userName"
						value="${loginuser.userName}" readonly="readonly" />
				</div>
				<br>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
					<button class="cancel btn btn-danger" type="button">취소</button>
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</div>
	</section>

</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
	<link rel="stylesheet" href="/resources/css/common-style/reset.css">
	<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
	<link rel="stylesheet" href="/resources/css/common-style/contents.css">
	<link rel="stylesheet" href="/resources/css/member/find_style.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<header>
        <nav>
            <!--
            <ul>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">마이페이지</a></li>z
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
					<h3>아이디 찾기</h3>
				</div>
				<form action="/mypage/profileDelete" method="post">
					<hr>
					<div>
						<label for="userId"><span class="font_style">아이디&nbsp;&nbsp;&nbsp;</span></label> 
						<input type="text" id="userId" class="text-frame" name="userId" value="${loginuser.userId}" readonly="readonly" />
					</div>
					<hr>
					<div>
						<label for="userName"><span class="font_style ">성명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></label> 
						<input type="text" id="userName" class="text-frame" name="userName" value="${loginuser.userName}" readonly="readonly" />
					</div>
					<hr>
					<div>
						<label for="password"><span class="font_style">패스워드</span></label> 
						<input type="password" class="text-frame" id="password" name="password" placeholder="비밀번호를 입력하세요"/>
					</div>
					<hr>
					<div style="margin-top: 10px; color:rgb(255, 6, 6); font-size: 12px;">
						<c:if test="${msg == false}">
							비밀번호가 맞지 않습니다.
						</c:if>
					</div>
					<div>
						<button type="submit" id="submit" class="btn-style" >회원탈퇴</button>
						<button class="cancel btn-style" type="button">취소</button>
					</div>
				</form>

			</div>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			// 취소
			$(".cancel").on("click", function() {
	
				location.href = "/main";
	
			})
			$("#submit").on("click", function() {
				if ($("#password").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
			});
		})
	</script>
</body>


</html>