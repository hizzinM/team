<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<link rel="stylesheet" href="/resources/css/admin/index.css">
<meta charset="UTF-8">
<title>상품관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="top_gnb_area">
		<ul class="list">
			<li><a href="/main">메인 페이지</a></li>
			<li><a href="/member/logout.do">로그아웃</a></li>
		</ul>
	</div>
	<section id="container">
		<aside>
			<%@ include file="include/aside.jsp"%>
		</aside>


		<section id=content>
			<div id=title align="center">
				<h2>상품등록</h2>
			</div>
			<div align="center">
				<br> <br>
				<form action="/admin/goodsmenu" method="post" id="enrollForm">

					<div class="form_section">
						<label> </label> <input name="productId" value="0" hidden="">
					</div>
					<div class="form_section">
						<label>옷 이름</label> <input name="productName">
					</div>
					<div class="form_section">
						<label>옷 가격</label> <input name="productPrice">
					</div>
					<div class="form_section">
						<label>옷사이즈</label> <input name="productSize">
					</div>
					<div class="form_section">
						<label>옷 색깔</label> <input name="productColor">
					</div>
					<div class="form_section">
						<label>상품 재고</label> <input name="productInventory">
					</div>
					<br>
					<div class="form_section">
                    		<div class="form_section_title">
                    			<label>상품 이미지</label>
                    		</div>
                    		<div class="form_section_content">
                    		<input type="file" id ="productImg" name='uploadFile' style="height: 30px;">
							<div id="uploadResult">
							  <!-- <div id="result_card">
								<div class="imgDeleteBtn">x</div>
								<img src="\resources\img\Logo.PNG">
								</div> -->
							       </div>		
                    			</div>
                    		</div>  
					<div class="btn_section">
						<button id="cancelBtn" class="btn">취 소</button>
						<button id="enrollBtn" class="btn enroll_btn">등 록</button>
					</div>
			</div>
			
			</form>
		</section>
		<script>
			let enrollForm = $("#enrollForm")

			/* 취소 버튼 */
			$("#cancelBtn").click(function() {

				location.href = "redirect:/admin/goodsmenu"

			});

			/* 상품 등록 버튼 */
			$("#enrollBtn").on("click", function(e) {

				e.preventDefault();

				enrollForm.submit();

			});
			/* 이미지 업로드 */
			$("input[type='file']").on("change", function(e){
				/* 이미지 존재시 삭제 */
				if($(".imgDeleteBtn").length > 0){
					deleteFile();
				}
				let formData = new FormData();
				let fileInput = $('input[name="uploadFile"]');
				let fileList = fileInput[0].files;
				let fileObj = fileList[0];
				
				/*
				if(!fileCheck(fileObj.name, fileObj.size)){
					return false;
				}*/
				
				formData.append("uploadFile", fileObj);
				$.ajax({
					url: '/admin/uploadAjaxAction',
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
					url: '/admin/deleteFile',
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