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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <style>
        .kakao_btn{
            text-align: center;
            margin-top:10px;
        }
        .kakao_btn li{
            display:inline-block;
            width:350px;
            padding:15px;
            background-color: #FEE500;
            border-radius: 5px;
            margin-bottom:5px;
        }
        .kakao_btn li:hover{
            background-color: #F0D700;
        }
    </style>
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
					<ul class="kakao_btn">
						<li onclick="kakaoLogin();">
					      <a href="javascript:void(0)"><span>카카오 로그인</span></a>
						</li>
						<li onclick="kakaoLogout();">
					      <a href="javascript:void(0)"><span>카카오 로그아웃</span></a>
						</li>
					</ul>
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
		
		
		Kakao.init('80eb43406d56c94e501ee32cf6e9ae1e'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
		    Kakao.Auth.login({
		    	scope:"profile_nickname,account_email",
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
		
		
		
		
		
		
	</script>
	<div id="contents">
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>

