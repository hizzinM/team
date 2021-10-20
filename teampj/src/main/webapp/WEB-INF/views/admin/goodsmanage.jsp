<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>상품관리</title>
	<link rel="stylesheet" href="/resources/css/common-style/reset.css"> 
	<link rel="stylesheet" href="/resources/css/admin/goodsmanage.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
			<h1>상품 관리</h1>
			<!--상품 테이블-->
			<c:if test="${listcheck != 'empty'}">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
							<th>ID</th>
							<th>상품이미지</th>
							<th>사이즈 가이드</th>
							<th>상품명</th>
							<th>가격</th>
							<th>카테고리</th>
							<th>사이즈</th>
							<th>색깔</th>
							<th>재고</th>
						</tr>
					</thead>
					<c:forEach items="${produstList}" var="product">
						<tr>
							<td>
								<input type="checkbox" name="RowCheck" class="RowCheck" value="${product.productId}">
							</td>
							<td>
								<a href="/admin/Update?productId=${product.productId}">
									<c:out value="${product.productId}"></c:out>
								</a>
							</td>
							<td>
								<img src="/resources/upload/${product.uploadPath}/${product.uuid}_${product.fileName}" width="280px" height="300px" onerror="this.src='/resources/img/noimg.jpg'">
							</td>
							<td>
								<img src="/resources/upload/${product.uploadPath2}/${product.uuid2}_${product.fileName2}" width="200px" height="200px" onerror="this.src='/resources/img/noimg.jpg'">
							</td>
							<td>
								<c:out value="${product.productName}" />
							</td>
							<td>
								<c:out value="${product.productPrice}" />
							</td>
							<td>
								<c:out value="${product.productCategory}" />
							</td>
							<td>
								<c:out value="${product.productSize}" />
							</td>
							<td>
								<c:out value="${product.productColor}" />
							</td>
							<td>
								<c:out value="${product.productInventory}" />
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
			<!--물건 삭제 버튼-->
			<input type="button" value="물건삭제" class="deletebutton button_style delete_btn" onclick="deleteValue();">
	
			<!-- 상품 리스트 X -->

			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 상품이 없습니다.</div>
			</c:if>

			<!--검색-->
			<div class="search_wrap">
				<form id="searchForm" action="\admin\goodsmanage" method="get">
					<div class="search_input">
						<input type="text" name="keyword" class="text-frame" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'> 
						<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
						<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
						<input type="hidden" name="type" value="G">
						<button class='btn search_btn button_style'>검 색</button>
					</div>
				</form>
			</div>

			<!-- 페이지 이름 인터페이스 영역 -->
			<div class="pageMaker_wrap">
				<ul class="pageMaker">
					
					<!-- 이전 버튼 -->
					<c:if test="${pageMaker.prev }">
						<li class="pageMaker_btn prev"><a href="${pageMaker.startPage -1}">이전</a></li>
					</c:if>
	
					<!-- 페이지 번호 -->
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
						<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
	
					<!-- 다음 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageMaker_btn next">
							<a href="${pageMaker.endPage + 1 }">다음</a>
						</li>
					</c:if>
				</ul>
			</div>
	
			<form id="moveForm" action="\admin\goodsmanage" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
		</div>
	</div>

	<script type="text/javascript">
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');

		/* 상품 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});

		/*상품 삭제*/
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
			var url = "/admin/delete"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
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
					url : "/admin/delete", // 전송 URL
					type : 'GET', // GET or POST 방식
					traditional : true,
					data : {
						valueArr : valueArr
					// 보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("삭제 성공");
							location.replace("/admin/goodsmanage")
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