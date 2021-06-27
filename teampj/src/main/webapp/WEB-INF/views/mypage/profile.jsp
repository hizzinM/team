<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ loginuser!= null }">
		<div>
			<p>${loginuser.userName}님환영합니다.</p>

		</div>
	</c:if>
	<section>
		유저아이디 : ${loginuser.userId}<br> 비밀번호 : ${loginuser.password}<br>
		닉네임 : ${loginuser.userName}<br> 주소 :
		${loginuser.addressNum}&nbsp;${loginuser.address}&nbsp;${loginuser.addressDetail}<br>
		휴대폰 번호 : ${loginuser.phone}<br> 이메일 : ${loginuser.email}<br>
		${loginuser.regDate } <br>${parsedDateTime } <br> 가입날짜 :
		${jd}<br>
		<hr>
		예금주:${user.accountName }<br> 은행:${user.accountBank }<br>
		계좌번호:${user.accountNum }<br>
		<br>
		<br>
		<a href="/mypage/memberUpdateView">회원정보수정</a>
	</section>
</body>
</html>


