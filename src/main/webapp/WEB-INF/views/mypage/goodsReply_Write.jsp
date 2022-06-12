<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기 작성하기</title>
</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">상품후기 등록</span></h2> 
        </div>
        
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="goodsReply" id="contactForm" novalidate="novalidate" method="post" action="${pageContext.request.contextPath}/mypage/goodsReply_Write" onSubmit='return checkValid()' enctype="multipart/form-data">
                        
<!--                        <div class="control-group">
                         카테고리 <select name="freeCategory" class="form-select" aria-label="Default select example">
                            <option selected>카테고리 선택</option>
                            <option value="여행추천">여행추천</option>
                            <option value="장소추천">장소추천</option>                                                   
                         </select>
                            <p class="help-block text-danger"></p>
                        </div>                    -->    
                    <div class="control-group">
                    제목 <input type="text" class="form-control" id="goodsReplyTitle" name="goodsReplyTitle" placeholder="상품 이름을 입력해주세요 (가져오기로 변경.)"
                          required="required" data-validation-required-message="Please enter a subject" />
                         <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                    내용 <textarea class="form-control" rows="6" id="goodsReplyContent" name="goodsReplyContent" placeholder="후기를 입력해주세요."
                         required="required" data-validation-required-message="Please enter your message"></textarea>
                         <p class="help-block text-danger"></p>
                    </div>
	                <div class="control-group">
                   	사진 <input type="file" class="form-control" id="goodsReplyAttach" name="file" placeholder="Attach"
                             required="required" data-validation-required-message="Please enter a file" accept=".png, .jpg" />
                             <p class="help-block text-danger"></p>
	                </div> 

                        <div align="right">
                            <button onclick="location = '/admin/goodsReply_Admin'" class="btn btn-primary py-1 px-2" type="submit" id="sendMessageButton">등록하기</button>
                        </div>
                    
                    </form>
                
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->

    
    
</body>
</html>