<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<meta name ="google-signin-client_id"
 content="520156142234-t6mlg5l5d2tl2fpclqivv15i5llu4ktq.apps.googleusercontent.com">	
</head>
<body>
	<div class="wrapper">

		<div class="wrap">
			<form id="login_form" method="post">
				<div class="logo_wrap">
					<span>MINPARKKANG LOGIN</span>
				</div>
				<div class="login_wrap">
					<div class="id_wrap">
						<div class="id_input_box">
							<input class="id_input" name="userId" placeholder="아이디">
						</div>
					</div>
					<div class="pw_wrap">
						<div class="pw_input_box">
							<input class="pw_iput" name="password" placeholder="비밀번호"><br>
							&nbsp;<span id="checklogin"></span><br>
						</div>
					</div>

					<c:if test="${result == 0 }">
						<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>

					<!--   <div class="login_button_wrap">-->
					<input type="button" class="login_button" value="로그인"><br>
					<a href='/member/findid'>아이디 찾기</a><br>
					
					<!--</div>-->
					&nbsp;<input type="button" class="join_button" value="회원가입"
						onClick="location.href='/member/join'"><br>
			</form>
			
		</div>
	</div>

	<ul style="text-align:center;">
 <li id="GgCustomLogin">
  <a href="javascript:void(0)">
   <span>Login with Google</span>
  </a>
 </li>
</ul>
	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {
			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();
		});
		
		//처음 실행하는 함수
		function init() {
			gapi.load('auth2', function() {
				gapi.auth2.init();
				options = new gapi.auth2.SigninOptionsBuilder();
				options.setPrompt('select_account');
		        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
				options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
		        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
		        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
				gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
			})
		}

		function onSignIn(googleUser) {
			var access_token = googleUser.getAuthResponse().access_token
			$.ajax({
		    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
				url: 'https://people.googleapis.com/v1/people/me'
		        // key에 자신의 API 키를 넣습니다.
				, data: {personFields:'birthdays', key:'AIzaSyDUamwv6sZZjhOad7GKae7K6IcgrEFC7pc', 'access_token': access_token}
				, method:'GET'
			})
			.done(function(e){
		        //프로필을 가져온다.
				var profile = googleUser.getBasicProfile();
				console.log(profile)
			})
			.fail(function(e){
				console.log(e);
			})
		}
		function onSignInFailure(t){		
			console.log(t);
		}
	</script>
	

</body>
</html>

