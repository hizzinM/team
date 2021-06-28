<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<div>
		<div>
			<form action="/member/findidAfter" method="post">
				<div>
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>Email</label>
						<input class="w3-input" type="text" id="email" name="email" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn>find</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>