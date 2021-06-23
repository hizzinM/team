<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
table, tr {
	width: 1100px;
	border: 1px solid black;
}

td {
	border-bottom: 2px solid gray;
}

.ex01 {
	position: relative;
	margin-left: 405px;
	margin-top: 25px;
	margin-bottom: 5px;
}
</style>

</head>
<body>
	<form name="for" action="joinProc.html"
		onsubmit="return CheckForm(this)">
		<p class="ex01">
			<strong>사항은 필수 입력
				사항이므로 필히 입력하여 주십시오.</strong>
		</p>
		<table style="width: 1100px;" align="center">
			<tr>
				<td style="background-color: #28A0FF;" colspan="5"><font
					size="3" color="white">기본 정보</font></td>
			</tr>

			<tr>
				<td bgcolor="#CCEEFF" width="200px">회원 ID</td>
				<td colspan="4"><input type="text" name="id" id="id"
					title="5자이상 입력해주세요">&nbsp;<span id="check0"></span></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">프로필 사진</td>
				<td colspan="4"><input type="file" name="file"></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">비밀번호</td>
				<td colspan="4"><input type="password" name="pass1" id="pass1"
					onchange="checkpass()">&nbsp;<span id="check01"></span></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">비밀번호 재입력</td>
				<td colspan="4"><input type="password" name="pass2" id="pass2"
					onchange="checkpass()">&nbsp;<span id="check"></span></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">이름</td>
				<td colspan="4"><input type="text" name="name"
					placeholder="이름" value="" title="이름은 반드시 입력하세요" required /></td>
			</tr>

			<tr>
				<td bgcolor="#CCEEFF">이메일</td>
				<td colspan="4"><input type="text" name="email" id="email"
					placeholder="mail@gmail형식">&nbsp;<span id="check1"></span></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">생년월일</td>
				<td colspan="4"><input type="date" name="bay"></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">우편번호</td>
				<td colspan="4"><input type="text" name="PNum1" maxlength=3>-
					<input type="text" name="PNum2" maxlength=3></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">주소1</td>
				<td colspan="4"><input type="text" name="abress1"></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">주소2</td>
				<td colspan="4"><input type="text" name="abress2"></td>
			</tr>
			<tr>
				<td bgcolor="#CCEEFF">전화</td>
				<td colspan="4"><input type="text" name="Phone"></td>
			</tr>
		</table>
		<p align="center">
			<br> <input type="submit" value="확인" alian="center"> <input
				type="reset" value="다시입력" alian="center">
		</p>
	</form>
</body>
</html>