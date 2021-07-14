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
	<title>회원정보 수정</title>
	<link rel="stylesheet" href="/resources/css/common-style/reset.css">
	<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
	<link rel="stylesheet" href="/resources/css/common-style/contents.css">
	<link rel="stylesheet" href="/resources/css/mypage/profileUpdate.css">
	<!--
    <link href="../../css/mypage/profile.css" type="text/css" rel="stylesheet">
	<link href="../../css/member/join.css" type="text/css" rel="stylesheet">
	-->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div class="table-frame">
			<form id="modifyForm" action="/mypage/profileUpdate" method="post">
				<p class="ex01">J O I N</p>
				<table>
					<tr>
						<td><label for="userId">아이디</label></td>
						<td><input type="text" id="userId" class="text-frame" name="userId" value='<c:out value="${profile.userId}"/>' readonly="readonly" /></td>
					</tr>

					<tr>
						<td><label for="password">패스워드</label></td> 
						<td><input type="password" id="password" class="text-frame" name="password" value='<c:out value="${profile.password}"/>' /></td>
					</tr>

					<tr>
						<td><label for="passwordCheck">패스워드 확인</label></td> 
						<td><input type="passwordCheck" id="passwordCheck" class="text-frame" name="passwordCheck" value='<c:out value="${profile.passwordCheck}"/>' /></td>
					</tr>

					<tr>
						<td><label for="userName">닉네임</label></td> 
						<td><input type="text" id="userName" name="userName" class="text-frame" value='<c:out value="${profile.userName}"/>' /></td>
					</tr>

					<tr>
						<td><label for="addressNum">주소</label></td> 
						<td style="padding:10px 0;">
							<div class="address_button " onclick="execution_daum_address()">
								<input type="button" class="button_style address_btn" value="주소찾기">	
							<div>
							<input type="text" id="addressNum" class="text-frame address_style" name="addressNum" value='<c:out value="${profile.addressNum}"/>' /><br>
							<input type="text" id="address" class="text-frame address_style" name="address" value='<c:out value="${profile.address}"/>' /><br>
							<input type="text" id="addressDetail" class="text-frame address_style" name="addressDetail" value='<c:out value="${profile.addressDetail}"/>' /><br>

						</td>
					</tr>

					<tr>
						<td><label for="phone">휴대폰 번호</label></td> 
						<td><input type="text" id="phone" class="text-frame" name="phone" value='<c:out value="${profile.phone}"/>' /></td>
					</tr>

					<tr>
						<td><label for="email">이메일</label></td> 
						<td><input type="text" id="email" class="text-frame" name="email" value='<c:out value="${profile.email}"/>' /></td>
					</tr>
					<tr>
						<td colspan="2" style="font-size: 12px; padding:25px 0;">추가정보<td>
					</tr>
					<tr>
						<td><label for="accountName">예금주</label></td> 
						<td><input type="text" id="accountName" class="text-frame" name="accountName" value='<c:out value="${profile.accountName}"/>' /></td>
					</tr>

					<tr>
						<td><label for="accountBank">은행</label></td> 
						<td><input type="text" id="accountBank" class="text-frame" name="accountBank" value='<c:out value="${profile.accountBank}"/>' /></td>
					</tr>

					<tr>
						<td><label for="accountNum">계좌번호</label></td> 
						<td><input type="text" id="accountNum" class="text-frame" name="accountNum" value='<c:out value="${profile.accountNum}"/>' /></td>
					</tr>
				</table>
				<div class="btn-wrap">
					<input type="button" class="button_style" id="modify_btn" value="수정 완료">
					<a href="/main/mypage/profile">
						<input type="button" class="button_style" id="cancel_btn" value="수정 취소">
					</a>
				</div>
			</form>
			<form id="infoForm" action="/mypage/profileUpdate" method="get">
				<input type="hidden" id="userId" name="userId" value='<c:out value="${profile.userId}"/>'>
			</form>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>	
	</div>

	<script type="text/javascript">
			let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
			let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

			/* 수정 하기 버튼  */
			$("#modify_btn").on("click", function(e) {

				mForm.submit();

			});
			
			/* 취소 버튼 */
			/*
			$("#cancel_btn").on("click", function(e) {
				form.submit();
			});
			*/
	</script>
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