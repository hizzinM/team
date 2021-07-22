<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품개별조회</title>
	<link rel="stylesheet" href="/resources/css/common-style/reset.css">
	<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
	<link rel="stylesheet" href="/resources/css/common-style/contents.css">
	<link rel="stylesheet" href="/resources/css/common-style/productdetail.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="include_collection/navigation.jsp"%>
	</div>
    <div id="contents">
        <div id="prodct-ex_wrap">
            <div class="product_img">
                <img src="/resources/upload/${goodDetailData.uploadPath}/${goodDetailData.uuid}_${goodDetailData.fileName}" alt="">
            </div>

            <div id="detail_wrap">
                <div class="detail-title-box">
                    <p class="productId"><c:out value="${goodDetailData.productId}" /></p>
                    <p class="productName"><c:out value="${goodDetailData.productName}" /><span><c:out value="${goodDetailData.productCategory}" /></span></p>
                    <p class="productPrice"><fmt:formatNumber pattern="###,###,###" value="${goodDetailData.productPrice}" />원</p>
                </div>
                <div class="detail-Ex-box">
                    <input type="button" onclick="showComment();" id="commentBtn" class="button_style comment-btn" value="COMMENT">
                    <input type="button" onclick="showGuide();" id="guideBtn" class="button_style guide-btn" value="SIZE GUIDE">
                    <div id="img-guide">
                        <img src="/resources/upload/${goodDetailData.uploadPath2}/${goodDetailData.uuid2}_${goodDetailData.fileName2}" alt="" onerror="this.src='/resources/img/noimg.jpg'">
                    </div>
                    <div id="product-comment">
                        <textarea class="textarea_style text-frame" rows="10" cols="115%" readonly><c:out value="${goodDetailData.productComment}" /></textarea>
                    </div>
                    <script type="text/javascript">
                        function showComment() {
                            document.getElementById("product-comment").style.display = "block";
                            document.getElementById("img-guide").style.display = "none";
                            document.getElementById("commentBtn").style.background = "black";
                            document.getElementById("commentBtn").style.color = "white";
                            document.getElementById("guideBtn").style.background = "white";
                            document.getElementById("guideBtn").style.color = "black";
                        }
                        function showGuide() {
                            document.getElementById("img-guide").style.display = "block";
                            document.getElementById("product-comment").style.display = "none";
                            document.getElementById("guideBtn").style.background = "black";
                            document.getElementById("guideBtn").style.color = "white";
                            document.getElementById("commentBtn").style.background = "white";
                            document.getElementById("commentBtn").style.color = "black";
                        }
                    </script>
                </div>
                <table class="detail-char-box">
                    <tbody>
                        <tr>
                            <td>사이즈</td>
                            <td colspan="2">
                                <c:out value="${goodDetailData.productSize}" /> 
                            </td>
                        </tr>
                        <tr>
                            <td>색상</td>
                            <td colspan="2">
                                <c:out value="${goodDetailData.productColor}" />
                            </td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td>
                                <c:if test="${goodDetailData.productInventory != 0}">
                                    <input type="number" id="product_amount" name="product_amount" class="product_amount text-frame" maxlength="1" oninput="numberMaxLength(this);" placeholder="${goodDetailData.productInventory}개 남음"/>
                                    <input type='hidden' id='productInventory' name='productInventory' value="${goodDetailData.productInventory}" />
                                    <script>
                                        function numberMaxLength(e){
                                            if(e.value.length > e.maxLength){
                                                e.value = e.value.slice(0, e.maxLength);
                                            }
                                        }
                                    </script>
                                </c:if>

                                <c:if test="${goodDetailData.productInventory == 0}">
                                    <p style="color:red;">재고가 없습니다</p>
                                </c:if>
                            </td>

                        </tr>
                    </tbody>
                </table>
                <div id="btn-wrap">
                    <input type="submit" class="button_style cart_btn" id="addcart" value="장바구니에 담기">
                    <input type="button" class="button_style back_btn" value="이전으로 이동" onclick="history.back()"><br>
                    <span id=noinven></span>
                </div>
            </div>

        </div>
        <div id="prodct-img-ex_wrap">
            <img src="/resources/upload/${goodDetailData.uploadPath3}/${goodDetailData.uuid3}_${goodDetailData.fileName3}" alt="" class="prodct-img-ex">
            <img src="/resources/upload/${goodDetailData.uploadPath4}/${goodDetailData.uuid4}_${goodDetailData.fileName4}" alt="" class="prodct-img-ex">
        </div>
		<div id="review_wrap">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>상품이미지</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Reviewlist}" var="Reviewlist">
						<tr>
							<td><c:out value="${Reviewlist.reviewId}" /></td>
							<td><img src="" alt=""></td>
							<td><c:out value="${Reviewlist.reviewTitle}" /></td>
							<td><c:out value="${Reviewlist.userId}" /></td>
							<td><fmt:formatDate value="${Reviewlist.reviewWritedate}"
									pattern="yyyy/MM/dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--  <textarea rows="5" cols="50" id="Detail" name="Detail"></textarea>
            <script>
            	var ckeditor_config = {
   				resize_enaleb : false,
  	 			enterMode : CKEDITOR.ENTER_BR,
   				shiftEnterMode : CKEDITOR.ENTER_P,
   				filebrowserUploadUrl : "/admin/ckUpload"
				 };
 
				 CKEDITOR.replace("Detail", ckeditor_config);
			</script> -->
		<%@ include file="include_collection/footer.jsp"%>
	</div>
         
  <script type="text/javascript">
  $("#addcart").click(function(){
	  var productInventory=$("#productInventory").val();
	  var qty=$("#product_amount").val();
	  productInventory=parseInt(productInventory);
	  qty=parseInt(qty);
	  console.log(productInventory)
      console.log(qty)
	  if(productInventory < qty){
		  alert("재고가비었습니다.");  	
	      return false;
	    }
	  
	  $.ajax({
	   url : "/mypage/addCart",
	   type : "post",
	   data : {productId:"${goodDetailData.productId}",
		   	   productName:"${goodDetailData.productName}",
		   	  cartProductsize:"${goodDetailData.productSize}",
		   			cartPrice:"${goodDetailData.productPrice}",
		   			cartProductColor:"${goodDetailData.productColor}",
		   			cartQty:qty,
		   			fileName:"${goodDetailData.fileName}",
		   			uploadPath:"${goodDetailData.uploadPath}",
		   			uuid:"${goodDetailData.uuid}"
		   			
	   },
	   success : function(result){
		  console.log(productInventory)
	      console.log(qty)
	    if($.trim(result)==1) {
	     alert("카트 담기 성공");
	    }else{
	     alert("회원만 사용할 수 있습니다.");
	    }
	   },
	   error : function(){
		
	   }
	  });
	 });
  </script>
</body>
</html>