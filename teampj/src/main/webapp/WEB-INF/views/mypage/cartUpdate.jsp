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
		<div id="table-frame">
            <h1>수 량 변 경</h1>
			<form action="/mypage/cartUpdate" method="post"> 
				<table>
					<thead>
						<tr>
							<th>카트ID</th>
							<th>상품명</th>
							<th>수량</th>
						</tr>
					</thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" class="text-style" name="cartId" value="${cart.cartId}" readonly="readonly"/>
                            </td>
                            <td>
                                <input type="text" class="text-style" name="productName" value="${cart.productName}"readonly="readonly" />
                            </td>
                            <td>
                                <input type="number" class="text-style num-btn" name="cartQty" min="1" max="10" value="${cart.cartQty}"/>
                            </td>
                        </tr>
                    </tbody>
				</table>
                <div class="btn-frame">
				    <input type="submit" class="button_style" value="수정하기">
                </div>
			</form>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
</body>
</html>