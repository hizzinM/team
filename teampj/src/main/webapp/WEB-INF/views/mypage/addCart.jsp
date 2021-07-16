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
		<h2 style="text-align:center;">장바구니</h2>
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
							<td><a href="/mypage/cartUpdate?cartId=${cartList.cartId}"><c:out value="${cartList.cartId}" /></a></td>	
							<td><c:out value="${cartList.userId}" /></td>
							<td><img src="/resources/upload/${cartList.uploadPath}/${cartList.uuid}_${cartList.fileName}" width="200px" height="200px"></td>
							<td><c:out value="${cartList.productId}" /></td>
							<td><c:out value="${cartList.productName}" /></td>
							<td><c:out value="${cartList.cartProductsize}" /></td>
							<td><c:out value="${cartList.cartProductColor}" /></td>
							<td><fmt:formatNumber pattern="###,###,###" value="${cartList.cartPrice}" />원</td>
							<td><c:out value="${cartList.cartQty}" /></td>				
							<td><fmt:formatNumber pattern="###,###,###" value="${cartList.cartPrice *cartList.cartQty}" />원
						 <input type="hidden" name="CartPrice" value="${cartList.cartPrice *cartList.cartQty}">
							</td>
							
						</tr>
						<c:set var="sum" value="${sum + (cartList.cartPrice *cartList.cartQty)}" />
					</c:forEach>
				</table><br>
				<p>카트ID번호 클릭하시면 수량 수정가능(10개까지),총합계 클릭하면 선택한 물품 전체가격확인가능</p>
		<div class="listResult">
 			<div class="sum">
  			<!--<a href="javascript:sjk()">총합계:</a><span id="sumsum"></span>원-->
  			총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
 			</div>
 			<div class="orderOpne">
  			<button type="button" id="orderOpne_bnt">주문 정보 입력</button>
 		</div>
	</div>
			<div class="orderInfo">
			 <form role="form" method="post" autocomplete="off" action="/mypage/order">
			    
			 <input type="hidden" name="orderPrice" value="${sum}"/>
			  
			 <input type="hidden" name="orderDetailId" value="0"/> 
			   
			  <c:forEach items="${cartList}" var="cartList" end="0">
			  <div class="inputArea">
			   <label for="">수령인 아이디</label>
			   <input type="text" name="userId" id="userId" required="required" value="${cartList.userId}">
			  </div>
			  
			  <div class="inputArea">
			   <label for="orderPhon">수령인 연락처</label>
			   <input type="text" name="orderPhone" id="orderPhone" required="required" value="${cartList.phone}" />
			  </div>
			  
			  <div class="inputArea">
			   <label for="userAddr1">우편번호</label>
			   <input type="text" name="orderAddressNum" id="orderAddressNum" required="required" value="${cartList.addressNum}"  />
			  </div>
			  
			  <div class="inputArea">
			   <label for="userAddr2">1차 주소</label>
			   <input type="text" name="orderAddress" id="orderAddress" required="required" value="${cartList.address}"  />
			  </div>
			  
			  <div class="inputArea">
			   <label for="userAddr3">2차 주소</label>
			   <input type="text" name="orderAddressDetail" id="orderAddressDetail" required="required" value="${cartList.addressDetail}"  />
			  </div>
			  
			  <div class="inputArea">
			   <button type="submit" class="orderinsert_btn">주문</button>
			   <button type="button" class="cancel_btn">취소</button>
			  
			  </div>
			  </c:forEach>
			 </form>
			  
			</div>
				<!--물건 삭제 버튼-->
				
			<input type="button" value="물건삭제" class="deletebutton button_style delete_btn" onclick="deleteValue()">
				

		</div>
		
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	<script>

	/*전체선택*/
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
	/*총합계*/
	function sjk(){
		//alert(1)
		//$("#sumsum").html("1111");
		var list = $("input[name='RowCheck']");
		var CartPrice = $("input[name='CartPrice']");
		var sum=0
		
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
				sum = Number(sum) + Number(CartPrice[i].value)
				
			}
			
		}
		sum=sum.toLocaleString();
		$("#sumsum").html(sum);
		
	}
	/*상품삭제*/
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
					console.log(jdata)
					if (jdata = 1) {
						alert("삭제 성공");
						location.replace("/mypage/addCart")
					} 
					else{
						alert("삭제 실패");
					}
				}
			});
		}
	
	}
		$("#orderOpne_bnt").click(function(){
		  $(".orderInfo").slideDown();
		  $(".orderOpne_bnt").slideUp();
		 });      
	
	   $(".cancel_btn").click(function(){
			 $(".orderInfo").slideUp();
			 $(".orderOpne_bnt").slideDown();
			});      
	
	</script>
</body>
</html>