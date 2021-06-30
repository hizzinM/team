<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<body>
	<c:if test="${ loginuser!= null }">
		<div>
			<p>${loginuser.userName}님환영합니다.</p>

		</div>
	</c:if>
	<section>
		유저아이디 : ${profile.userId}<br> 닉네임 : ${profile.userName}<br>
		주소 :
		${profile.addressNum}&nbsp;${profile.address}&nbsp;${profile.addressDetail}<br>
		휴대폰 번호 : ${profile.phone}<br> 이메일 : ${profile.email}<br>
		가입날짜 :
		<fmt:formatDate value="${profile.regDate}" pattern="yyyy년MM월dd일" />
		<hr>
		예금주:${profile.accountName}<br> 은행:${profile.accountBank}<br>
		계좌번호:${profile.accountNum}<br> <br> <br> <a class="btn"
			id="modify_btn">수정</a>
		<form id="infoForm" action="/mypage/profileUpdate" method="get">
			<input type="hidden" id="userId" name="userId"
				value='<c:out value="${profile.userId}"/>'>
		</form>

		<script type="text/javascript">
			let form = $("#infoForm");
			$("#modify_btn").on("click", function(e) {
				form.attr("action", "/mypage/profileUpdate");
				form.submit();
			});
		</script>
	</section>
	</section>
</body>
</html>


