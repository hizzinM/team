<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/admin/index.css">

<meta charset="UTF-8">
<title>공지관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
td, th {
	border: 1px solid black;
	height: 50px;
}

th {
	font-size: 17px;
}
</style>

</head>

<body>
	<div class="top_gnb_area">
		<ul class="list">
			<li><a href="/main">메인 페이지</a></li>
			<li><a href="/member/logout.do">로그아웃</a></li>
		</ul>
	</div>
	<section id="container">

		<aside>
			<%@ include file="include/aside.jsp"%>
		</aside>

		<div id="container_box" align="center">
			<div>&nbsp;</div>
			<h2>상품관리</h2>
		</div>
		<div align="center">

			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id=allCheck /></th>
						<th class="username_width">ID</th>
						<th class="userid_width">상품이미지</th>
						<th class="userphone_width">상품명</th>
						<th class="useremail_width">가격</th>
						<th class="useraddress_width">사이즈</th>
						<th class="useregdate_width">색깔</th>
						<th class="useregdate_width">재고</th>

					</tr>
				</thead>
				<c:forEach items="${productList}" var="product">
					<tr>
						<td><input type="checkbox" name="RowCheck" class="RowCheck"
							value="${product.productId}"></td>
						<td><a href="/admin/Update?productId=${product.productId}"><c:out
									value="${product.productId}"></c:out></a></td>
						<td><img
							src="/resources/upload/${product.uploadPath}/${product.uuid}_${product.fileName}"
							width="200px" height="200px"></td>
						<td><c:out value="${product.productName}" /></td>
						<td><c:out value="${product.productPrice}" /></td>
						<td><c:out value="${product.productSize}" /></td>
						<td><c:out value="${product.productColor}" /></td>
						<td><c:out value="${product.productInventory}" /></td>
					</tr>
				</c:forEach>
			</table>
			<br> <input type="button" value="물건삭제" class="deletebutton"
				onclick="deleteValue();">
		</div>
	</section>
	<script type="text/javascript">
		/*회원삭제*/
		$(function() {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;

			$("input[name='allCheck']").click(function() {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function() {
				if ($("input[name='RowCheck']:checked").length == rowCnt) {
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue() {
			var url = "/admin/delete"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0) {
				alert("선택된 글이 없습니다.");
			} else {
				var chk = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url : "/admin/delete", // 전송 URL
					type : 'GET', // GET or POST 방식
					traditional : true,
					data : {
						valueArr : valueArr
					// 보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("삭제 성공");
							location.replace("/admin/goodsmanage")
						} else {
							alert("삭제 실패");
						}
					}
				});
			}
		}
	</script>



</body>
</html>