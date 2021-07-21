<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="/resources/css/admin/index.css">
<link rel="stylesheet" href="/resources/css/admin/updateDeleteButton.css">
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
</style>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/admin_frame.css">
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
		<div id="container_box" align="center">
			<div>&nbsp;</div>
			<h2>상품수정</h2>
		</div> 
		<div align="center"> 
			<form action="/admin/Update" method="post"> 

	
				<table>
					<thead>
						<tr>
							<th class="username_width">ID</th>
							<th class="userid_width">상품이미지</th>
							<th class="userid_width">사이즈가이드</th>
							<th class="userid_width">상품상세이미지1</th>
							<th class="userid_width">상품상세이미지2</th>
							<th class="userphone_width">상품명</th>
							<th class="useremail_width">가격</th>
							<th class="useremail_width">카테고리</th>
							<th class="useraddress_width">사이즈</th>
							<th class="useregdate_width">색깔</th>
							<th class="useregdate_width">재고</th>
							<th class="useregdate_width">코멘트</th>
						</tr>
					</thead>
					<tr>
						<td><input type="text" readonly="readonly" name="productId"
							value="${goodsUpdateData.productId}" /></td>
						<td><div class="form_section">
								<div class="form_section_title">
									<label>상품 이미지</label>
								</div>
								<div class="form_section_content">
									<input type="file" id="productImg" name='uploadFile'
										style="height: 30px;">
									<div id="uploadResult"></div>
								</div>
							</div></td>
							<td><input type="file" id ="productImg2" name='uploadFile2' style="height: 30px;" multiple="multiple"/>
 							<div id="uploadResult2"></div></td>
 							
 							<td><input type="file" id ="productImg3" name='uploadFile3' style="height: 30px;" multiple="multiple"/>
 							<div id="uploadResult3"></div></td>
 							
 							<td><input type="file" id ="productImg4" name='uploadFile4' style="height: 30px;" multiple="multiple"/>
 							<div id="uploadResult4"></div></td>
 							
						<td><input type="text" name="productName"
							value="${goodsUpdateData.productName}" /></td>
						<td><input type="text" name="productPrice"
							value="${goodsUpdateData.productPrice}" /></td>

						<td><select name="productCategory">
						<option value="Outer">Outer</option>
						<option value="Top">Top</option>
						<option value="Shirts">Shirts</option>
						<option value="Pants">Pants</option>
						<option value="Suit">Suit</option>
						<option value="Bag/Shose">Bag/Shose</option>
						<option value="Acc">Acc</option>
						<option value="Sale">Sale</option>
						</select></td>
	
						<td><input type="text" name="productSize"
							value="${goodsUpdateData.productSize}" /></td>
						<td><input type="text" name="productColor"
							value="${goodsUpdateData.productColor}" /></td>
						<td><input type="text" name="productInventory"
							value="${goodsUpdateData.productInventory}" /></td>
						<td><textarea rows="20" cols="50" name="productComment"><c:out value="${goodsUpdateData.productComment}"/></textarea></td>
					</tr>
					
				</table>
				
				<br> <input type="submit" value="수정하기">
			</form>
		</div>
		<script type="text/javascript">
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
			/* 이미지 업로드(상품상세이미지1) */
			$("input[name='uploadFile3']").on("change", function(e){
				/* 이미지 존재시 삭제 */
				if($(".imgDeleteBtn3").length > 0){
					deleteFile3();
				}
				let formData = new FormData();
				let fileInput = $('input[name="uploadFile3"]');
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
			    		showUploadImage3(result);
			    	},
			    	error : function(result){
			    		alert("이미지 파일이 아닙니다.");
			    	}
				});	
			});
			/* 이미지 업로드(상품상세이미지4) */
			$("input[name='uploadFile4']").on("change", function(e){
				/* 이미지 존재시 삭제 */
				if($(".imgDeleteBtn4").length > 0){
					deleteFile4();
				}
				let formData = new FormData();
				let fileInput = $('input[name="uploadFile4"]');
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
			    		showUploadImage4(result);
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
			/* 이미지 출력3 */
			function showUploadImage3(uploadResultArr){
				/* 전달받은 데이터 검증 */
				if(!uploadResultArr || uploadResultArr.length == 0){return}
				let uploadResult = $("#uploadResult3");
				let obj = uploadResultArr[0];
				let str = "";
				let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
				
				str += "<div id='result_card3'>";
				str += "<img src='/display?fileName=" + fileCallPath +"'>";
				str += "<div class='imgDeleteBtn3' data-file='" + fileCallPath + "'>x</div>";
				str += "<input type='hidden' name='imageList[2].fileName' value='"+ obj.fileName +"'>";
				str += "<input type='hidden' name='imageList[2].uuid' value='"+ obj.uuid +"'>";
				str += "<input type='hidden' name='imageList[2].uploadPath' value='"+ obj.uploadPath +"'>";	
				str += "<input type='hidden' name='imageList[2].imageId' value='3'>";
				str += "</div>";
				console.log(str)
				uploadResult.append(str);     
			}			
			/* 이미지 출력4*/
			function showUploadImage4(uploadResultArr){
				/* 전달받은 데이터 검증 */
				if(!uploadResultArr || uploadResultArr.length == 0){return}
				let uploadResult = $("#uploadResult4");
				let obj = uploadResultArr[0];
				let str = "";
				let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
				
				str += "<div id='result_card4'>";
				str += "<img src='/display?fileName=" + fileCallPath +"'>";
				str += "<div class='imgDeleteBtn4' data-file='" + fileCallPath + "'>x</div>";
				str += "<input type='hidden' name='imageList[3].fileName' value='"+ obj.fileName +"'>";
				str += "<input type='hidden' name='imageList[3].uuid' value='"+ obj.uuid +"'>";
				str += "<input type='hidden' name='imageList[3].uploadPath' value='"+ obj.uploadPath +"'>";	
				str += "<input type='hidden' name='imageList[3].imageId' value='4'>";
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
			$("#uploadResult3").on("click", ".imgDeleteBtn3", function(e){
				
				deleteFile3();
				
			});
			$("#uploadResult4").on("click", ".imgDeleteBtn4", function(e){
				
				deleteFile4();
				
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
				function deleteFile3(){
					
					let targetFile = $(".imgDeleteBtn3").data("file");
					
					let targetDiv = $("#result_card3");
					
					$.ajax({
						url: '/admin/deleteFile',
						data : {fileName : targetFile},
						dataType : 'text',
						type : 'POST',
						success : function(result){
							console.log(result);
							
							targetDiv.remove();
							$("input[type='file3']").val("");
							
						},
						error : function(result){
							console.log(result);
							
							alert("파일을 삭제하지 못하였습니다.")
						}
					});
					}
				
				function deleteFile4(){
					
					let targetFile = $(".imgDeleteBtn4").data("file");
					
					let targetDiv = $("#result_card4");
					
					$.ajax({
						url: '/admin/deleteFile',
						data : {fileName : targetFile},
						dataType : 'text',
						type : 'POST',
						success : function(result){
							console.log(result);
							
							targetDiv.remove();
							$("input[type='file4']").val("");
							
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