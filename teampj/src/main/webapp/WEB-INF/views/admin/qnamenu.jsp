<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<div id="h_nav">
			<h1>MINPARKANG</h1>
			<div id="uesr_area">
				<h1>관리자님</h1>
				<h1>어서오세요</h1>
			</div>
			<ul>
				<li><a href="/main" class="btn-style">MAIN</a></li>
				<li><a href="/member/logout.do" class="btn-style">LOGOUT</a></li>
			</ul>
		</div>
		<nav>
			<%@ include file="include/aside.jsp"%>
		</nav>
	</header>
	<div id="content">
		<div id="table-wrap">
			<h1>문의 관리</h1>
			<div id="table-frame">
				미답변 문의를 모아볼수 있습니다.<br>
				<table>
					<thead>
						<tr>
							<th>문의번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일자</th>
						</tr>
					</thead>
					<!-- 메인오더를 질문관련으로 수정  
					<c:forEach items="${noAnQu}" var="noAnQu">
						<tr>
							<td><a href="/admin/orderAdminDetail?n=${noAnQu.userId}">
									<c:out value="${noAnQu.userId}" />
							</a></td>
							<td><c:out value="${noAnQu.bno}" /></td>
							<td><c:out value="${noAnQu.qnaTitle}" /></td>
							<td><c:out value="${noAnQu.userId}" /></td>
							<td><c:out value="${noAnQu.qnaWritedate}" /></td>-->
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>