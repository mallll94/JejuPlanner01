<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 답변하기</title>



</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">1:1 문의 답변</span></h2> 
        </div>
        
        <div align="center">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="writeForm" id="contactForm" novalidate="novalidate" method="post" action="${pageContext.request.contextPath}/reply/insert" >                    
                      

                      <input type="hidden" name="askId" value="${askId}"/>
                      
                      <div class="control-group" style="text-align: left;">
                            제목 <input type="text" readonly class="form-control" id="askTitle" name="askTitle" value="${askboard.askTitle}"/>
                            <p class="help-block text-danger"></p>
                      </div>
                      <div class="control-group" style="text-align: left;">
                           내용 <textarea readonly class="form-control" rows="6" id="askContent" name="askContent" style="resize: none">${askboard.askContent}</textarea>
                            <p class="help-block text-danger"></p>
                      </div>
                      
                       
                       <div class="control-group" style="text-align: left;">
                           답변 <textarea class="form-control" rows="6" id="message" name = "askReplyContent" placeholder="답변을 입력해주세요"
                                required="required" data-validation-required-message="Please enter your message" style="resize: none"></textarea>
                            <p class="help-block text-danger"></p>
                        </div>

						<div align="right">
							<button  class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">등록하기</button>
						</div>
						
					</form>
                
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->
  
</body>
</html>