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
        <h1><a href="/main">MINPARKANG</a></h1>
        <div id="s_nav">
            <ul>
                <!-- 로그인 전 -->
                <c:if test="${loginuser == null }">
                    <li><a href="/member/login">로그인</a></li>
                    <li><a href="/member/join">회원가입</a></li><br>
                </c:if>
                
                <!-- 로그인 후 -->
                <c:if test="${ loginuser!= null }">
                    <li style="font-weight: bold; font-size: 11px;">${loginuser.userName}님 어서오세요.</li><br><br>
                    <li><a href="/member/logout">로그아웃</a></li>
                    <li><a href="/mypage/myindex">마이페이지</a></li>
                    <c:if test="${ loginuser.adminck ==1 }">
                        <li><a href="/admin/index">관리자화면</a></li>
                    </c:if>
                </c:if><br>
                <li><a href="#">배송조회</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">리뷰</a></li>
                <li><a href="#">고객센터</a></li><br>
            </ul>
        </div>
        <div id="s_category">
            <ul>
                <li><a href="#">Outer</a></li>
                <li><a href="#">Top</a></li>
                <li><a href="#">Shirts</a></li>
                <li><a href="#">Pants</a></li>
                <li><a href="#">Suit</a></li>
                <li><a href="#">Bag/Shose</a></li>
                <li><a href="#">Acc</a></li>
                <li><a href="#">Sale</a></li>
            </ul>

        </div>
        <div id ="s_footer">
            <h1>고객센터　1522-4953</h1><br>
            <p>
                MON-FRI AM 11:00 – PM 6:00<br>
                LUNCH TIME PM 13:00 – 14:00<br>
                SAT.SUN.HOLIDAY OFF<br>
            </p><br>
            <h1>은행정보</h1><br>
            <p>
                농협 123-4567-8910-12<br>
                국민 9876-54-3210<br>
                예금주 : (주) 민박강
            </p>
        </div>
        <div id="s_search">
            <form action="">
                <input type="text" id="search"name="">
            </form>
        </div>
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
		<div id="footer">
			<div class="footer-text">
				<p>고객센터</p>
				<p>1522-4953</p>
				<p>Mon-Fri AM 11:00 – PM 6:00</p>
				<p>Lunch time PM 13:00 – 14:00</p>
				<p>Sat.Sun.Holiday OFF</p>
				<p>은행정보</p>
				<p>농협 317-0011-4079-11</p>
				<p>국민 242437-04-006967</p>
				<p>예금주 : (주) 모던이프</p>
			</div>
			<div class="footer-text">
				<P>주식회사 모던이프</P>
				<p>대표이사 : 장재원 | 이메일 : modernif.co.kr@gmail.com</p>
				<p>16490 경기도 수원시 팔달구 인계동 1031-2 성지빌딩 701호 모던이프</p>
				<p>사업자등록번호 : 8858800485 [사업자정보확인] | 통신판매업신고번호 : 2017-수원팔달-0059호</p>
				<p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수 있습니다.
   					G 이니시스 [서비스 가입사실 확인]</p>
			</div>
		</div>
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