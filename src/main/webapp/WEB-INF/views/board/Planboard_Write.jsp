<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>


    

</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">플래너공유 게시판</span></h2> 
        </div>
        
        <div align="center">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="planBoard" id="contactForm" novalidate="novalidate" method="post" action="${pageContext.request.contextPath}/board/pinsert" onSubmit='return checkValid()' enctype="multipart/form-data">
                        
                       <div class="control-group" style="text-align: left;">
                         카테고리 <select name="pboardCategory" class="form-select" aria-label="Default select example">
                            <option selected>Category</option>
                            <option value="나홀로">나홀로</option>
                            <option value="가족/부모님">가족/부모님</option>
                            <option value="친구">친구</option>
                            <option value="연인">연인</option>
                            
                         </select>
                            <p class="help-block text-danger"></p>
                        </div>
                       
                       
                    <div class="control-group" style="text-align: left;">
                    제목 <input type="text" class="form-control" id="pboardTitle" name="pboardTitle" placeholder="제목을 입력해주세요"
                          required="required" data-validation-required-message="Please enter a subject" />
                         <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group" style="text-align: left;">
                    내용 <textarea class="form-control" rows="6" id="pboardContent" name="pboardContent" placeholder="내용을 입력해주세요"
                         required="required" data-validation-required-message="Please enter your message" style="resize: none"></textarea>
                         <p class="help-block text-danger"></p>
                    </div>
	                <div class="control-group" style="text-align: left;">
                    첨부파일 <input type="file" class="form-control" id="pboardAttach" name="file" placeholder="Attach"
                             required="required" data-validation-required-message="Please enter a file" accept=".png, .jpg" />
                             <p class="help-block text-danger"></p>
	                </div> 

                        <div align="right">
                            <button onclick="location = '/board/PlanboardList'" class="btn btn-primary py-1 px-2" type="submit" id="sendMessageButton">등록하기</button>
                        </div>
                    
                    </form>
                
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->

    
    
</body>
</html>