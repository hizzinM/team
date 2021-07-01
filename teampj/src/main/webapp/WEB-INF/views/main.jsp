<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>minparkang</title>
    <link rel="stylesheet" href="/resources/css/common-style/reset.css">
    <link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
    <link rel="stylesheet" href="/resources/css/common-style/contents.css">
    <link rel="stylesheet" href="/resources/css/main.css" >
    <link rel="stylesheet" href="/resources/css/member/join.css">
</head>
<body>
    <header>
        <nav>
            <!--
            <ul>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">언어설정</a></li>
            </ul>
            -->
        </nav>
    </header>
    <div id="side_navigation">
        <h1><a href="setup-finish.html">MINPARKANG</a></h1>
        <div id="s_nav">
            <ul>
                <!--<li>{$} 님 환영합니다.</li>-->
                <li><a href="/member/login">로그인</a></li>
                <!--<li><a href="/member/logout">로그아웃</a></li>-->
                <li><a href="/member/join">회원가입</a></li>
                <li><a href="/mypage/myindex">마이페이지</a></li>
                <li><a href="#">배송조회</a></li>
                <br>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">리뷰</a></li>
                <li><a href="#">고객센터</a></li><br>
            </ul>
        </div>
        <div id="s_category">
            <ul>
                <li>Outer</li>
                <li>Top</li>
                <li>Shirts</li>
                <li>Pants</li>
                <li>Suit</li>
                <li>Bag/Shose</li>
                <li>Acc</li>
                <li>Sale</li>
            </ul>

        </div>
        <div id ="s_footer">
            <h1>고객센터　1522-4953</h1><br>
            <p>
                MON-FRI AM 11:00 – PM 6:00<br>
                LUNCH TIME PM 13:00 – 14:00<br>
                SAT.SUN.HOLIDAY OFF<br>
            </p><br>
            <h1>은행정보</h1><br>
            <p>
                농협 123-4567-8910-12<br>
                국민 9876-54-3210<br>
                예금주 : (주) 민박강
            </p>
        </div>
        <div id="s_search">
            <form action="">
                <input type="text" id="search"name="">
            </form>
        </div>
    </div>
    <div id="contents">
        <h1>BEST SELLER</h1>
        <div class="side-img">
            <img src="../images/pic_1.jpg" alt="">
            <img src="../images/pic_2.jpg" alt="">
            <img src="../images/pic_3.jpg" alt="">
        </div>
        <h1>NEW ARRIVALS & RESTOCK</h1>
        <div class="side-img">
            <img src="../images/pic_1.jpg" alt="">
            <img src="../images/pic_2.jpg" alt="">
            <img src="../images/pic_3.jpg" alt="">
        </div>
        <div class="product-list">
            <ul>
                <li>
                    <a href=""><img src="../images/bimg01.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg02.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg03.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg04.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
            </ul>
            <ul>
                <li>
                    <a href=""><img src="../images/bimg01.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg02.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg03.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg04.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
            </ul>
            <ul>
                <li>
                    <a href=""><img src="../images/bimg01.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg02.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg03.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg04.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
            </ul>
            <ul>
                <li>
                    <a href=""><img src="../images/bimg01.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg02.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg03.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg04.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
            </ul>
            <ul>
                <li>
                    <a href=""><img src="../images/bimg01.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg02.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg03.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
                <li>
                    <a href=""><img src="../images/bimg04.jpg" alt=""></a>
                    <a href=""><h1>상품명</h1></a>
                    <hr>
                    <p>상품 가격</p>
                    <p>리뷰 개수</p>
                </li>
            </ul>
        </div>
        <div id="footer">
            <div class="footer-text">
                <p>고객센터</p>
                <p>1522-4953</p>
                <p>Mon-Fri AM 11:00 – PM 6:00</p>
                <p>Lunch time PM 13:00 – 14:00</p>
                <p>Sat.Sun.Holiday OFF</p>
                <p>은행정보</p>
                <p>농협 123-4567-8910-11</p>
                <p>국민 123-4567-8910-11</p>
                <p>예금주 : (주) minparkang</p>
            </div>
            <div class="footer-text">
                <P>주식회사 minparkang</P>
                <p>대표이사 : 민박강 | 이메일 : minparkang@gmail.com</p>
                <p>16490 경기도 수원시 팔달구 인계8동</p>
                <p>사업자등록번호 : 123456789 | 통신판매업신고번호 : 2021-더조은-0000호</p>
                <p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수 있습니다.
                    KG 이니시스</p>
            </div>
        </div>
    </div>
                <!-- 
   					로그인 하지 않은 상태 
					<c:if test="${loginuser == null }">
						<div class="login_button">
							<a href="/member/login">로그인</a>
						</div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>
					로그인한 상태
					<c:if test="${ loginuser!= null }">
						<c:if test="${ loginuser.adminck ==1 }">
							<span><a href="/admin/index">관리자화면</a></span>
						</c:if>
						<div class="login_success_area">
							<span>회원 : ${loginuser.userName} 님<br> 어서오세요.
							</span><a href="/mypage/myindex">마이페이지</a>&nbsp;&nbsp;<a
								href="/member/logout">로그아웃</a>
						</div>
					</c:if> 
                -->
</body>
</html>