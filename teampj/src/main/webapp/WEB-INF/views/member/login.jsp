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
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" asyncdefer></script>
<meta name="google-signin-client_id" content="520156142234-t6mlg5l5d2tl2fpclqivv15i5llu4ktq.apps.googleusercontent.com">
</head>
<body>
    <!--상단 툴바-->
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
        <h1><a href="main.html">MINPARKANG</a></h1>
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
    <!--본문-->
    <div id="contents">
        <div class="wrapper">
            <div class="wrap">
                <form id="login_form" method="post">
                    <div class="login_wrap">
                        <div class="id_wrap">
                            <div class="id_input_box">
                                <input class="id_input text-frame" name="userId" placeholder="아이디">
                            </div>
                        </div>
                        <div class="pw_wrap">
                            <div class="pw_input_box">
                                <input class="pw_iput text-frame" type="password" name="password" placeholder="비밀번호">
                                <!--<br> &nbsp;<span id="checklogin"></span><br>-->
                            </div>
                        </div>
                        <c:if test="${result == 0 }">
                            <p>사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</p>
                        </c:if>
                        <!--   <div class="login_button_wrap">-->
                        <input type="button" class="join_button text-deco" value="JOIN" onClick="location.href='/member/join'">
                        <a href='/member/findid' class="text-deco">FORGOT ID</a>
                        <a href='/member/findid' class="text-deco">FORGOT PW</a>
                        <input type="button" class="login_button text-deco" value="LOGIN">
                            
                        <li id="GgCustomLogin">
                            <a href="javascript:void(0)">
                                <img src="/resources/img/google_logo.png" alt="">
                                <span>구글로 로그인</span>
                            </a>
                        </li>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        /* 로그인 버튼 클릭 메서드 */
        $(".login_button").click(function() {
            /* 로그인 메서드 서버 요청 */
            $("#login_form").attr("action", "/member/login.do");
            $("#login_form").submit();
        });
    
        //처음 실행하는 함수
        function init() {
            gapi
                .load(
                    'auth2',
                        function() {
                             gapi.auth2.init();
                                options = new gapi.auth2.SigninOptionsBuilder();
                                options.setPrompt('select_account');
                                // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
                                 options
                                        .setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
                                // 인스턴스의 함수 호출 - element에 로그인 기능 추가
                                // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
                                gapi.auth2.getAuthInstance()
                                        .attachClickHandler('GgCustomLogin',
                                                options, onSignIn,
                                                onSignInFailure);
                            })
        }
        function onSignIn(googleUser) {
            var access_token = googleUser.getAuthResponse().access_token
            $.ajax({
                // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
                url : 'https://people.googleapis.com/v1/people/me'
                // key에 자신의 API 키를 넣습니다.
                ,
                data : {
                    personFields : 'birthdays',
                    key : 'AIzaSyDUamwv6sZZjhOad7GKae7K6IcgrEFC7pc',
                    'access_token' : access_token                    },
                method : 'GET'
            }).done(function(e) {
                //프로필을 가져온다.
                var profile = googleUser.getBasicProfile();
                                console.log(profile)
            }).fail(function(e) {
                console.log(e);
            })
        }
        function onSignInFailure(t) {
            console.log(t);
        }
    </script>
    <div id="contents">
        <div id="footer">
            <div class="footer-text">
                <p>고객센터</p>
                <p>1522-4953</p>
                <p>Mon-Fri AM 11:00 – PM 6:00</p>
                <p>Lunch time PM 13:00 – 14:00</p>
                <p>Sat.Sun.Holiday OFF</p>
                <p>은행정보</p>
                <p>농협 123-4567-8910-11</p>
                <p>국민 123-4567-8910-11</p>
                <p>예금주 : (주) minparkang</p>
            </div>
            <div class="footer-text">
                <P>주식회사 minparkang</P>
                <p>대표이사 : 민박강 | 이메일 : minparkang@gmail.com</p>
                <p>16490 경기도 수원시 팔달구 인계8동</p>
                <p>사업자등록번호 : 123456789 | 통신판매업신고번호 : 2021-더조은-0000호</p>
                <p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수 있습니다.
                    KG 이니시스</p>
            </div>
        </div>
    </div>
</body>
</html>

