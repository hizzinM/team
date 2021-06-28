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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>회원정보 수정</title>
</head>
</script>
<body>

	<form id="modifyForm" action="/mypage/memberUpdate" method="post">


		<section id="container">
			<br> <br>
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label> <input
					class="form-control" type="text" id="userId" name="userId"
					value='<c:out value="${loginuser.userId}"/>' readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" id="password" name="password"
					value='<c:out value="${loginuser.password}"/>' />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">닉네임</label> <input
					class="form-control" type="text" id="userName" name="userName"
					value='<c:out value="${loginuser.userName}"/>' />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="addressNum">주소</label> <input
					class="form-control" type="text" id="addressNum" name="addressNum"
					value='<c:out value="${loginuser.addressNum}"/>' /> <input
					class="form-control" type="text" id="address" name="address"
					value='<c:out value="${loginuser.address}"/>' />
				<div class="form-group has-feedback">
					<input class="form-control" type="text" id="addressDetail"
						name="addressDetail"
						value='<c:out value="${loginuser.addressDetail}"/>' />
				</div>
				<div class="address_button" onclick="execution_daum_address()">
					<span style="border: 1px solid gray; background-color: lightgray;">주소찾기</span>
				</div>
				<br> <label class="control-label" for="phone">휴대폰 번호</label> <input
					class="form-control" type="text" id="phone" name="phone"
					value='<c:out value="${loginuser.phone}"/>' />
			</div>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="email">이메일</label> <input
					class="form-control" type="text" id="email" name="email"
					value='<c:out value="${loginuser.email}"/>' />
			</div>
			<hr>
			<span> <strong>추가정보</strong></span><br> <br>
			<div class="form-group has-feedback">
				<label class="control-label" for="accountName">예금주</label> <input
					class="form-control" type="text" id="accountName"
					name="accountName"
					value='<c:out value="${loginuser.accountName}"/>' />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="accountBank">은행</label> <input
					class="form-control" type="text" id="accountBank"
					name="accountBank"
					value='<c:out value="${loginuser.accountBank}"/>' />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="accountNum">계좌번호</label> <input
					class="form-control" type="text" id="accountNum" name="accountNum"
					value='<c:out value="${loginuser.accountNum}"/>' />
			</div>


			<!--   <div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
				<button class="cancel btn btn-danger" type="button">취소</button>
			</div>-->
			<div>
				<a class="btn" id="modify_btn">수정 완료</a> <a class="btn"
					id="cancel_btn">수정 취소</a>
			</div>
	</form>
	<form id="infoForm" action="/mypage/memberUpdate" method="get">
		<input type="hidden" id="userId" name="userId"
			value='<c:out value="${profileInfo.userId}"/>'>
	</form>

	<script type="text/javascript">
		let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/board/profile");
			form.submit();
		});
	</script>
	</section>
	<script type="text/javascript">
		function execution_daum_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수
							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								addr += extraAddr;

							} else {
								addr += ' ';
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							$("[name=addressNum]").val(data.zonecode);
							$("[name=address]").val(addr);
							// 커서를 상세주소 필드로 이동한다.
							$("#addressDetail").attr("readonly", false);
							$("#addressDetail").focus();
						}
					}).open();

		}
	</script>
</body>

</html>