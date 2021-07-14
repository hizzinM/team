<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/member/login_200615.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<!--상단 툴바-->
	<header>
		<nav> 
		</nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<!--본문-->
	<div id="contents">
		<div class="wrapper">
			<div class="wrap">
				<form id="login_form" method="post">
					<div class="login_wrap">
						<div class="id_wrap">
							<div class="id_input_box">
								<input class="id_input text-frame" name="userId"
									placeholder="아이디" value="관리자">
							</div>
						</div>
						<div class="pw_wrap">
							<div class="pw_input_box">
								<input class="pw_iput text-frame" type="password"
									name="password" placeholder="비밀번호" value="admin">
								<!--<br> &nbsp;<span id="checklogin"></span><br>-->
							</div>
						</div>
						<c:if test="${result == 0 }">
							<p>사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</p>
						</c:if>
						<!--   <div class="login_button_wrap">-->
						<input type="button" class="join_button text-deco" value="JOIN"
							onClick="location.href='/member/join'"> <a
							href='/member/findid' class="text-deco">FORGOT ID</a> <a
							href='/member/findpwd' class="text-deco">FORGOT PW</a> <input
							type="button" class="login_button text-deco" value="LOGIN">

					</div>
				</form>
			</div>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {
			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();
		});
	</script>
</body>
</html>

