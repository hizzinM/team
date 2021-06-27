<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html> 
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원정보 수정</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/mypage/profile";

		})

		$("#submit").on("click", function() {
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
		});

	})
</script>
<body>
	<section id="container">
		<form action="/member/memberUpdate" method="post">
			<br> <br> <br>
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label> <input
					class="form-control" type="text" id="userId" name="userId"
					value="${loginuser.userId}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" id="password" name="password"
					value="${loginuser.password}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">닉네임</label> <input
					class="form-control" type="text" id="userName" name="userName"
					value="${loginuser.userName}" />
			</div>



			<div class="form-group has-feedback">
				<label class="control-label" for="userName">주소</label> <input
					class="form-control" type="text" id="userName" name="userName"
					value="${loginuser.userName}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="phone">휴대폰 번호</label> <input
					class="form-control" type="text" id="phone" name="phone"
					value="${loginuser.phone}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="email">이메일</label> <input
					class="form-control" type="text" id="email" name="email"
					value="${loginuser.email}" />
			</div>
			<hr>
			<span> <strong>추가정보</strong></span><br> <br>
			<div class="form-group has-feedback">
				<label class="control-label" for="accountName">예금주</label> <input
					class="form-control" type="text" id="accountName"
					name="accountName" value="${loginuser.accountName}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="accountBank">은행</label> <input
					class="form-control" type="text" id="accountBank"
					name="accountBank" value="${loginuser.accountBank}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="accountNum">계좌번호</label> <input
					class="form-control" type="text" id="accountNum" name="accountNum"
					value="${loginuser.accountNum}" />
			</div>


			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>

</body>

</html>