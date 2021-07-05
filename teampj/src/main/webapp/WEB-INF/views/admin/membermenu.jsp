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
<title>회원관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
td, th {
	border: 1px solid black;
	height: 50px;
}

th {
	font-size: 17px;
}

.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

table {
	border-collapse: collapse;
	width: 1000px;
	margin-top: 20px;
	text-align: center;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}

.pageInfo_wrap {
	text-align: center;
}

.search_wrap {
	text-align: center;
}

.search_area {
	display: inline-block;
	margin-top: 30px;
	margin-left: 260px;
}

.search_area input {
	height: 30px;
	width: 250px;
}

.search_area button {
	width: 100px;
	height: 36px;
}
</style>
</head>
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
					<h2>회원관리</h2>
				</div>
				<div align="center">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" name="allCheck" id=allCheck /></th>
								<th class="username_width">회원명</th>
								<th class="userid_width">ID</th>
								<th class="userphone_width">연락처</th>
								<th class="useremail_width">이메일</th>
								<th class="useraddress_width">주소</th>
								<th class="useregdate_width">가입일자</th>
							</tr>
						</thead>
						<c:forEach items="${membermenu}" var="membermenu">
							<tr>
								<td><input type="checkbox" name="RowCheck" class="RowCheck"
									value="${membermenu.userId}"></td>


								<td><c:out value="${membermenu.userName}" /></td>
								<td><a href="/admin/Update2?userId=${membermenu.userId}"><c:out
											value="${membermenu.userId}"></c:out></a></td>
								<td><c:out value="${membermenu.phone}" /></td>
								<td><c:out value="${membermenu.email}" /></td>
								<td><c:out value="${membermenu.addressNum}" />&nbsp;<c:out
										value="${membermenu.address}" />&nbsp;<c:out
										value="${membermenu.addressDetail}" /></td>
								<td><fmt:formatDate value="${membermenu.regDate}"
										pattern="yyyy년MM월dd일 HH시mm분" /></td>

							</tr>
						</c:forEach>
					</table>
					<br> <input type="button" value="삭제" class="deletebutton"
						onclick="deleteValue();">
				</div>
				<div class="search_wrap">
					<div class="search_area">
						<select name="type">
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
							<option value="I"
								<c:out value="${pageMaker.cri.type eq 'I'?'selected':'' }"/>>회원ID</option>
							<option value="N"
								<c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>회원명</option>
							<option value="D"
								<c:out value="${pageMaker.cri.type eq 'D'?'selected':'' }"/>>가입일</option>
						</select> <input type="text" name="keyword"
							value="${pageMaker.cri.keyword }">
						<button>Search</button>
					</div>
				</div>
				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">
							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a
									href="${pageMaker.startPage-1}">Previous</a></li>
							</c:if>

							<!-- 페이지 번호 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
									href="${num}">${num}</a></li>
							</c:forEach>

							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a
									href="${pageMaker.endPage + 1 }">Next</a></li>
							</c:if>

						</ul>
					</div>
				</div>
			</div>
		</section>
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
		</form>

		<script>
			let moveForm = $("#moveForm");
			$(".pageInfo a").on(
					"click",
					function(e) {
						e.preventDefault();
						moveForm.find("input[name='pageNum']").val(
								$(this).attr("href"));
						moveForm.attr("action", "/admin/membermenu");
						moveForm.submit();
					});

			$(".search_area button").on("click", function(e) {
				e.preventDefault();

				let type = $(".search_area select").val();
				let keyword = $(".search_area input[name='keyword']").val();

				if (!type) {
					alert("검색 종류를 선택하세요.");
					return false;
				}

				if (!keyword) {
					alert("키워드를 입력하세요.");
					return false;
				}

				moveForm.find("input[name='type']").val(type);
				moveForm.find("input[name='keyword']").val(keyword);
				moveForm.find("input[name='pageNum']").val(1);
				moveForm.submit();
			});
		</script>


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
			function deleteValue() {
				var url = "/admin/userDelete"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
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
						url : "/admin/userDelete", // 전송 URL
						type : 'GET', // GET or POST 방식
						traditional : true,
						data : {
							valueArr : valueArr
						// 보내고자 하는 data 변수 설정
						},
						success : function(jdata) {
							if (jdata = 1) {
								alert("삭제 성공");
								location.replace("/admin/membermenu")
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
