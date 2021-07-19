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
    <script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
    <title>상품개별조회</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="/resources/css/common-style/reset.css">
<link rel="stylesheet" href="/resources/css/common-style/side-nav.css">
<link rel="stylesheet" href="/resources/css/common-style/contents.css">
<link rel="stylesheet" href="/resources/css/common-style/productdetail.css">
<style type="text/css">
.goodsimg{
    width:550px;
    height: 700px;    
}
.size{
	 width:775px;
    height: 320px;   
}
</style>
</head>
<body>
	<header>
		<nav></nav>
	</header>
	<div id="side_navigation">
		<%@ include file="include_collection/navigation.jsp"%>
	</div>
    <div id="contents">
    
        <div id="prodct-ex_warp">
            <div>

                <img src="/resources/upload/${goodDetailData.uploadPath}/${goodDetailData.uuid}_${goodDetailData.fileName}" alt="" class="goodsimg">
            </div><br>
            <div>
            	<p>사이즈가이드:</p>
                <img src="/resources/upload/${goodDetailData.uploadPath2}/${goodDetailData.uuid2}_${goodDetailData.fileName2}" alt="" class="size">

            </div>
            
            <div id="detail_warp">
            
                <table>
                    <tr>
                        <td>제품 번호</td>
                        <td><c:out value="${goodDetailData.productId}"/></td>
                    </tr>
                    <tr>
                        <td>제품명</td>
                        <td><c:out value="${goodDetailData.productName}" /></td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><fmt:formatNumber pattern="###,###,###" value="${goodDetailData.productPrice}" />원</td>
                    </tr>
                    <tr>
                        <td>카테고리</td>
                        <td><c:out value="${goodDetailData.productCategory}" /></td>
                    </tr>
                    <tr>
                        <td>사이즈</td>
                        <td><c:out value="${goodDetailData.productSize}" /></td>
                    </tr>
                    <tr>
                        <td>색상</td>
                        <td><c:out value="${goodDetailData.productColor}" /></td>
                    </tr>
                    
                    <tr>
                        <td>재고</td>
                        <td><c:out value="${goodDetailData.productInventory}"/>
                        	<input type='hidden' id='productInventory' name='productInventory' value="${goodDetailData.productInventory}"/></td>													</td>
                    </tr>
                    
                    <c:if test="${goodDetailData.productInventory == 0}">
                    	<p style="color:red;">재고가 없습니다</p>
                    </c:if>
                    <tr>
                        <td>수량</td>
                        <td><select id="amount">
   							 <c:forEach  begin="1" end="10" var="i">
       						 <option id="qty" value="${i}">${i}</option>
   								 </c:forEach>
							</select></td>
                    </tr>
                    <tr>
                        <td colspan="2">상품 설명</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea class="textarea_style" rows="10" cols="115%" readonly>
                                <c:out value="${goodDetailData.productComment}" />
                            </textarea>
                        </td>
                    </tr>
                  
                </table><br>
                <div id="btn-warp">		
             	
                   	<input type="submit" class="button_style cart_btn" id="addcart" value="장바구니에 담기">
					<input type="button" class="button_style back_btn" value="이전으로 이동" onclick="history.back()"><br>
					<span id=noinven></span>
                </div>
            </div>
            <div class="inputArea">
            <label for="Detail">디테일</label>
            <textarea rows="5" cols="50" id="Detail" name="Detail"></textarea>
            <script>
            	var ckeditor_config = {
   				resize_enaleb : false,
  	 			enterMode : CKEDITOR.ENTER_BR,
   				shiftEnterMode : CKEDITOR.ENTER_P,
   				filebrowserUploadUrl : "/admin/ckUpload"
				 };
 
				 CKEDITOR.replace("Detail", ckeditor_config);
			</script>
           </div>
        
        </div>
		<%@ include file="include_collection/footer.jsp"%>
    </div>
    
    
    
    
    
  <script type="text/javascript">
  $("#addcart").click(function(){
	  var productInventory=$("#productInventory").val();
	  var qty=$("#amount option:selected").val();
	  
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
		   			cartQty:$("#amount option:selected").val(),
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