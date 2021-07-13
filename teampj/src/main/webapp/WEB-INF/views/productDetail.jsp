<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
    <title>상품개별조회</title>

<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/common-style/productdetail.css">
<style type="text/css">
.goodsimg{
    width:550px;
    height: 700px;    
}
.size{
	 width:775px;
    height: 320px;   
}
</style>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<h1>
			<a href="/main">MINPARKANG</a>
		</h1>
		<div id="s_nav">
			<ul>
				<!-- 로그인 전 -->
				<c:if test="${loginuser == null }">
					<li><a href="/member/login">로그인</a></li>
					<li><a href="/member/join">회원가입</a></li>
					<br>
				</c:if>

				<!-- 로그인 후 -->
				<c:if test="${ loginuser!= null }">
					<li style="font-weight: bold; font-size: 11px;">${loginuser.userName}님
						어서오세요.</li>
					<br>
					<br>
					<li><a href="/member/logout">로그아웃</a></li>
					<li><a href="/mypage/myindex">마이페이지</a></li>
					<c:if test="${ loginuser.adminck ==0 }">
						<li>    </li>
					</c:if>
					<c:if test="${ loginuser.adminck ==1 }">
						<li><a href="/admin/index">관리자화면</a></li>
					</c:if>
				</c:if>
				<br>
				<li><a href="#">배송조회</a></li>
				<li><a href="#">장바구니</a></li>
				<li><a href="#">리뷰</a></li>
				<li><a href="#">고객센터</a></li>
				<br>
			</ul>
		</div>
		<div id="s_category">
			<ul>
				<%@ include file="navigation.jsp"%>
			</ul>

		</div>
		<div class="search_wrap">
			<div class="search_area">
				<form action="/search" method="get">
					<input type="text" name="keyword" id="search"
						value="${pageMaker.cri.keyword }" placeholder="Store item search">
					<button>Search</button>
				</form>
			</div>
		</div>
		<br>
		<div id="s_footer">
			<h1>고객센터 1522-4953</h1>
			<br>
			<p>
				MON-FRI AM 11:00 – PM 6:00<br> LUNCH TIME PM 13:00 – 14:00<br>
				SAT.SUN.HOLIDAY OFF<br>
			</p>
			<br>
			<h1>은행정보</h1>
			<br>
			<p>
				농협 123-4567-8910-12<br> 국민 9876-54-3210<br> 예금주 : (주) 민박강
			</p>
		</div>
	</div>
    <div id="contents">
    
        <div id="prodct-ex_warp">
            <div>

                <img src="/resources/upload/${goodDetailData.uploadPath}/${goodDetailData.uuid}_${goodDetailData.fileName}" alt="" class="goodsimg">
            </div><br>
            <div>
            	<p>사이즈가이드:</p>
                <img src="/resources/upload/${goodDetailData.uploadPath2}/${goodDetailData.uuid2}_${goodDetailData.fileName2}" alt="" class="size">

            </div>
            <div id="detail_warp">
            
                <table>
                    <tr>
                        <td>제품 번호</td>
                        <td><c:out value="${goodDetailData.productId}"/></td>
                    </tr>
                    <tr>
                        <td>제품명</td>
                        <td><c:out value="${goodDetailData.productName}" /></td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><c:out value="${goodDetailData.productPrice}" /></td>
                    </tr>
                    <tr>
                        <td>카테고리</td>
                        <td><c:out value="${goodDetailData.productCategory}" /></td>
                    </tr>
                    <tr>
                        <td>사이즈</td>
                        <td><c:out value="${goodDetailData.productSize}" /></td>
                    </tr>
                    <tr>
                        <td>색상</td>
                        <td><c:out value="${goodDetailData.productColor}" /></td>
                    </tr>
                    <tr>
                        <td>재고</td>
                        <td><c:out value="${goodDetailData.productInventory}" /></td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td><select name="amount">
   							 <c:forEach begin="1" end="10" var="i">
       						 <option value="${i}">${i}</option>
   								 </c:forEach>
							</select></td>
                    </tr>
                    <tr>
                        <td colspan="2">상품 설명</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea class="textarea_style" rows="10" cols="115%" readonly>
                                <c:out value="${goodDetailData.productComment}" />
                            </textarea>
                        </td>
                    </tr>
                  
                </table>
                <div id="btn-warp">		
             	
                   	<input type="submit" class="button_style cart_btn" value="장바구니에 담기">
                  
					<input type="button" class="button_style back_btn" value="이전으로 이동" onclick="history.back()">
					
                </div>
            </div>
        </div>
  	
        <div id="footer">
            <div class="footer-text">
                <p>고객센터</p>
                <p>1522-4953</p>
                <p>Mon-Fri AM 11:00 – PM 6:00</p>
                <p>Lunch time PM 13:00 – 14:00</p>
                <p>Sat.Sun.Holiday OFF</p>
                <p>은행정보</p>
                <p>농협 317-0011-4079-11</p>
                <p>국민 242437-04-006967</p>
                <p>예금주 : (주) 모던이프</p>
            </div>
            <div class="footer-text">
                <P>주식회사 모던이프</P>
                <p>대표이사 : 장재원 | 이메일 : modernif.co.kr@gmail.com</p>
                <p>16490 경기도 수원시 팔달구 인계동 1031-2 성지빌딩 701호 모던이프</p>
                <p>사업자등록번호 : 8858800485 [사업자정보확인] | 통신판매업신고번호 : 2017-수원팔달-0059호</p>
                <p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수
                    있습니다. KG 이니시스 [서비스 가입사실 확인]</p>
            </div>
        </div>
    </div>
  
   
   
   
   
</body>

</html>