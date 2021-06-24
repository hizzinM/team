<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<form action="" form id="join_form" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>join</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<input class="id_input" input type="text" name="userId"
						id="user_id">&nbsp;<span id="checkid"></span><br> <b>영문
						소문자/숫자, 4-16자</b>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<input class="pw_input" name="password">
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<input class="pwck_input" name="passwordCheck">
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<input class="user_input" name="userName">
				</div>
				<div class="address_wrap">
					<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<input class="address_input_1" name="addressNum">
						<div class="address_input_2_wrap">
							<input class="address_input_2" name="address">
						</div>
					</div>
					<div class="address_input_3_wrap">
						<input class="address_input_3" name="addressDetail">
					</div>
				</div>
				<div class="phone_wrap">
					<div class="phone_name">전화번호</div>
					<input class="phone_input" name="phone">
				</div>
				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
					<input class="mail_input" name="email">
				</div>
				<div class="clearfix"></div>
				<div class="subjecet">
					<span>추가정보</span>
				</div>
				<div class="accname_wrap">
					<div class="accname_name">예금주</div>
					<input class="accname_input" name="accountName">
				</div>

				<div class="accbank_wrap">
					<div class="accbank_name">은행명</div>
					<input class="accbank_input" name="accountBank">
				</div>

				<div class="acc_wrap">
					<div class="acc_name">계좌번호</div>
					<input class="acc_input" name="accountNum">
				</div>
				<div class="join_button_wrap">
					<input type="button" class="join_button" value="가입하기">
				</div>
			</div>
		</form>

		<script>
			$(document).ready(function() {
				//회원가입 버튼(회원가입 기능 작동)
				$(".join_button").click(function() {
					$("#join_form").attr("action", "/member/join");
					$("#join_form").submit();
				});
			});
		</script>
</body>
</html>