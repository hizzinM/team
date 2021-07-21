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
<link rel="stylesheet" href="/resources/css/board/reviewenroll.css">
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>

	<div id="contents">
		<div id="table-wrap">
			<h1>리뷰 작성</h1>
			<form action="/board/reviewenroll" method="post">
				<table id="review-table">
					<tbody>
						<tr>
							<td>제목</td>
							<td><input name="reviewTitle" class="text-frame"></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><input name="productName" class="text-frame"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<c:if test="${loginuser == null }">
								<td><input name="userId" class="text-frame userId_box"
									value="비회원" readonly></td>
							</c:if>
							<c:if test="${loginuser != null }">
								<td><input name="userId" class="text-frame userId_box"
									value="${loginuser.userName}" readonly></td>
							</c:if>
						</tr>
						<tr>
							<td colspan="2"><textarea id="reviewBoard"
									name="reviewBoard" class="text-frame"></textarea> <script>
                                    var ckeditor_config = {
                                        resize_enaleb: false,
                                        enterMode: CKEDITOR.ENTER_BR,
                                        shiftEnterMode: CKEDITOR.ENTER_P,
                                        filebrowserUploadUrl: "주소임시"
                                    };
                                    CKEDITOR.replace("reviewBoard", ckeditor_config);
                                </script></td>
						</tr>
						<tr>
							<td>이미지</td>
							<td><input type="file" id="productImg" name="productImg"
								style="height: 30px;" multiple="multiple" /></td>
						</tr>
					<tbody>
				</table>
				<div id="btn-box">
					<button class="button_style">등록</button>
				</div>
			</form>
		</div>
		<%@ include file="../include_collection/footer.jsp"%>
	</div>
	<script type="text/javascript">
		
		let form = $("#infoForm");
		let mForm = $("#modifyForm");
	
		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/board/notice");
			form.submit();
		});
	
		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});
	
		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/board/get");
			form.submit();
		});
	
		/* 삭제 버튼 */
		$("#delete_btn").on("click", function(e) {
			form.attr("action", "/board/delete");
			form.attr("method", "post");
			form.submit();
		});
				$("input[name='productImg']").on("change", function(e) {
				/* 이미지 존재시 삭제 */
				if ($(".imgDeleteBtn").length > 0) {
					deleteFile();
				}
				let formData = new FormData();
				let fileInput = $('input[name="productImg"]');
				let fileList = fileInput[0].files;
				let fileObj = fileList[0];
	
				/*
				if(!fileCheck(fileObj.name, fileObj.size)){
					return false;
				}*/
	
				formData.append("productImg", fileObj);
				$.ajax({
					url : '/mypage/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadImage(result);
					},
					error : function(result) {
						alert("이미지 파일이 아닙니다.");
					}
				});
			});
	
			/* var, method related with attachFile */
			let regex = new RegExp("(.*?)\.(jpg|png)$");
			let maxSize = 1048576; //1MB	
	
			function fileCheck(fileName, fileSize) {
	
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
	
				if (!regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
	
				return true;
	
			}
			/* 이미지 출력 */
			/*
			function showUploadImage(uploadResultArr) {
				/* 전달받은 데이터 검증 */
				if (!uploadResultArr || uploadResultArr.length == 0) {
					return
				}
				let uploadResult = $("#uploadResult");
				let obj = uploadResultArr[0];
				let str = "";
				let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g,
						'/')
						+ "/s_" + obj.uuid + "_" + obj.fileName);
	
				str += "<div id='result_card'>";
				str += "<img src='/display?fileName=" + fileCallPath + "'>";
				str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
				str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
				str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
				str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
				str += "<input type='hidden' name='imageList[0].imageId' value='1'>";
				str += "</div>";
				console.log(str)
				uploadResult.append(str);
			}
	
			/* 이미지 삭제 버튼 동작 */
			$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
	
				deleteFile();
	
			});
	
			/* 파일 삭제 메서드 */
			function deleteFile() {
	
				let targetFile = $(".imgDeleteBtn").data("file");
	
				let targetDiv = $("#result_card");
	
				$.ajax({
					url : '/mypage/deleteFile',
					data : {
						fileName : targetFile
					},
					dataType : 'text',
					type : 'POST',
					success : function(result) {
						console.log(result);
	
						targetDiv.remove();
						$("input[type='file']").val("");
	
					},
					error : function(result) {
						console.log(result);
	
						alert("파일을 삭제하지 못하였습니다.")
					}
				});
			}
	</script>
</body>
</html>