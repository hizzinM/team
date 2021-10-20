<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>profile</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/mypage/profile.css">
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div id="table-frame">
			<h1>P R O F I L E</h1>
			<c:if test="${ loginuser!= null }">
				<div id="name-area">
					<p>${loginuser.userName}님환영합니다.</p>
				</div>
			</c:if>
			<table>
				<tr>
					<td>아이디</td>
					<td>${profile.userId}</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${profile.userName}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${profile.addressNum}<br> <br>
						${profile.address}<br> <br> ${profile.addressDetail}<br>
						<br>
					</td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>${profile.phone}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${profile.email}</td>
				</tr>
				<tr>
					<td>가입날짜</td>
					<td><fmt:formatDate value="${profile.regDate}"
							pattern="yyyy년MM월dd일" /></td>
				</tr>
				<tr>
					<td>예금주</td>
					<td>${profile.accountName}</td>
				</tr>
				<tr>
					<td>은행</td>
					<td>${profile.accountBank}</td>
				</tr>
				<tr>
					<td>계좌번호</td>
					<td>${profile.accountNum}</td>
				</tr>
			</table>
			<div class="buttom-wrap">
				<input type="button" class="btn-style btn-update" id="modify_btn"
					value="수정"> <a href="/mypage/profileDeleteView"><input
					type="button" class="btn-style" value="탈퇴"></a>
			</div>
			<form id="infoForm" action="/mypage/profileUpdate" method="get">
				<input type="hidden" id="userId" name="userId"
					value='<c:out value="${profile.userId}"/>'>
			</form>
			<!--<a href="/mypage/profileUpdate" class="btn btn-style" id="modify_btn">수정</a>
            <a href="/mypage/profileDeleteView" class="btn btn-style" id="delete_btn">탈퇴</a>-->
			<script type="text/javascript">
                let form = $("#infoForm");
                $("#modify_btn").on("click", function(e) {
                    form.attr("action", "/mypage/profileUpdate");
                    form.submit();
                });
            </script>
			<!--
            <a href="/mypage/profileUpdate" class="btn btn-style" id="modify_btn" >수정</a>
            <a href="/mypage/profileDeleteView" class="btn btn-style" id="delete_btn" >탈퇴</a>
            <form id="infoForm" action="/mypage/profileUpdate" method="get">
                <input type="hidden" id="userId" name="userId" value='<c:out value="${profile.userId}"/>'>
            </form>
            <script type="text/javascript">
                let form = $("#infoForm");
                $("#modify_btn").on("click", function(e) {
                    form.attr("action", "/mypage/profileUpdate");
                    form.submit();
                });
            </script>
            -->
		</div>


	</div>
	<div id="s_footer">
		<h1>고객센터 1522-4953</h1>
		<br>
		<p>
			MON-FRI AM 11:00 – PM 6:00<br> LUNCH TIME PM 13:00 – 14:00<br>
			SAT.SUN.HOLIDAY OFF<br>
		</p>
		<br>
		<h1>은행정보</h1>
		<br>
		<p>
			농협 123-4567-8910-12<br> 국민 9876-54-3210<br> 예금주 : (주) 민박강
		</p>
	</div>
	<div id="s_search">
		<form action="">
			<input type="text" id="search" name="">
		</form>
	</div>
	</div>
	<div id="contents">
		<div id="table-frame">
			<h1>P R O F I L E</h1>
			<c:if test="${ loginuser!= null }">
				<div id="name-area">
					<p>${loginuser.userName}님환영합니다.</p>
				</div>
			</c:if>
			<table>
				<tr>
					<td>아이디</td>
					<td>${profile.userId}</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${profile.userName}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${profile.addressNum}<br> <br>
						${profile.address}<br> <br> ${profile.addressDetail}<br>
						<br>
					</td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>${profile.phone}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${profile.email}</td>
				</tr>
				<tr>
					<td>가입날짜</td>
					<td><fmt:formatDate value="${profile.regDate}"
							pattern="yyyy년MM월dd일" /></td>
				</tr>
				<tr>
					<td>예금주</td>
					<td>${profile.accountName}</td>
				</tr>
				<tr>
					<td>은행</td>
					<td>${profile.accountBank}</td>
				</tr>
				<tr>
					<td>계좌번호</td>
					<td>${profile.accountNum}</td>
				</tr>
				</ul>
			</table>
			<div class="buttom-wrap">
				<!--   <a href="/mypage/profileUpdate">-->
				<input type="button" class="btn-style btn-update" id="modify_btn"
					value="수정"></a> <a href="/mypage/profileDeleteView"> <input
					type="button" class="btn-style" value="탈퇴"></a>
			</div>
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

		</div>

		<%@ include file="../include_collection/footer.jsp"%>
	</div>

</body>
</html>
