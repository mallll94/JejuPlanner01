<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 등록하기</title>



</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">1:1 문의</span></h2> 
        </div>
        
       <div style="margin-left: 310px; margin-right: 310px">  
       <textarea class="form-control" style="resize: none; height: 87px">
※공지사항을 참고하시면 자주 올라오는 질문과 답변을 확인하실 수 있습니다.
※주말 및 공휴일(임시 공휴일,법정 공휴일 포함)은 영업 휴무일 인 관계로, 다음 날 신속하게 답변 드리도록 하겠습니다.</textarea><p></p>
       </div> 
        
        <div align="center">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="AskBoard" id="contactForm" novalidate="novalidate" method="post" action="${pageContext.request.contextPath}/board/Askinsert" onSubmit='return checkValid()' enctype="multipart/form-data">
                        
                       <div class="control-group" style="text-align: left;">              
                         상담유형 <select name="askCategory" class="form-select" 
                         aria-label="Default select example">
                            <option value="" selected>Category</option>
                            <option value="회원문의">회원문의</option>
                            <option value="상품문의">상품문의</option>
                            <option value="구매문의">구매문의</option>
                            <option value="플래너문의">플래너문의</option>
                            <option value="사이트이용방법">사이트이용방법</option>
                         </select>
                            <p class="help-block text-danger"></p>
                        </div>
                       
                       
                    <div class="control-group" style="text-align: left;">
                    제목 <input type="text" class="form-control" id="askTitle" name="askTitle" placeholder="제목을 입력해주세요"
                          required="required" data-validation-required-message="Please enter a subject" />
                         <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group" style="text-align: left;">
                    내용 <textarea class="form-control" rows="6" id="askContent" name="askContent" placeholder="내용을 입력해주세요"
                         required="required" data-validation-required-message="Please enter your message"
                         style="resize: none;"></textarea>
                         <p class="help-block text-danger"></p>
                    </div>
	                <div class="control-group" style="text-align: left;">
                    첨부파일 <input type="file" class="form-control" id="askAttach" name="file" placeholder="Attach"
                             required="required" data-validation-required-message="Please enter a file" accept=".png, .jpg" />
                             <p class="help-block text-danger"></p>
	                </div> 

                        <div align="right">
                            <button onclick="location = '/board/AskList'" class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">문의 등록하기</button>
                        </div>
                    
                    </form>
                
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->

    
    
</body>
</html>