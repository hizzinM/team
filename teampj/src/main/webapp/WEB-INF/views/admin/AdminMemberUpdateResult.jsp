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
<title>회원수정결과</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<body>
<div class="top_gnb_area">
		<ul class="list">
			<li><a href="/main">메인 페이지</a></li>
			<li><a href="/member/logout.do">로그아웃</a></li>
		</ul>
	</div>
	<div class="table_wrap">
		<section id="container">
			<aside>
				<%@ include file="include/aside.jsp"%>
			</aside>
			<div>&nbsp;</div>
			<div class="table_wrap">
				<div id=title align="center">
					<h2>회원수정결과</h2>
				</div>
				<div align="center">
					<table>
						<thead>
							<tr>
								
								<th class="username_width">회원명</th>
								<th class="userid_width">ID</th>
								<th class="userphone_width">연락처</th>
								<th class="useremail_width">이메일</th>
								<th class="useraddress_width">주소</th>
								<th class="useregdate_width">가입일자</th>
								<th class="useregdate_width">예금주</th>
								<th class="useregdate_width">거래은행</th>
								<th class="useregdate_width">계좌번호</th>
							</tr>
						</thead>
							<tr>
								<td><c:out value="${profile.userName}"/></td>
								<td><c:out value="${profile.userId}"/></td>
								<td><c:out value="${profile.phone}" /></td>
								<td><c:out value="${profile.email}" /></td>
								<td><c:out value="${profile.addressNum}" />&nbsp;<c:out
										value="${profile.address}" />&nbsp;<c:out
										value="${profile.addressDetail}" /></td>
								<td><fmt:formatDate value="${profile.regDate}"
										pattern="yyyy년MM월dd일 HH시mm분" /></td>
								<td><c:out value="${profile.accountName}" /></td>
								<td><c:out value="${profile.accountBank}" /></td>
								<td><c:out value="${profile.accountNum}" /></td>
							</tr>
					</table>
				  </div>
			   </div>
			</section>
		</div>
	
</body>
</html>