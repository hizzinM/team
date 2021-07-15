<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/mypage/addCart.css">

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div id="table-frame">
			<h1>장바구니</h1>
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id=allCheck /></th>
						<th>상품이미지</th>
						<th>유저ID</th>
						<th>카트ID</th>
						<th>상품ID</th>
						<th>상품명</th>
						<th>상품사이즈</th>
						<th>상품색상</th>
						<th>가격</th>
						<th>주문수량</th>
						<th>총가격</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="sum" value="0" />
					<c:forEach items="${cartList}" var="cartList">
						<tr>
							<td><input type="checkbox" name="RowCheck" class="RowCheck" value="${cartList.cartId}"></td>
							<td><img src="/resources/upload/${cartList.uploadPath}/${cartList.uuid}_${cartList.fileName}" width="120px" height="140px"></td>
							<td>
								<c:out value="${cartList.userId}" />	
							</td>	
							<td>
								<a href="/mypage/cartUpdate?cartId=${cartList.cartId}">
									<c:out value="${cartList.cartId}" />
								</a>
							</td>
							<td>
								<c:out value="${cartList.productId}" />
							</td>
							<td>
								<c:out value="${cartList.productName}" />
							</td>
							<td>
								<c:out value="${cartList.cartProductsize}" />
							</td>
							<td>
								<c:out value="${cartList.cartProductColor}" />
							</td>
							<td>
								KRW<c:out value="${cartList.cartPrice}" />
							</td>
							<td>
								<c:out value="${cartList.cartQty}" />
	
							</td>
							<td>
								<c:out value="${cartList.cartPrice *cartList.cartQty}" />
							</td>
						</tr>
						<c:set var="sum" value="${sum + (cartList.cartPrice *cartList.cartQty)}" />
					</c:forEach>

				</table><br>
				<p>카트ID번호 클릭하시면 수량 수정가능(10개까지),총합계 클릭하면 선택한 물품 전체가격확인가능</p>
		<div class="listResult">
 			<div class="sum">
  			<a href="javascript:sjk()">총합계:</a><span id="sumsum"></span>원
 			</div>
 			<div class="orderOpne">
  			<button type="button" id="orderOpne_bnt">주문 정보 입력</button>
  			<script>
			 $("#orderOpne_bnt").click(function(){
			  $(".orderInfo").slideDown();
			  $(".orderOpne_bnt").slideUp();
			 });      
			</script>
 		</div>
	</div>
			<div class="orderInfo">
			 <form role="form" method="post" autocomplete="off">
			    
			  <input type="hidden" name="amount" value="${sum}" />
			    
			  <div class="inputArea">
			   <label for="">수령인</label>
			   <input type="text" name="orderRec" id="orderRec" required="required" />
			  </div>
			  
			  <div class="inputArea">
			   <label for="orderPhon">수령인 연락처</label>
			   <input type="text" name="orderPhon" id="orderPhon" required="required" />
			  </div>
			  
			  <div class="inputArea">
			   <label for="userAddr1">우편번호</label>
			   <input type="text" name="userAddr1" id="userAddr1" required="required" />
			  </div>
			  
			  <div class="inputArea">
			   <label for="userAddr2">1차 주소</label>
			   <input type="text" name="userAddr2" id="userAddr2" required="required" />
			  </div>
			  
			  <div class="inputArea">
			   <label for="userAddr3">2차 주소</label>
			   <input type="text" name="userAddr3" id="userAddr3" required="required" />
			  </div>
			  
			  <div class="inputArea">
			   <button type="submit" class="orderinsert_btn">주문</button>
			   <button type="button" class="cancel_btn">취소</button>
			   <script>
			   $(".cancel_btn").click(function(){
					 $(".orderInfo").slideUp();
					 $(".orderOpne_bnt").slideDown();
					});      
			   </script>
			  </div>
			 </form> 
			</div>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">카트ID번호 클릭하시면 수량 수정 가능(10개까지)</td>
						<td colspan="5">총 합계 : KRW <fmt:formatNumber pattern="###,###,###" value="${sum}" /></td>
					</tr>
				<tfoot>
			</table>
			<div class="btn-frame">
				<button type="button" class="button_style">주문 정보 입력</button>

				<!--물건 삭제 버튼-->

				
			<input type="button" value="물건삭제" class="deletebutton button_style delete_btn">
				

				<input type="button" value="물건삭제" class="button_style delete_btn"
					onclick="deleteValue();">
			</div>

		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	<script>
		/*상품 삭제*/
		$(function () {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;

			$("input[name='allCheck']").click(function () {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function () {
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
					url: "/mypage/deleteAddCart", // 전송 URL
					type: 'GET', // GET or POST 방식
					traditional: true,
					data: {
						valueArr: valueArr
						// 보내고자 하는 data 변수 설정
					},
					success: function (jdata) {
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

	
	}
	
	
	
	

	</script>
</body>
</html>