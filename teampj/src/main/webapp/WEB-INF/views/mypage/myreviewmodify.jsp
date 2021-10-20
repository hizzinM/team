<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>minparkang</title>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/mypage/myreviewmodify.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="side_navigation">
		<%@ include file="../include_collection/navigation.jsp"%>
	</div>
	<div id="contents">
		<div id="table-wrap">
			<h1>리뷰 수정</h1>
			<form id="modifyForm" action="/mypage/myreviewmodify" method="post">
				<table id="review-table">
					<tbody>
						<tr>
							<td>제목</td>
							<td><input name="reviewTitle" class="text-frame"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="userName" class="text-frame userId_box"
								value="${loginuser.userName}" readonly></td>
						</tr>
						<tr>
							<td colspan="2"><textarea id="reviewBoard" name="reviewBoard" class="text-frame"></textarea> 
								<script>
									var ckeditor_config = {
										resize_enaleb : false,
										enterMode : CKEDITOR.ENTER_BR,
										shiftEnterMode : CKEDITOR.ENTER_P,
										filebrowserUploadUrl : "주소임시"
									};
									CKEDITOR.replace("reviewBoard", ckeditor_config);
								</script>
							</td>
						</tr>
						<tr>
							<td>이미지</td>
							<td>
								<input type="file" id="productImg" name='productImg' style="height: 30px;" multiple="multiple" />
								<div id="uploadResult"></div>
							</td>
						</tr>
					<tbody>
				</table>
				
				<div class="btn_wrap">
					<button id="list_btn" class="button_style">목록 페이지</button>
					<button id="modify_btn" class="button_style">수정 완료</button>
				<!-- <button id="delete_btn" class="button_style">삭제</button> -->
					<button id="cancel_btn" class="button_style">수정 취소</button>
				</div>
				<input type="hidden" name='reviewId' value="${MyreviewInfo.reviewId}">
			</form>
			
			<form id="infoForm" action="/mypage/myreviewmodify" method="get">
				<input type="hidden" id="rno" name="rno" value='<c:out value="${MyreviewInfo.reviewId}"/>'> 
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'> 
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			</form>
		</div>
		<div>
			<%@ include file="../include_collection/footer.jsp"%>
		</div>
	</div>
	<script>
		let form = $("#infoForm");
		let mForm = $("#modifyForm");

		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e) {
			form.find("#rno").remove();
			form.attr("action", "/mypage/myreview");
			form.submit();
		});

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/mypage/myreviewget");
			form.submit();
		});

		/* 삭제 버튼 */
		$("#delete_btn").on("click", function(e) {
			form.attr("action", "/mypage/myreviewdelete");
			form.attr("method", "post");
			form.submit();
		});
		</script>
		
		<script>
		/* 이미지 업로드(상품대표이미지) */
		$("input[name='productImg']").on("change", function(e){
			
			/* 이미지 존재시 삭제 */
			if($(".imgDeleteBtn").length > 0){
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
				url: '/board/uploadAjaxAction',
		    	processData : false,
		    	contentType : false,
		    	data : formData,
		    	type : 'POST',
		    	dataType : 'json',
		    	success : function(result){
		    		console.log(result);
		    		showUploadImage(result);
		    	},
		    	error : function(result){
		    		alert("이미지 파일이 아닙니다.");
		    	}
			});	
		});
		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;		
			
		}
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr){
			
			/* 전달받은 데이터 검증 */
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			let uploadResult = $("#uploadResult");
			let obj = uploadResultArr[0];
			let str = "";
			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
			
			str += "<div id='result_card'>";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";
			
			uploadResult.append(str);     
		}
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			
			deleteFile();
			
		});
		/* 파일 삭제 메서드 */
		function deleteFile(){
			
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/board/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					targetDiv.remove();
					$("input[type='file']").val("");
					
				},
				error : function(result){
					console.log(result);
					
					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
		
	</script>
</body>
</html>