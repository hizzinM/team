<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
</head>
<body>
	<p class="cut">MY PAGE</p>
	<table class="mypage_table">
		<thead class="mypage_thead">
			<tr>
				<td colspan="5">나의 주문 처리 현황</td>
			</tr>
		</thead>
		<tbody class="mypage_mid">
			<tr>
				<td>입금전<br> 0
				</td>
				<td>배송준비중<br> 0
				</td>
				<td>배송중<br> 0
				</td>
				<td>배송완료 <br> 0
				</td>
				<td>취소 0<br> 교환 0<br> 반품 0
				</td>
			</tr>
		</tbody>
		<tfoot class="mypage_foot">
			<tr>
				<td><div>
						<a href="/member/">ORDER TRACKING<br>주문내역조회
						</a>
					</div></td>
				<td><div>
						<a href="/mypage/profile">PROFILE<br>회원정보
						</a>
					</div></td>
				<td><div>
						<a href="/member/">ADDRESS<br>배송 주소록 관리
						</a>
					</div></td>
				<td><div>
						<a href="/member/">WISHLIST<br>관심상품
						</a>
					</div></td>
				<td><div>
						<a href="/member/">BOARD<br>게시물관리
						</a>
					</div></td>
			</tr>
		</tfoot>
	</table>
	<br>

</body>
</html>
</html>