<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문수정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/mypage/myindex.css">
<link rel="stylesheet" href="/resources/css/mypage/orderlist.css">
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
		<h1>주 문 정 보 변 경</h1>
		<div class="table-frame">  
			<form action="/mypage/orderupdate" method="post"> 
				<table class="order-wrap">
					<thead>
						<tr>
							<th>카트ID</th>
							<th>수령인</th>
							<th>수령인 연락처</th>
							<th>주소</th>
							<th>주소2</th>
							<th>우편번호</th>
							
						</tr>
					</thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" class="text-style" name="orderId" value="${order.orderId}" readonly="readonly"/>
                            </td>
                            <td>
                                <input type="text" class="text-style" name="userName" value="${order.userName}"/>
                            </td>
                            <td>
                                <input type="text" class="text-style" name="orderPhone"  value="${order.orderPhone}"/>
                            </td>
                            <td>
                                <input type="text" class="text-style" name="orderAddress"  value="${order.orderAddress}"/>
                            </td>
                            <td>
                                <input type="text" class="text-style" name="orderAddressDetail"  value="${order.orderAddressDetail}"/>
                            </td>
                            <td>
                                <input type="text" class="text-style" name="orderAddressNum"  value="${order.orderAddressNum}"/>
                            </td>
                        </tr>
                    </tbody>
				</table>
                <div class="btn-box">
				    <input type="submit" class="button_style" value="수정하기">
                </div>
			</form>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>

</body>
</html>