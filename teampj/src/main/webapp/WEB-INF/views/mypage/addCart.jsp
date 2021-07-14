<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>minparkang</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/mypage/addCart.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">

		<div class="product-list">
			
			<table style="border:1px black solid;">
					<thead> 
						<tr>
							<th><input type="checkbox" name="allCheck" id=allCheck /></th>
							<th>카트ID</th>
							<th >유저ID</th>
							<th>상품이미지</th>
							<th>상품ID</th>
							<th>상품명</th>
							<th>상품사이즈</th>
							<th>상품색상</th>
							<th>가격</th>
							<th>주문수량</th>
							<th>총가격</th>
						</tr>
					</thead>
					<c:set var="sum" value="0" />
					<c:forEach items="${cartList}" var="cartList">
						<tr>
							<td><input type="checkbox" name="RowCheck" class="RowCheck" value="${cartList.cartId}" ></td>
							<td><c:out value="${cartList.cartId}" /></td>	
							<td><c:out value="${cartList.userId}" /></td>
							<td><img src="/resources/upload/${cartList.uploadPath}/${cartList.uuid}_${cartList.fileName}" width="200px" height="200px"></td>
							<td><c:out value="${cartList.productId}" /></td>
							<td><c:out value="${cartList.productName}" /></td>
							<td><c:out value="${cartList.cartProductsize}" /></td>
							<td><c:out value="${cartList.cartProductColor}" /></td>
							<td><c:out value="${cartList.cartPrice}" />원</td>
							<td><c:out value="${cartList.cartQty}" /></td>
							
							<td><c:out value="${cartList.cartPrice *cartList.cartQty}" />원</td>
						</tr>
						<c:set var="sum" value="${sum + (cartList.cartPrice *cartList.cartQty)}" />
					</c:forEach>
				</table><br>
				<div class="listResult">
 			<div class="sum">
  			총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
 				</div>
 			<div class="orderOpne">
  			<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
 			</div>
				</div>
			<input type="button" value="주문하기" class="deletebutton button_style order_btn">
				<!--물건 삭제 버튼-->
				
			<input type="button" value="물건삭제" class="deletebutton button_style delete_btn" onclick="deleteValue();">
				

		</div>
		
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	<script>
	/*상품 삭제*/
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
		var url = "/mypage/deleteAddCart"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
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
				url : "/mypage/deleteAddCart", // 전송 URL
				type : 'GET', // GET or POST 방식
				traditional : true,
				data : {
					valueArr : valueArr
				// 보내고자 하는 data 변수 설정
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("삭제 성공");
						location.replace("/mypage/addCart")
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