
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
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/admin_frame.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<header>
		<div id="h_nav">
			<h1>MINPARKANG</h1>
			<div id="uesr_area">
				<h1><!--${loginuser.userName}님--> 관리자님</h1>
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
	<section id="container">
		<section id=content>
			<div id=title align="center">
				<h2>상품등록</h2>
			</div>
			<div align="center">
				<br> <br>
				<form action="/admin/goodsmenu" method="post" id="enrollForm" enctype="multipart/form-data">

					<div class="form_section">
						<label> </label> <input name="productId" value="0" hidden="">
					</div>
					<div class="form_section">
						<label>옷 이름:</label> <input name="productName">
					</div>
					<div class="form_section">
						<label>옷 가격:</label> <input name="productPrice">
					</div>
					<div class="form_section">
						<label>카테고리:</label><select name="productCategory">
						<option value="Outer">Outer</option>
						<option value="Top">Top</option>
						<option value="Shirts">Shirts</option>
						<option value="Pants">Pants</option>
						<option value="Suit">Suit</option>
						<option value="Bag/Shose">Bag/Shose</option>
						<option value="Acc">Acc</option>
						<option value="Sale">Sale</option>
						</select>
					</div>
					<div class="form_section">
						<label>옷사이즈:</label> <input name="productSize">
					</div>
					<div class="form_section">
						<label>옷 색깔:</label> <input name="productColor">
					</div>
					<div class="form_section">
						<label>상품 재고:</label> <input name="productInventory">
					</div>
					<div class="form_section">
						<label></label><textarea rows="20" cols="50" name="productComment" placeholder="상품 코멘트"></textarea>
					</div>
					<br>
					<div class="form_section">
                    		<div class="form_section_title">
                    			<label>상품 이미지:</label>
                    		</div>
                    		<div class="form_section_content">
                    		<input type="file" id ="productImg" name='uploadFile' style="height: 30px;" multiple="multiple"/>
 							<div id="uploadResult"></div>
 							<div class="form_section_title">
                    			<label>사이즈 가이드:</label>
                    		</div>
 						    <input type="file" id ="productImg2" name='uploadFile2' style="height: 30px;" multiple="multiple"/>
 							<div id="uploadResult2"></div>
 							</div>
                    			
                    		</div>
                       
					<div class="btn_section">
						<button id="cancelBtn" class="btn">취 소</button>
						<button id="enrollBtn" class="btn enroll_btn">등 록</button>
						
					</div>
				  </form> 
				</div>
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
			$("input[name='uploadFile']").on("change", function(e){
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
			/* 이미지 업로드 */
			$("input[name='uploadFile2']").on("change", function(e){
				/* 이미지 존재시 삭제 */
				if($(".imgDeleteBtn2").length > 0){
					deleteFile2();
				}
				let formData = new FormData();
				let fileInput = $('input[name="uploadFile2"]');
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
			    		showUploadImage2(result);
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
				str += "<input type='hidden' name='imageList[0].imageId' value='1'>";
				str += "</div>";
				console.log(str)
				uploadResult.append(str);     
			}
			/* 이미지 출력 */
			function showUploadImage2(uploadResultArr){
				/* 전달받은 데이터 검증 */
				if(!uploadResultArr || uploadResultArr.length == 0){return}
				let uploadResult = $("#uploadResult2");
				let obj = uploadResultArr[0];
				let str = "";
				let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
				
				str += "<div id='result_card2'>";
				str += "<img src='/display?fileName=" + fileCallPath +"'>";
				str += "<div class='imgDeleteBtn2' data-file='" + fileCallPath + "'>x</div>";
				str += "<input type='hidden' name='imageList[1].fileName' value='"+ obj.fileName +"'>";
				str += "<input type='hidden' name='imageList[1].uuid' value='"+ obj.uuid +"'>";
				str += "<input type='hidden' name='imageList[1].uploadPath' value='"+ obj.uploadPath +"'>";	
				str += "<input type='hidden' name='imageList[1].imageId' value='2'>";
				str += "</div>";
				console.log(str)
				uploadResult.append(str);     
			}			
			/* 이미지 삭제 버튼 동작 */
			$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
				
				deleteFile();
				
			});
			$("#uploadResult2").on("click", ".imgDeleteBtn2", function(e){
				
				deleteFile2();
				
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
				function deleteFile2(){
				
				let targetFile = $(".imgDeleteBtn2").data("file");
				
				let targetDiv = $("#result_card2");
				
				$.ajax({
					url: '/admin/deleteFile',
					data : {fileName : targetFile},
					dataType : 'text',
					type : 'POST',
					success : function(result){
						console.log(result);
						
						targetDiv.remove();
						$("input[type='file2']").val("");
						
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