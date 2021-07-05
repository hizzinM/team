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

</html>