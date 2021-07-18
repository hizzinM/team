<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/mypage/myindex.css">
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
		<div class="table-frame">
			<h2>ORDER LIST</h2>
				<h3>주문번호 클릭시 상세정보 열람가능</h3>
			<table>
			  <thead>
			  	<tr>
				<td><input type="checkbox" name="allCheck" id=allCheck />전체선택</td>
				</tr>
			 </thead>
			<c:forEach items="${orderList}" var="orderList">
				<tbody>
				<tr>
					<td><input type="checkbox" name="RowCheck" class="RowCheck" value="${orderList.orderId}" >주문번호</td>
					<td><a href="/mypage/orderDetail?n=${orderList.orderId}"><c:out value="${orderList.orderId}"></c:out></a></td>
				</tr>
				<tr>
					<td>수령인아이디</td>
					<td><c:out value="${orderList.userId}"></c:out></td>
				</tr>
				<tr>
					<td>수령인</td>
					<td><c:out value="${orderList.userName}"></c:out></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td><c:out value="${orderList.orderPhone}"></c:out></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><c:out value="${orderList.orderAddressNum}"></c:out></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><c:out value="${orderList.orderAddress}"></c:out></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><c:out value="${orderList.orderAddressDetail}"></c:out></td>
				</tr>
				<tr>
					<td>총가격</td>
					<td><c:out value="${orderList.orderPrice}"></c:out></td>
				</tr>
				<tr>
					<td>주문날짜</td>
					<td><c:out value="${orderList.orderDate}"></c:out></td>
				</tr>
				</tbody>
			</c:forEach>
			
		</table>
			
			<div>
				<input type="button" value="주문취소" class="deletebutton button_style delete_btn" onclick="deleteValue()">
		</div>

		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	<script type="text/javascript">
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
	
	/*주문 취소*/
	function deleteValue() {
		var url = "/mypage/orderDelete"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
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
				url : "/mypage/orderDelete", // 전송 URL
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
						location.replace("/mypage/orderList")
					} 
					else{
						alert("삭제 실패");
					}
				}
			});
		}
	
	}
	
	
	
	
	
	
	</script>
	
	
	
	
	
</body>
</html>
